package egovframework.aviation.dataReview.dataPurchaseMgr.controller;

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
public class dataPurchaseMgrController {
	/** 자료구입 관리 메인 */
	@GetMapping("/dataPurchaseMgr.do")
	public String DataPurchaseMgr(HttpServletRequest req) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_Main";
	}
		
	/** 매도신청(접수자별) */
	@RequestMapping("/dataPurchaseMgrSellReceiver.do")
	public String DataPurchaseMgrSellReceiver(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_Sell_Receiver";
	}
	
	/** 매도신청(자료별) */
	@RequestMapping("/dataPurchaseMgrSellData.do")
	public String DataPurchaseMgrSellData(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_Sell_Data";
	}
	
	/** 실무검토 */
	@RequestMapping("/dataPurchaseMgrPracticalReview.do")
	public String DataPurchaseMgrPracticalReview(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_PracticalReview";
	}
	
	/** 자료접수 */
	@RequestMapping("/dataPurchaseMgrDataReception.do")
	public String DataPurchaseMgrDataReception(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_DataReception";
	}

	/** 구입감정 */
	@RequestMapping("/dataPurchaseMgrPurchaseAppraaisal.do")
	public String StatisticsSpecialityAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_PurchaseAppraaisal";
	}
	
	/** 구입심의 */
	@RequestMapping("/dataPurchaseMgrPurchaseReview.do")
	public String DataPurchaseMgrPurchaseReview(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "dataReview/dataPurchaseMgr/dataPurchaseMgr_PurchaseReview";
	}
	

}
