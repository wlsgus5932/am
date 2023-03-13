package egovframework.aviation.center.controller;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CustomerCenterController {
	
	private final NoticeService noticeService;
	
	/** 공지사항 메인 */
	@GetMapping("/notice.do")
	public String CodeMgr(HttpServletRequest req) throws Exception {

		return "center/notice/notice_Main";
	}
	
	/** 사용자 목록 조회 */
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
	
	/** 사용자 사용여부 */
	@RequestMapping(value = "/noticeListDelete.do")
    public String NoticeListDelete(HttpServletRequest req, @ModelAttribute("noticeVO") NoticeVO noticeVO, Model model) throws Exception {
		System.out.println(noticeVO.getNotice_seqList());
		int result = noticeService.deleteNoticeList(noticeVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}	
        return "jsonView";
    } 
	
	
	
}
