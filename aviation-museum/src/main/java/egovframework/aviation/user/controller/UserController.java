package egovframework.aviation.user.controller;


import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Cipher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuAuthorityVO;
import egovframework.aviation.group.vo.MenuCodeVO;
import egovframework.aviation.group.vo.PossessionAuthorityVO;
import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private MetaDataService metaDataService;
	
//	@GetMapping("/main.do")
//	public String Main(HttpServletRequest req, Model model) throws Exception {
//			model.addAttribute("session", req.getSession().getId());
//		
//		return "main/main";
//	}
	
	@GetMapping("/login.do")
	public String Login(HttpServletRequest req) throws Exception {
		
		try {
			KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
			generator.initialize(1024);

			KeyPair keyPair = generator.genKeyPair();
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");

			PublicKey publicKey = keyPair.getPublic();
			PrivateKey privateKey = keyPair.getPrivate();

			HttpSession session = req.getSession();
			// 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
			session.setAttribute("__rsaPrivateKey__", privateKey);

			// 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
			RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

			String publicKeyModulus = publicSpec.getModulus().toString(16);
			String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

			req.setAttribute("publicKeyModulus", publicKeyModulus);
			req.setAttribute("publicKeyExponent", publicKeyExponent);
			
		} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
		}
		
		return "login/login";
	}
	
	@PostMapping("/login.do")
	public String Login(@ModelAttribute("user") UserVO user, @ModelAttribute("userJoinVO") UserJoinVO userJoinVO, Model model, HttpServletRequest req) throws Exception {
			
		String securedUsername = req.getParameter("securedUsername");
		String securedPassword = req.getParameter("securedPassword");

		HttpSession session = req.getSession();
		PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
		session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.

		if (privateKey == null) {
		    throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
		}
		String username;
		String password;
		try {
		     username = decryptRsa(privateKey, securedUsername);
		     password = decryptRsa(privateKey, securedPassword);
		    user.setMember_id(username);
		    user.setMember_pw(password);
		} catch (Exception ex) {
		    throw new ServletException(ex.getMessage(), ex);
		}
		List<UserVO> list = userService.login(user);
		
		if(list == null || list.isEmpty()) {
			return "jsonView";
		}else {
			String dbPassword = list.get(0).getMember_pw();
			userJoinVO.setMember_idx(list.get(0).getMember_idx());
			userJoinVO.setPerPageNum(1);
			userJoinVO.setPageStart(0);
			List<UserJoinVO> list2 = userService.getUserList(userJoinVO);	
			
			if(password.equals(dbPassword)) {
					System.out.println("일치"+session.getId());
					session.setAttribute("userSession", session.getId());
					session.setAttribute("userSessionIdx", list.get(0).getMember_idx());
					session.setAttribute("userSessionId", username);
					session.setAttribute("userSessionNm", list.get(0).getMember_nm());
					session.setAttribute("userSessionGroupIdx", list.get(0).getGroup_idx());
					session.setAttribute("userSessionRegDate", list.get(0).getReg_date());
					session.setAttribute("userSessionModDate", list.get(0).getMod_date());
					session.setAttribute("userSessionOrgCodeIdx", list2.get(0).getOrg_code_idx());
					model.addAttribute("list", list);
					model.addAttribute("session", session.getId());
				return "jsonView";
			}else {
				return "jsonView";
			}
			
		}
		
//		if(list == null || list.isEmpty()) {
//			return "/login.do";
//		} else {
////			HttpSession session = req.getSession();
//			session.setAttribute("userSession", session.getId());
//			model.addAttribute("list", list);
//			model.addAttribute("session", session.getId());
//			return "main/main";
//		}
	}
 
	private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        System.out.println("will decrypt : " + securedValue);
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }

    /**
     * 16진 문자열을 byte 배열로 변환한다.
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
	@GetMapping("/logout.do")
	public String Logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/login.do";
	}
	/** 사용자 관리 메인 */
	@GetMapping("/usermgr.do")
	public String UserMgr(HttpServletRequest req) throws Exception {

		return "userMgr/userMgr_main";
	}
	/** 사용자 목록 조회 */
	@RequestMapping("/usermgr/userListAjax.do")
	public String UserListAjax(@ModelAttribute("userJoinVO") UserJoinVO userJoinVO, @ModelAttribute("groupVO") GroupVO groupVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		int perPageNum = userService.getUserListCnt(userJoinVO);		
		int groupPerPageNum = groupService.getGroupListCnt(groupVO);	
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    userJoinVO.setPageStart(cri.getPageStart());
	    userJoinVO.setPerPageNum(cri.getPerPageNum());
	    groupVO.setPerPageNum(groupPerPageNum);
	    
		List<UserJoinVO> userList = userService.getUserList(userJoinVO);
		List<GroupVO> groupList = groupService.getGroupList(groupVO);

		model.addAttribute("userList", userList);
		model.addAttribute("perPageNum", perPageNum);		
		model.addAttribute("groupList", groupList);
		model.addAttribute("pageMaker", pageMaker);
		
		return "userMgr/userMgr_List";
	}
	/** 사용자 등록 */
	@RequestMapping(value = "/userinsert.do")
    public String UserInsert(HttpServletRequest req, @ModelAttribute("UserVO") UserVO userVO, Model model) throws Exception {
		
		int result = userService.insertUser(userVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }   
	/** 사용자 수정 팝업 */
	@RequestMapping(value = "/userModPopupAjax.do")
    public String UserModPopupAjax(HttpServletRequest req, @ModelAttribute("userJoinVO") UserJoinVO userJoinVO, Model model) throws Exception {
		userJoinVO.setPerPageNum(1);
		List<UserJoinVO> userListView = userService.getUserList(userJoinVO);
		System.out.println("userListView"+userListView);
		if(userListView.size() >0) {
			userJoinVO.setMember_idx(userListView.get(0).getMember_idx());	
			userJoinVO.setMember_id(userListView.get(0).getMember_id());	
			userJoinVO.setMember_nm(userListView.get(0).getMember_nm());
			userJoinVO.setGroup_idx(userListView.get(0).getGroup_idx());
			userJoinVO.setGroup_nm(userListView.get(0).getGroup_nm());
			userJoinVO.setRemark(userListView.get(0).getRemark());
			userJoinVO.setEnabled(userListView.get(0).getEnabled());
			
		}
//    	model.addAttribute("groupListView", groupListView);
    	
        return "jsonView";
    }   
	/** 사용자 수정 */
	@RequestMapping(value = "/userupdate.do")
    public String UserUpdate(HttpServletRequest req, @ModelAttribute("userVO") UserVO userVO, Model model) throws Exception {
		
		int result = userService.updateUser(userVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	/** 사용자 사용여부 */
	@RequestMapping(value = "/userListEnabled.do")
    public String UserListEnabled(HttpServletRequest req, @ModelAttribute("userVO") UserVO userVO, Model model) throws Exception {
	
		int result = userService.updateUserListEnabled(userVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}	
        return "jsonView";
    } 
	/** 사용자 등록 중복체크 */
	@RequestMapping(value = "/duplicateCheck.do")
    public String DuplicateCheck(HttpServletRequest req, @ModelAttribute("userJoinVO") UserJoinVO userJoinVO, Model model) throws Exception {
		System.out.println("userJoinVO"+userJoinVO);
		List<UserJoinVO> userListView = userService.getDuplicateCheck(userJoinVO);
		String result = "";
		
		if(userListView.size() >0) {
			 result = "success";
			 userJoinVO.setResult(result);
		}
        return "jsonView";
    } 
	
	//////////////////////////////사용자 권한 관리
	
	/** 사용자 관리권한 메인 */
	@GetMapping("/userauthmgr.do")
	public String UserAuthMgr(HttpServletRequest req, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {
		
		String group_idx = groupVO.getGroup_idx();
		  
		groupVO.setGroup_idx(null);
		
	    int groupPerPageNum = groupService.getGroupListCnt(groupVO);			
	    groupVO.setPerPageNum(groupPerPageNum);    
		List<GroupVO> groupList = groupService.getGroupList(groupVO);
		String groupListFirst = groupList.get(0).getGroup_idx();

		if(group_idx != null) {
			groupVO.setGroup_idx(group_idx);
		}else {
			groupVO.setGroup_idx(groupListFirst);
		}
		
		model.addAttribute("getGroup_idx", groupVO.getGroup_idx());
		return "userAuthMgr/userAuthMgr_main";
	}
	
	/** 사용자 관리권한 그룹 관리권한 조회 */
	@RequestMapping("/userAuthGroupAjax.do")
	public String UserAuthGroupAjax(@ModelAttribute("userJoinVO") UserJoinVO userJoinVO, @ModelAttribute("groupVO") GroupVO groupVO, @ModelAttribute("menuCodeVO") MenuCodeVO menuCodeVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String group_idx = groupVO.getGroup_idx();
		groupVO.setOrg_code_idx(String.valueOf(req.getSession().getAttribute("userSessionOrgCodeIdx")));
		groupVO.setGroup_idx(null);
		
	    int groupPerPageNum = groupService.getGroupListCnt(groupVO);			
	    groupVO.setPerPageNum(groupPerPageNum);    
		List<GroupVO> groupList = groupService.getGroupList(groupVO);
		String groupListFirst = groupList.get(0).getGroup_idx();

		if(group_idx != null) {
			groupVO.setGroup_idx(group_idx);
		}else {
			groupVO.setGroup_idx(groupListFirst);
		}
		List<MenuCodeVO> menuCodeList = userService.getMenuCodeList(menuCodeVO);
		List<MenuCodeVO> menuCodeListLarge = userService.getMenuCodeListLarge(menuCodeVO);
		List<UserVO> groupUserList = userService.getGroupUserList(groupVO);
		List<MenuCodeVO> groupMenuList = userService.getGroupMenuList(groupVO);	
		
		model.addAttribute("getGroup_idx", groupVO.getGroup_idx());
		model.addAttribute("groupList", groupList);
		model.addAttribute("menuCodeList", menuCodeList);
		model.addAttribute("menuCodeListLarge", menuCodeListLarge);
		model.addAttribute("groupUserList", groupUserList);
		model.addAttribute("groupMenuList", groupMenuList);
		
		return "userAuthMgr/userAuthMgr_Group";
	}
	
	/** 사용자 관리권한 > 그룹 관리권한 > 권한수정 */
	@RequestMapping(value = "/menuAuthUpdate.do")
    public String MenuAuthUpdate(HttpServletRequest req, @ModelAttribute("menuAuthorityVO") MenuAuthorityVO menuAuthorityVO, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {

		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		String group_idx = req.getParameter("group_idx");
		String[] arrStr = req.getParameterValues("menuAuth_List");
		
		int result = groupService.deleteAuthority(groupVO);
		int result2 = 0;
		 try {
		       if(arrStr !=null && arrStr.length > 0) {
		            for(int i=0; i<arrStr.length; i++) {
		               System.out.println("ajax traditional result : " + i +" : "+ group_idx);
		               System.out.println("ajax traditional result : " + i +" : "+ arrStr[i]);

		               menuAuthorityVO.setGroup_idx(group_idx);
		               menuAuthorityVO.setMenu_code_idx(arrStr[i]);
		               result2 = groupService.insertMenuAuthority(menuAuthorityVO);
		       	    }
		       	   
		       	} else {
		      	    resultMap.put("result", "false");
		      	}
		    } catch (Exception e) {
		        e.printStackTrace();
		   }	  
		
		String success = "";
		String success2 = "";
		
		if(result > 0 && result2 > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** 사용자 관리권한 가등록 자료관리 권한 조회 */
	@RequestMapping("/userPreRegisterGroupAjax.do")
	public String UserPreRegisterGroupAjax(@ModelAttribute("userJoinVO") UserJoinVO userJoinVO, @ModelAttribute("groupVO") GroupVO groupVO, @ModelAttribute("menuCodeVO") MenuCodeVO menuCodeVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {		
		String group_idx = groupVO.getGroup_idx();
		groupVO.setOrg_code_idx(String.valueOf(req.getSession().getAttribute("userSessionOrgCodeIdx")));

		groupVO.setGroup_idx(null);
		
	    int groupPerPageNum = groupService.getGroupListCnt(groupVO);			
	    groupVO.setPerPageNum(groupPerPageNum);    
		List<GroupVO> groupList = groupService.getGroupList(groupVO);
		System.out.println("groupList"+groupList);
		if(group_idx != null) {
			groupVO.setGroup_idx(group_idx);
		}else {
			String groupListFirst = groupList.get(0).getGroup_idx();
			groupVO.setGroup_idx(groupListFirst);
		}
		List<UserVO> groupUserList = userService.getGroupUserList(groupVO);
		List<PosSessionVO> groupPossessionList = userService.getGroupPossessionList(groupVO);	
		List<PosSessionVO> possessionList = userService.getPosSession2(groupVO);
		
		model.addAttribute("getGroup_idx", groupVO.getGroup_idx());
		model.addAttribute("groupList", groupList);
		model.addAttribute("groupUserList", groupUserList);
		model.addAttribute("groupPossessionList", groupPossessionList);
		model.addAttribute("possessionList", possessionList);
		
		return "userAuthMgr/userAuthMgr_PreRegister";
	}
	
	/** 사용자 관리권한 > 가등록 자료 관리권한 > 권한수정 */
	@RequestMapping(value = "/possessionAuthUpdate.do")
    public String PossessionAuthUpdate(HttpServletRequest req, @ModelAttribute("possessionAuthorityVO") PossessionAuthorityVO possessionAuthorityVO, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {
		possessionAuthorityVO.setOrg_code_idx(String.valueOf(req.getSession().getAttribute("userSessionOrgCodeIdx")));

		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		String group_idx = req.getParameter("group_idx");
		String[] arrStr = req.getParameterValues("possession_Code_List");
		
		int result = groupService.deletePossessionAuthority(groupVO);
		int result2 = 0;
		 try {
		       if(arrStr !=null && arrStr.length > 0) {
		            for(int i=0; i<arrStr.length; i++) {
		               System.out.println("ajax traditional result : " + i +" : "+ group_idx);
		               System.out.println("ajax traditional result : " + i +" : "+ arrStr[i]);

		               possessionAuthorityVO.setGroup_idx(group_idx);
		               possessionAuthorityVO.setPossession_code_idx(arrStr[i]);
		               result2 = groupService.insertPossessionAuthority(possessionAuthorityVO);
		       	    }
		       	   
		       	} else {
		      	    resultMap.put("result", "false");
		      	}
		    } catch (Exception e) {
		        e.printStackTrace();
		   }	  
		
		String success = "";
		String success2 = "";
		
		if(result > 0 && result2 > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
}
