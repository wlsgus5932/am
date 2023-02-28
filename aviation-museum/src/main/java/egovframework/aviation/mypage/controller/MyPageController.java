package egovframework.aviation.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.service.MyPageService;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.mypage.vo.Speciality1VO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.CodeMgrService;
import egovframework.aviation.preferences.vo.SpecialityVO;
import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private UserService userService;
	@Autowired
	private CodeMgrService codeMgrService;
	@Autowired
	private MetaDataService metaDataService;
	/** 코드 관리 메인 */
	@GetMapping("/myPage.do")
	public String myPage(HttpServletRequest req) throws Exception {
		return "mypage/myPage_Main";
	}	
	
	/** 관심자료관리 조회 */
	@RequestMapping("/interestAjax.do")
	public String InterestAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		interestVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getInterestListCnt(interestVO);		
		if(interestVO.getPerPageNum() != 0) {
			int criPerPageNum = interestVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    interestVO.setPageStart(cri.getPageStart());
	    interestVO.setPerPageNum(cri.getPerPageNum());

		List<InterestVO> interestList = myPageService.getInterestList(interestVO);
		
    	model.addAttribute("interestList", interestList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "mypage/myPage_Interest";
	}
	
	/** 관심자료 삭제 */
	@RequestMapping(value = "/interestDelete.do")
    public String InterestDelete(HttpServletRequest req, @ModelAttribute("interestVO") InterestVO interestVO, Model model) throws Exception {
		int result = myPageService.deleteInterest(interestVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
//	/** 요청내역조회 조회 */
	@RequestMapping("/requestHistoryAjax.do")
	public String RequestHistoryAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		requestHistoryVO.setReg_user(userSessionId);
		 
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
//		if(requestHistoryVO.getOrg_nm() == null) {
//			requestHistoryVO.setOrg_nm(getOrgList.get(0).getOrg_nm());	
//		}
		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);	
		
    	int perPageNum = myPageService.getRequestHistoryListCnt(requestHistoryVO);		
		if(requestHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = requestHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    requestHistoryVO.setPageStart(cri.getPageStart());
	    requestHistoryVO.setPerPageNum(cri.getPerPageNum());

		List<RequestHistoryVO> requestHistoryList = myPageService.getRequestHistoryList(requestHistoryVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("getPosSessionList", getPosSessionList);
    	model.addAttribute("requestHistoryList", requestHistoryList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_RequestHistory";
	}
	
//	/** 자료구분조회 */
	@RequestMapping("/requestHistoryPossessionAjax.do")
	public String RequestHistoryPossessionAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {

		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);
		
		model.addAttribute("getPosSessionList", getPosSessionList);
    	
		return "mypage/myPage_RequestHistory_Possession";
	}
	
//	/** 반려사유팝업 */
	@RequestMapping("/refusalReasonAjax.do")
	public String RefusalReasonAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {
		RequestHistoryVO RefusalReason = new RequestHistoryVO();
		
		if(requestHistoryVO.getKeyword().equals("keyword")) {
			RefusalReason = myPageService.getKeywordRefusalReason(requestHistoryVO);
		}else {			 
			 RefusalReason = myPageService.getErasureRefusalReason(requestHistoryVO);
		}
	
		model.addAttribute("RefusalReason", RefusalReason);
	
		return "jsonView";
	}
	/** 등록전문정보 조회 */
	@RequestMapping("/rgstrSpecialityAjax.do")
	public String RgstrSpecialityAjax(@ModelAttribute("speciality1VO") Speciality1VO speciality1VO, @ModelAttribute("specialityVO") SpecialityVO specialityVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		speciality1VO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getSpecialityListCnt(speciality1VO);		
		if(speciality1VO.getPerPageNum() != 0) {
			int criPerPageNum = speciality1VO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    speciality1VO.setPageStart(cri.getPageStart());
	    speciality1VO.setPerPageNum(cri.getPerPageNum());

		List<Speciality1VO> specialityList = myPageService.getSpecialityList(speciality1VO);
		
		List<SpecialityVO> specialityCodeList = codeMgrService.getSpecialityList(specialityVO);
		
		model.addAttribute("specialityCodeList", specialityCodeList);
    	model.addAttribute("specialityList", specialityList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "mypage/myPage_RgstrSpeciality";
	}
	
	/** 개인정보변경 조회 */
	@RequestMapping("/changePrivacyAjax.do")
	public String ChangePrivacyAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		return "mypage/myPage_ChangePrivacy";
	}
	
	/** 개인정보변경 조회2 */
	@RequestMapping("/changePrivacyAjax2.do")
	public String ChangePrivacyAjax2(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		return "mypage/myPage_ChangePrivacy2";
	}
	
	/** 개인정보변경 변경 */
	@RequestMapping("/userPwChangeAjax.do")
	public String UserPwChangeAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		int result = userService.updateUserPassWord(userVO);
		
		if(result > 0) {
			 model.addAttribute("success", "success");
		}
		return "jsonView";
	}
	
	/** 작업내역 조회 */
	@RequestMapping("/workHistoryAjax.do")
	public String WorkHistoryAjax(@ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryList = myPageService.getWorkHistoryList(workHistoryVO);
		
    	model.addAttribute("workHistoryList", workHistoryList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_WorkHistory";
	}
	
	@RequestMapping("/workHistoryViewAjax.do")
	public String WorkHistoryViewAjax(Model model, HttpServletRequest req, @ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryViewListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryViewList = myPageService.getWorkHistoryViewList(workHistoryVO);
		
    	model.addAttribute("workHistoryViewList", workHistoryViewList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_WorkHistoryView";
	}
	
	/** 계정확인 */
	@RequestMapping("/userConfirmAjax.do")
	public String UserConfirmAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {

		List<UserVO> userConfirm = userService.login(userVO);
		
		model.addAttribute("userConfirm", userConfirm);
		return "jsonView";
	}
	
	@RequestMapping(value = "/interestExcelDownload.do" )
	public Object InterestExcelDownload(HttpServletRequest req, Model model, @ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("criteria") Criteria cri) throws Exception {

		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		interestVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getInterestListCnt(interestVO);		
		if(interestVO.getPerPageNum() != 0) {
			int criPerPageNum = interestVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    interestVO.setPageStart(0);
	    interestVO.setPerPageNum(100000);

		List<InterestVO> interestList = myPageService.getInterestList(interestVO);
    	
		model.addAttribute("interestList", interestList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "mypage/excel/interestExcelList";
	}
	
	@RequestMapping(value = "/rgstrExcelDownload.do" )
	public Object RgstrExcelDownload(HttpServletRequest req, Model model,@ModelAttribute("speciality1VO") Speciality1VO speciality1VO, @ModelAttribute("specialityVO") SpecialityVO specialityVO, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		speciality1VO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getSpecialityListCnt(speciality1VO);		
		if(speciality1VO.getPerPageNum() != 0) {
			int criPerPageNum = speciality1VO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    speciality1VO.setPageStart(0);
	    speciality1VO.setPerPageNum(100000);

		List<Speciality1VO> specialityList = myPageService.getSpecialityList(speciality1VO);
		
		List<SpecialityVO> specialityCodeList = codeMgrService.getSpecialityList(specialityVO);
		
		model.addAttribute("specialityCodeList", specialityCodeList);
    	model.addAttribute("specialityList", specialityList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);

		return "mypage/excel/rgstrExcelList";
	}
	
	@RequestMapping(value = "/workHistoryExcelDownload.do" )
	public Object WorkHistoryExcelDownload(HttpServletRequest req, Model model, @ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, @ModelAttribute("criteria") Criteria cri) throws Exception {

		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryList = myPageService.getWorkHistoryList(workHistoryVO);
		
    	model.addAttribute("workHistoryList", workHistoryList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/excel/workHistoryExcelList";
	}
	
	@RequestMapping(value = "/workHistoryViewExcelDownload.do" )
	public Object WorkHistoryViewExcelDownload(HttpServletRequest req, Model model, @ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, @ModelAttribute("criteria") Criteria cri) throws Exception {

		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryViewListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryViewList = myPageService.getWorkHistoryViewList(workHistoryVO);
		
    	model.addAttribute("workHistoryViewList", workHistoryViewList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/excel/workHistoryViewExcelList";
	}
	
//	/** 수정 */
	@RequestMapping("/reasonKeywordModAjax.do")
	public String ReasonKeywordModAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {
		int result = 0;	
		
		if(requestHistoryVO.getKeyword().equals("keyword")) {
			result = myPageService.updateKeywordRequest(requestHistoryVO);
		}else {			 
			result = myPageService.updateErasureRequest(requestHistoryVO);
		}
	
//		model.addAttribute("RefusalReason", RefusalReason);
	
		return "jsonView";
	}
}
