package egovframework.aviation.dashboard.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.center.service.ErrorFixService;
import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.ErrorFixVO;
import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.dashboard.service.DashBoardService;
import egovframework.aviation.dashboard.vo.Class1DataVO;
import egovframework.aviation.dashboard.vo.CountryDataVO;
import egovframework.aviation.dashboard.vo.Material1DataVO;
import egovframework.aviation.dashboard.vo.RecentWorkVO;
import egovframework.aviation.dashboard.vo.RegStateDataVO;
import egovframework.aviation.dashboard.vo.RentalVO;
import egovframework.aviation.dashboard.vo.WorkerDataVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
public class DashBoardController {
	
	@Autowired
	private NoticeService noticeService;	
	@Autowired
	private ErrorFixService errorFixService;
	@Autowired
	private DashBoardService dashBoardService;
	
	@RequestMapping(value = "/dashBoard.do")
	public String DashBoard(@ModelAttribute("errorFixVO") ErrorFixVO errorFixVO, @ModelAttribute("noticeVO") NoticeVO noticeVO, @ModelAttribute("countryDataVO") CountryDataVO countryDataVO, @ModelAttribute("class1DataVO") Class1DataVO class1DataVO, @ModelAttribute("material1DataVO") Material1DataVO material1DataVO, @ModelAttribute("regStateDataVO") RegStateDataVO regStateDataVO, @ModelAttribute("workerDataVO") WorkerDataVO workerDataVO, @ModelAttribute("recentWorkVO") RecentWorkVO recentWorkVO, @ModelAttribute("rentalVO") RentalVO rentalVO, @ModelAttribute("criteria") Criteria cri, HttpServletRequest req, Model model) throws Exception {
		model.addAttribute("session", req.getSession().getId());
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		
		//공지사항
	    noticeVO.setPageStart(0);
	    noticeVO.setPerPageNum(100000);
		List<NoticeVO> noticeList = noticeService.getNoticeList(noticeVO);
		
		//오류신고
		errorFixVO.setPageStart(0);
	    errorFixVO.setPerPageNum(100000);
		List<ErrorFixVO> errorFixList = errorFixService.getErrorFixList(errorFixVO);

		// 나라별 자료현황
		List<CountryDataVO> countryDataList = dashBoardService.getCountryDataList(countryDataVO);
	
		// 주제별 자료현황
		List<Class1DataVO> class1DataList = dashBoardService.getClass1DataList(class1DataVO);
		
		// 재질별 자료현황
		List<Material1DataVO> material1DataList = dashBoardService.getMaterial1DataList(material1DataVO);
		
		// 가등록, 등록 수량
		List<RegStateDataVO> regStateDataList = dashBoardService.getRegStateDataList(regStateDataVO);
		
		// 기간별 작업량 월, 주, 일
		int getWorkHistoryYear = dashBoardService.getWorkHistoryYear();
		int getWorkHistoryMonth = dashBoardService.getWorkHistoryMonth();
		int getWorkHistoryWeek = dashBoardService.getWorkHistoryWeek();
		int getWorkHistoryDay = dashBoardService.getWorkHistoryDay();
		
		// 작업자 기간별 작업량
		List<WorkerDataVO> getWorkerDataList = dashBoardService.getWorkerDataList(workerDataVO);
		
		// 최근 작업한 자료
		recentWorkVO.setReg_user(userSessionId);
		List<RecentWorkVO> getRecentWorkList = dashBoardService.getRecentWorkList(recentWorkVO);
		 
		// 대여
		List<RentalVO> getInsideRental = dashBoardService.getInsideRental(rentalVO);
		List<RentalVO> getOutsideRental = dashBoardService.getOutsideRental(rentalVO);
		
		model.addAttribute("errorFixList", errorFixList);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("countryDataList", countryDataList);
		model.addAttribute("class1DataList", class1DataList);
		model.addAttribute("material1DataList", material1DataList);
		model.addAttribute("regStateDataList", regStateDataList);
		model.addAttribute("getWorkHistoryYear", getWorkHistoryYear);
		model.addAttribute("getWorkHistoryMonth", getWorkHistoryMonth);
		model.addAttribute("getWorkHistoryWeek", getWorkHistoryWeek);
		model.addAttribute("getWorkHistoryDay", getWorkHistoryDay);
		model.addAttribute("getWorkerDataList", getWorkerDataList);
		model.addAttribute("getRecentWorkList", getRecentWorkList);
		model.addAttribute("getInsideRental", getInsideRental);
		model.addAttribute("getOutsideRental", getOutsideRental);
		return "dashBoard/dashBoard";
	}
	
}
