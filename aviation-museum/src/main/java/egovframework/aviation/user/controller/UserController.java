package egovframework.aviation.user.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuCodeVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private GroupService groupService;
	
	@GetMapping("/login.do")
	public String Login(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/login";
	}
	
	@PostMapping("/login.do")
	public String Login(@ModelAttribute("user") UserVO user, Model model, HttpServletRequest req) throws Exception {
		List<UserVO> list = userService.login(user);
		if(list == null || list.isEmpty()) {
			return "login/login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("userSession", session.getId());
			model.addAttribute("list", list);
			model.addAttribute("session", session.getId());
			return "main/main";
		}
	}
	
	@GetMapping("/logout.do")
	public String Logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/login";
	}
	/** 사용자 관리 메인 */
	@GetMapping("/usermgr.do")
	public String UserMgr(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
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
		HttpSession session = req.getSession();
		session.invalidate();
		
		int groupPerPageNum = groupService.getGroupListCnt(groupVO);			
	    groupVO.setPerPageNum(groupPerPageNum);
	    
		List<GroupVO> groupList = groupService.getGroupList(groupVO);

		model.addAttribute("groupList", groupList);
		
		return "userAuthMgr/userAuthMgr_main";
	}
	
	/** 사용자 관리권한 그룹 관리권한 조회 */
	@RequestMapping("/userAuthGroupAjax.do")
	public String UserAuthGroupAjax(@ModelAttribute("userJoinVO") UserJoinVO userJoinVO, @ModelAttribute("groupVO") GroupVO groupVO, @ModelAttribute("menuCodeVO") MenuCodeVO menuCodeVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		groupVO.setGroup_idx("2");
		
		List<MenuCodeVO> menuCodeList = userService.getMenuCodeList(menuCodeVO);
		List<UserVO> groupUserList = userService.getGroupUserList(groupVO);
		List<MenuCodeVO> groupMenuList = userService.getGroupMenuList(groupVO);
		
		model.addAttribute("menuCodeList", menuCodeList);
		model.addAttribute("groupUserList", groupUserList);
		model.addAttribute("groupMenuList", groupMenuList);
		
		return "userAuthMgr/userAuthMgr_Group";
	}
	/** 사용자 관리권한 가등록 자료관리 권한 조회 */
	@RequestMapping("/userPreRegisterGroupAjax.do")
	public String UserPreRegisterGroupAjax(@ModelAttribute("userJoinVO") UserJoinVO userJoinVO, @ModelAttribute("groupVO") GroupVO groupVO, @ModelAttribute("menuCodeVO") MenuCodeVO menuCodeVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		List<MenuCodeVO> menuCodeList = userService.getMenuCodeList(menuCodeVO);
		List<UserVO> groupUserList = userService.getGroupUserList(groupVO);
		List<MenuCodeVO> groupMenuList = userService.getGroupMenuList(groupVO);
		
		model.addAttribute("menuCodeList", menuCodeList);
		model.addAttribute("groupUserList", groupUserList);
		model.addAttribute("groupMenuList", groupMenuList);

		return "userAuthMgr/userAuthMgr_PreRegister";
	}
}
