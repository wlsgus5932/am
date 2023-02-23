package egovframework.aviation.preferences.controller;

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
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.ApprovalMgrService;
import egovframework.aviation.preferences.service.OtherMgrService;
import egovframework.aviation.preferences.vo.TagVO;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class ApprovalMgrController {
	
	@Autowired
	private ApprovalMgrService approvalMgrService;
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private MetaDataService metaDataService;
	
	/** 승인 관리 메인 */
	@GetMapping("/approvalMgr.do")
	public String ApprovalMgr(HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model) throws Exception {
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);	

		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("getPosSessionList", getPosSessionList);
		
		return "preferences/approvalMgr/approvalMgr_Main";
	}
	
	/** 삭제 신청 조회 */
	@RequestMapping("/erasureListAjax.do")
	public String ErasureListAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		requestHistoryVO.setReg_user(userSessionId);
		
		
//		if(requestHistoryVO.getOrg_nm() == null) {
//			requestHistoryVO.setOrg_nm(getOrgList.get(0).getOrg_nm());	
//		}
		
    	int perPageNum = approvalMgrService.getErasureListCnt(requestHistoryVO);		
		if(requestHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = requestHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    requestHistoryVO.setPageStart(cri.getPageStart());
	    requestHistoryVO.setPerPageNum(cri.getPerPageNum());

		List<RequestHistoryVO> erasureList = approvalMgrService.getErasureList(requestHistoryVO);
		
    	model.addAttribute("erasureList", erasureList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		
		return "preferences/approvalMgr/approvalMgr_Erasure";
	}
	
	/** 키워드 신청 조회 */
	@RequestMapping("/keywordListAjax.do")
	public String KeywordListAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		requestHistoryVO.setReg_user(userSessionId);
		
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
//		if(requestHistoryVO.getOrg_nm() == null) {
//			requestHistoryVO.setOrg_nm(getOrgList.get(0).getOrg_nm());	
//		}
		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);	
		
    	int perPageNum = approvalMgrService.getKeywordListCnt(requestHistoryVO);		
		if(requestHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = requestHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    requestHistoryVO.setPageStart(cri.getPageStart());
	    requestHistoryVO.setPerPageNum(cri.getPerPageNum());

		List<RequestHistoryVO> keywordList = approvalMgrService.getKeywordList(requestHistoryVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("getPosSessionList", getPosSessionList);
    	model.addAttribute("keywordList", keywordList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		
		return "preferences/approvalMgr/approvalMgr_Keyword";
	}
	
	/** 삭제 승인 */
	@RequestMapping("/erasureApprovalModAjax.do")
	public String ErasureApprovalModAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req) throws Exception {
		System.out.println(requestHistoryVO);
		int result = approvalMgrService.updateErasureApproval(requestHistoryVO);
		
		if(result > 0) {
			 model.addAttribute("success", "success");
		}
		return "jsonView";
	}
	
	/** 키워드 승인 */
	@RequestMapping("/keywordApprovalModAjax.do")
	public String KeywordApprovalModAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req) throws Exception {
		
		if(requestHistoryVO.getApproval_state().equals("Y")){
			if(req.getParameter("allApproval") != null && req.getParameter("allApproval") != "") {
				int result2 = approvalMgrService.insertAllKeyword(requestHistoryVO);
			}else {
				int result2 = approvalMgrService.insertKeyword(requestHistoryVO);
			}
		}
		
		int result = approvalMgrService.updateKeywordApproval(requestHistoryVO);
		
		if(result > 0) {
			 model.addAttribute("success", "success");
		}
		return "jsonView";
	}
	
	/** 자료구분조회 */
	@RequestMapping("/approvalPossessionAjax.do")
	public String ApprovalPossessionAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {

		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);
		
		model.addAttribute("getPosSessionList", getPosSessionList);
    	
		return "preferences/approvalMgr/approvalMgr_Possession";
	}
}
