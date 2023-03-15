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
	@RequestMapping("/statisticsMuseumAjax.do")
	public String StatisticsMuseumAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "statistics/statistics_Museum";
	}
	
	/** 이미지 통계 */
	@RequestMapping("/statisticsImagesAjax.do")
	public String StatisticsImagesAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "statistics/statistics_Images";
	}
	
	/** 전문정보 등록현황 */
	@RequestMapping("/statisticsSpecialityAjax.do")
	public String StatisticsSpecialityAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		return "statistics/statistics_Speciality";
	}

}
