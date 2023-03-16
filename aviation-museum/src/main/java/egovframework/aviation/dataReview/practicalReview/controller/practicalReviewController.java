package egovframework.aviation.dataReview.practicalReview.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class practicalReviewController {
	
	/** 실무검토 심의 메인 */
	@GetMapping("/practicalReview.do")
	public String PracticalReview(HttpServletRequest req) throws Exception {
		return "dataReview/practicalReview/practicalReview_Main";
	}

	/** 실무검토 심의 목록 */
	@RequestMapping("/practicalReviewList.do")
	public String PracticalReviewList(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/practicalReview/practicalReview_List";
	}
}