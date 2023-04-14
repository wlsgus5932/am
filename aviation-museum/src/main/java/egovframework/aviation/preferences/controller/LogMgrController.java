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
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.LogMgrService;
import egovframework.aviation.preferences.vo.AccessLogVO;
import egovframework.aviation.preferences.vo.MovementDetailLogVO;
import egovframework.aviation.preferences.vo.MovementLogVO;
import egovframework.aviation.preferences.vo.SpecialityLogVO;

@Controller
public class LogMgrController {

	@Autowired(required=true)
	private LogMgrService logMgrService;
	@Autowired
	private MetaDataService metaDataService;
	
	/** 로그 관리 메인 */
	@GetMapping("/logMgr.do")
	public String LogMgr(HttpServletRequest req, Model model) throws Exception {
		
		return "preferences/logMgr/logMgr_Main";
	}
	
	/** 자료내역로그 */
	@RequestMapping("/dataHistoryAjax.do")
	public String DataHistoryAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		return "preferences/logMgr/logMgr_DataHistory";
	}
	
	/** 사용자 접속로그 */
	@RequestMapping("/userAccessAjax.do")
	public String UserAccessAjax(@ModelAttribute("accessLogVO") AccessLogVO accessLogVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		List<AccessLogVO> getAccessLogListCnt = logMgrService.getAccessLogList(accessLogVO);
		
		int perPageNum = getAccessLogListCnt.size();		
		if(accessLogVO.getPerPageNum() != 0) {
			int criPerPageNum = accessLogVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    accessLogVO.setPageStart(cri.getPageStart());
	    accessLogVO.setPerPageNum(cri.getPerPageNum());
	    
	    List<AccessLogVO> getAccessLogList = logMgrService.getAccessLogList(accessLogVO);
	
		
		model.addAttribute("getAccessLogList", getAccessLogList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	model.addAttribute("totalCount", getAccessLogListCnt.size());
		return "preferences/logMgr/logMgr_UserAccess";
	}
	
	/** 전문정보 등록로그 */
	@RequestMapping("/specialityRegisterAjax.do")
	public String SpecialityRegisterAjax(@ModelAttribute("specialityLogVO") SpecialityLogVO specialityLogVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		List<SpecialityLogVO> getSpecialityLogListCnt = logMgrService.getSpecialityLogList(specialityLogVO);
		
		int perPageNum = getSpecialityLogListCnt.size();		
		if(specialityLogVO.getPerPageNum() != 0) {
			int criPerPageNum = specialityLogVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    specialityLogVO.setPageStart(cri.getPageStart());
	    specialityLogVO.setPerPageNum(cri.getPerPageNum());
	    
	    List<SpecialityLogVO> getSpecialityLogList = logMgrService.getSpecialityLogList(specialityLogVO);
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
		model.addAttribute("getOrgList", getOrgList);
	    model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("getSpecialityLogList", getSpecialityLogList);
		model.addAttribute("totalCount", getSpecialityLogListCnt.size());
		return "preferences/logMgr/logMgr_SpecialityRegister";
	}
	
	/** 이동사항 내역로그 */
	@RequestMapping("/movementHistoryAjax.do")
	public String MovementHistoryAjax(@ModelAttribute("movementLogVO") MovementLogVO movementLogVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		List<MovementLogVO> getMovementLogListCnt = logMgrService.getMovementLogList(movementLogVO);
		
		int perPageNum = getMovementLogListCnt.size();		
		if(movementLogVO.getPerPageNum() != 0) {
			int criPerPageNum = movementLogVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    movementLogVO.setPageStart(cri.getPageStart());
	    movementLogVO.setPerPageNum(cri.getPerPageNum());
	    
	    List<MovementLogVO> getMovementLogList = logMgrService.getMovementLogList(movementLogVO);
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
		model.addAttribute("getOrgList", getOrgList);
	    model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("getMovementLogList", getMovementLogList);
		model.addAttribute("totalCount", getMovementLogListCnt.size());
		return "preferences/logMgr/logMgr_MovementHistory";
	}

	/** 이동사항 상세내역로그 */
	@RequestMapping("/movementHistoryViewAjax.do")
	public String MovementHistoryViewAjax(@ModelAttribute("movementDetailLogVO") MovementDetailLogVO movementDetailLogVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {

		List<MovementDetailLogVO> getMovementDetailLogList = logMgrService.getMovementDetailLogList(movementDetailLogVO);
		
		model.addAttribute("getMovementDetailLogList", getMovementDetailLogList);
		return "jsonView";
	}
	
	/** 권한 로그 */
	@RequestMapping("/authorityAjax.do")
	public String AuthorityAjax(@ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		return "preferences/logMgr/logMgr_Authority";
	}
}
