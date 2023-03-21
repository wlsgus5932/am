package egovframework.aviation.center.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.center.service.ErrorFixService;
import egovframework.aviation.center.service.FaqService;
import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.ErrorFixVO;
import egovframework.aviation.center.vo.FaqVO;
import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CustomerCenterController {
	
	private final NoticeService noticeService;
	private final FaqService faqService;
	private final ErrorFixService errorFixService;
	
	/** 공지사항 메인 */
	@GetMapping("/notice.do")
	public String Notice(HttpServletRequest req) throws Exception {

		return "center/notice/notice_Main";
	}
	
	/** 공지사항 목록 조회 */
	@RequestMapping("/notice/noticeListAjax.do")
	public String NoticeListAjax(@ModelAttribute("noticeVO") NoticeVO noticeVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		int perPageNum = noticeService.getNoticeListCnt(noticeVO);		
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    noticeVO.setPageStart(cri.getPageStart());
	    noticeVO.setPerPageNum(cri.getPerPageNum());
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "center/notice/notice_List";
	}
	
	/** 공지사항 등록 */
	@RequestMapping(value = "/noticeinsert.do")
    public String NoticeInsert(HttpServletRequest req, @ModelAttribute("NoticeVO") NoticeVO noticeVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		noticeVO.setReg_user(member_id);
		int result = noticeService.insertNotice(noticeVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** 공지사항 상세보기 */
	@RequestMapping(value = "/noticePopupAjax.do")
    public String NoticePopupAjax(HttpServletRequest req, @ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception {
		noticeVO.setPerPageNum(1);
		List<NoticeVO> noticeListView = noticeService.getNoticeList(noticeVO);
		
		if(noticeListView.size() >0) {
			noticeVO.setNotice_title(noticeListView.get(0).getNotice_title());	
			noticeVO.setNotice_content(noticeListView.get(0).getNotice_content());
		}
//    	model.addAttribute("groupListView", groupListView);
    	
        return "jsonView";
    }
	
	/** 공지사항 수정 */
	@RequestMapping(value = "/noticeupdate.do")
    public String NoticeUpdate(HttpServletRequest req, @ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		noticeVO.setMod_user(member_id);
		
		int result = noticeService.updateNotice(noticeVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }
	
	/** 공지사항 선택삭제 */
	@RequestMapping(value = "/noticeListDelete.do")
    public String NoticeListDelete(HttpServletRequest req, @ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception {
		int result = noticeService.deleteNoticeList(noticeVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}	
        return "jsonView";
    }
	
	/** FAQ 메인 */
	@GetMapping("/faq.do")
	public String Faq(HttpServletRequest req) throws Exception {

		return "center/faq/faq_Main";
	}
	
	/** FAQ 목록 조회 */
	@RequestMapping("/faq/faqListAjax.do")
	public String faqListAjax(@ModelAttribute("faqVO") FaqVO faqVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		int perPageNum = faqService.getFaqListCnt(faqVO);		
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    faqVO.setPageStart(cri.getPageStart());
	    faqVO.setPerPageNum(cri.getPerPageNum());
		List<FaqVO> faqList = faqService.getFaqList(faqVO);

		model.addAttribute("faqList", faqList);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "center/faq/faq_List";
	}
	
	/** FAQ 수정팝업 */
	@RequestMapping(value = "/faqPopupAjax.do")
    public String FaqPopupAjax(HttpServletRequest req, @ModelAttribute("faqVO") FaqVO faqVO, Model model) throws Exception {
		faqVO.setPerPageNum(1);
		List<FaqVO> faqListView = faqService.getFaqList(faqVO);
		
		if(faqListView.size() >0) {
			faqVO.setFaq_content(faqListView.get(0).getFaq_content());	
			faqVO.setAnswer_contents(faqListView.get(0).getAnswer_contents());
		}
//    	model.addAttribute("groupListView", groupListView);
    	
        return "jsonView";
    }
	
	/** FAQ 등록 */
	@RequestMapping(value = "/faqinsert.do")
    public String FaqInsert(HttpServletRequest req, @ModelAttribute("faqVO") FaqVO faqVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		faqVO.setReg_user(member_id);
		int result = faqService.insertFaq(faqVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** FAQ 수정 */
	@RequestMapping(value = "/faqupdate.do")
    public String FaqUpdate(HttpServletRequest req, @ModelAttribute("faqVO") FaqVO faqVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		faqVO.setMod_user(member_id);
		
		int result = faqService.updateFaq(faqVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }
	
	/** FAQ 선택삭제 */
	@RequestMapping(value = "/faqListDelete.do")
    public String FaqListDelete(HttpServletRequest req, @ModelAttribute("faqVO") FaqVO faqVO, Model model) throws Exception {
		int result = faqService.deleteFaqList(faqVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}	
        return "jsonView";
    }
	
	/** 오류신고&개선사항 메인 */
	@GetMapping("/errorFix.do")
	public String Error_Fix(HttpServletRequest req) throws Exception {

		return "center/error_fix/error_fix_Main";
	}
	
	/** 오류신고&개선사항 목록 조회 */
	@RequestMapping("/errorFix/errorFixListAjax.do")
	public String ErrorFixListAjax(@ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		int perPageNum = errorFixService.getErrorFixListCnt(errorFixVO);		
		
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    errorFixVO.setPageStart(cri.getPageStart());
	    errorFixVO.setPerPageNum(cri.getPerPageNum());
		List<ErrorFixVO> errorFixList = errorFixService.getErrorFixList(errorFixVO);

		model.addAttribute("errorFixList", errorFixList);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "center/error_fix/error_fix_List";
	}
	
	/** 오류신고&개선사항 수정팝업 */
	@RequestMapping(value = "/errorFixPopupAjax.do")
    public String ErrorFixPopupAjax(HttpServletRequest req, @ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, Model model) throws Exception {
		errorFixVO.setPerPageNum(1);
		List<ErrorFixVO> errorFixListView = errorFixService.getErrorFixList(errorFixVO);
		
		if(errorFixListView.size() >0) {
			errorFixVO.setBoard_type(errorFixListView.get(0).getBoard_type());
			errorFixVO.setError_fix_title(errorFixListView.get(0).getError_fix_title());	
			errorFixVO.setError_fix_content(errorFixListView.get(0).getError_fix_content());
			errorFixVO.setError_fix_org_nm(errorFixListView.get(0).getError_fix_org_nm());
		}
    	
        return "jsonView";
    }
	
	/** 오류신고&개선사항 수정 */
	@RequestMapping(value = "/errorFixupdate.do")
    public String ErrorFixUpdate(HttpServletRequest req, @ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		errorFixVO.setMod_user(member_id);
		
		int result = errorFixService.updateErrorFix(errorFixVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }
	
	/** 오류신고&개선사항 등록 */
	@RequestMapping(value = "/errorFixinsert.do")
    public String ErrorFixInsert(HttpServletRequest req, @ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, Model model) throws Exception {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("userSessionId");
		errorFixVO.setReg_user(member_id);
		int result = errorFixService.insertErrorFix(errorFixVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }
	
	/** 오류신고&개선사항 선택삭제 */
	@RequestMapping(value = "/errorFixListDelete.do")
    public String ErrorFixListDelete(HttpServletRequest req, @ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, Model model) throws Exception {
		int result = errorFixService.deleteErrorFixList(errorFixVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}	
        return "jsonView";
    }
	
	/** NICE 인증센터(임시) 메인**/
	@GetMapping("/checkPlus.do")
	public String checkPlus(HttpServletRequest req) throws Exception {

		return "center/checkplus/checkplus_main";
	}
	
}
