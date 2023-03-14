package egovframework.aviation.statistics.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class StatisticsController {
	/** 통계 메인 */
	@GetMapping("/statistics.do")
	public String Statistics(HttpServletRequest req) throws Exception {
		return "statistics/statistics_Main";
	}	
	
	/** 박물관 등록현황 */
//	@RequestMapping("/museum.do")
//	public String InterestAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
//    	int perPageNum = myPageService.getInterestListCnt(interestVO);		
//		if(interestVO.getPerPageNum() != 0) {
//			int criPerPageNum = interestVO.getPerPageNum();
//			cri.setPerPageNum(criPerPageNum);
//		}
//		PageMaker pageMaker = new PageMaker();
//	    pageMaker.setCri(cri);
//	    pageMaker.setTotalCount(perPageNum);
//		    
//	    interestVO.setPageStart(cri.getPageStart());
//	    interestVO.setPerPageNum(cri.getPerPageNum());
//
//		List<InterestVO> interestList = myPageService.getInterestList(interestVO);
//		
//    	model.addAttribute("interestList", interestList);
//    	model.addAttribute("perPageNum", perPageNum);
//    	model.addAttribute("pageMaker", pageMaker);
//		return "mypage/myPage_Interest";
//	}

}
