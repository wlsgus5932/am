package egovframework.aviation.dataReview.purchaseReview.controller;

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
public class purchaseReviewController {
	/** 구입 심의 메인 */
	@GetMapping("/purchaseReview.do")
	public String PurchaseReview(HttpServletRequest req) throws Exception {
		return "dataReview/purchaseReview/purchaseReview_Main";
	}

	/** 구입 심의 목록 */
	@RequestMapping("/purchaseReviewList.do")
	public String PurchaseReviewList(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/purchaseReview/purchaseReview_List";
	}
}
