package egovframework.aviation.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.Material2VO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.service.MyPageService;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.mypage.vo.Speciality1VO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.CodeMgrService;
import egovframework.aviation.preferences.vo.ExchnRateVO;
import egovframework.aviation.preferences.vo.SpecialityVO;
import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	@Autowired
	private UserService userService;
	@Autowired
	private CodeMgrService codeMgrService;
	@Autowired
	private MetaDataService metaDataService;
	/** 코드 관리 메인 */
	@GetMapping("/myPage.do")
	public String myPage(HttpServletRequest req) throws Exception {
		return "mypage/myPage_Main";
	}	
	
	/** 관심자료관리 조회 */
	@RequestMapping("/interestAjax.do")
	public String InterestAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		interestVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getInterestListCnt(interestVO);		
		if(interestVO.getPerPageNum() != 0) {
			int criPerPageNum = interestVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    interestVO.setPageStart(cri.getPageStart());
	    interestVO.setPerPageNum(cri.getPerPageNum());

		List<InterestVO> interestList = myPageService.getInterestList(interestVO);
		
    	model.addAttribute("interestList", interestList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "mypage/myPage_Interest";
	}
	
	/** 관심자료 삭제 */
	@RequestMapping(value = "/interestDelete.do")
    public String InterestDelete(HttpServletRequest req, @ModelAttribute("interestVO") InterestVO interestVO, Model model) throws Exception {
		int result = myPageService.deleteInterest(interestVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** 관심자료 수정 */
	@RequestMapping(value = "/interestModAjax.do")
    public String InterestModAjax(HttpServletRequest req, @ModelAttribute("interestVO") InterestVO interestVO, Model model) throws Exception {
		int result = myPageService.updateInterest(interestVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
//	/** 요청내역조회 조회 */
	@RequestMapping("/requestHistoryAjax.do")
	public String RequestHistoryAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		requestHistoryVO.setReg_user(userSessionId);
		 
		List<OrgVO> getOrgList = metaDataService.getOrg();
		
//		if(requestHistoryVO.getOrg_nm() == null) {
//			requestHistoryVO.setOrg_nm(getOrgList.get(0).getOrg_nm());	
//		}
		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);	
		
    	int perPageNum = myPageService.getRequestHistoryListCnt(requestHistoryVO);		
		if(requestHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = requestHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    requestHistoryVO.setPageStart(cri.getPageStart());
	    requestHistoryVO.setPerPageNum(cri.getPerPageNum());

		List<RequestHistoryVO> requestHistoryList = myPageService.getRequestHistoryList(requestHistoryVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("getPosSessionList", getPosSessionList);
    	model.addAttribute("requestHistoryList", requestHistoryList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_RequestHistory";
	}
	
//	/** 자료구분조회 */
	@RequestMapping("/requestHistoryPossessionAjax.do")
	public String RequestHistoryPossessionAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {

		List<PosSessionVO> getPosSessionList = myPageService.getPossessionList(requestHistoryVO);
		
		model.addAttribute("getPosSessionList", getPosSessionList);
    	
		return "mypage/myPage_RequestHistory_Possession";
	}
	
//	/** 반려사유팝업 */
	@RequestMapping("/refusalReasonAjax.do")
	public String RefusalReasonAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {
		RequestHistoryVO RefusalReason = new RequestHistoryVO();
		
		if(requestHistoryVO.getKeyword().equals("keyword")) {
			RefusalReason = myPageService.getKeywordRefusalReason(requestHistoryVO);
		}else {			 
			 RefusalReason = myPageService.getErasureRefusalReason(requestHistoryVO);
		}
	
		model.addAttribute("RefusalReason", RefusalReason);
	
		return "jsonView";
	}
	/** 등록전문정보 조회 */
	@RequestMapping("/rgstrSpecialityAjax.do")
	public String RgstrSpecialityAjax(@ModelAttribute("speciality1VO") Speciality1VO speciality1VO, @ModelAttribute("specialityVO") SpecialityVO specialityVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		speciality1VO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getSpecialityListCnt(speciality1VO);		
		if(speciality1VO.getPerPageNum() != 0) {
			int criPerPageNum = speciality1VO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    speciality1VO.setPageStart(cri.getPageStart());
	    speciality1VO.setPerPageNum(cri.getPerPageNum());

		List<Speciality1VO> specialityList = myPageService.getSpecialityList(speciality1VO);
		
		List<SpecialityVO> specialityCodeList = codeMgrService.getSpecialityList(specialityVO);
		
		model.addAttribute("specialityCodeList", specialityCodeList);
    	model.addAttribute("specialityList", specialityList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "mypage/myPage_RgstrSpeciality";
	}
	
	/** 개인정보변경 조회 */
	@RequestMapping("/changePrivacyAjax.do")
	public String ChangePrivacyAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		return "mypage/myPage_ChangePrivacy";
	}
	
	/** 개인정보변경 조회2 */
	@RequestMapping("/changePrivacyAjax2.do")
	public String ChangePrivacyAjax2(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		return "mypage/myPage_ChangePrivacy2";
	}
	
	/** 개인정보변경 변경 */
	@RequestMapping("/userPwChangeAjax.do")
	public String UserPwChangeAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		
		int result = userService.updateUserPassWord(userVO);
		
		if(result > 0) {
			 model.addAttribute("success", "success");
		}
		return "jsonView";
	}
	
	/** 작업내역 조회 */
	@RequestMapping("/workHistoryAjax.do")
	public String WorkHistoryAjax(@ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryList = myPageService.getWorkHistoryList(workHistoryVO);
		
    	model.addAttribute("workHistoryList", workHistoryList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_WorkHistory";
	}
	
	@RequestMapping("/workHistoryViewAjax.do")
	public String WorkHistoryViewAjax(Model model, HttpServletRequest req, @ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryViewListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    List<WorkHistoryVO> workHistoryViewList = myPageService.getWorkHistoryViewList(workHistoryVO);
		
    	model.addAttribute("workHistoryViewList", workHistoryViewList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "mypage/myPage_WorkHistoryView";
	}
	
	/** 계정확인 */
	@RequestMapping("/userConfirmAjax.do")
	public String UserConfirmAjax(@ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {

		List<UserVO> userConfirm = userService.login(userVO);
		
		model.addAttribute("userConfirm", userConfirm);
		return "jsonView";
	}

	@RequestMapping(value = "/interestExcelDownload.do" )
	public void InterestExcelDownload(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		interestVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getInterestListCnt(interestVO);		
		if(interestVO.getPerPageNum() != 0) {
			int criPerPageNum = interestVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    interestVO.setPageStart(0);
	    interestVO.setPerPageNum(100000);

		List<InterestVO> interestList = myPageService.getInterestList(interestVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("관심자료관리");
	            int rowNo = 0;
	 
	            CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_40_PERCENT.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
	            font.setFontHeightInPoints((short) 13);
	            font.setBold(true);
	            headStyle.setFont(font);
	            headStyle.setAlignment(HorizontalAlignment.CENTER);
	            headStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	 
	            Row headerRow = sheet.createRow(rowNo++);
	            headerRow.createCell(0).setCellValue("번호");
	            headerRow.createCell(1).setCellValue("대표이미지");
	            headerRow.createCell(2).setCellValue("소장구분");
	            headerRow.createCell(3).setCellValue("자료번호");
	            headerRow.createCell(4).setCellValue("세부번호");
	            headerRow.createCell(5).setCellValue("명칭");
	            headerRow.createCell(6).setCellValue("설명");
	            headerRow.createCell(7).setCellValue("주수량");
	            headerRow.setHeight((short) 1000);
	            
	            for(int i=0; i<=7; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (InterestVO board : interestList) {
	            	
	            	 try {
	            		String filePath = board.getImage_nm();
	            		System.out.println("filePath1"+filePath);
            	        if (filePath == null || filePath.isEmpty()) {
            	        	filePath = "/images/no_image.png";
            	            System.out.println("filePathnull2"+filePath);
            	        }else {
            	        	filePath = board.getImage_path()+board.getImage_nm();
            	        }
	            	        	 		            
	 		            InputStream is = new FileInputStream(filePath);
	 		            byte[] bytes = IOUtils.toByteArray(is);
	 		            int picIdx = workbook.addPicture(bytes, XSSFWorkbook.PICTURE_TYPE_PNG);
	 		            is.close();
	 		            
	 		            CreationHelper helper = workbook.getCreationHelper();
	 		            Drawing drawing = sheet.createDrawingPatriarch();
	 		            ClientAnchor anchor = helper.createClientAnchor();
	 		            
	 		            anchor.setDx1(100);
	 		            anchor.setDx2(0);
	 		            anchor.setDy1(0);
	 		            anchor.setDy2(0);

	 		            anchor.setRow1(rowNo);
	 		            anchor.setCol1(1);
	 		            anchor.setRow2(rowNo+1);
	 		            anchor.setCol2(2);
	 		            
	 		            Picture pic = drawing.createPicture(anchor, picIdx);
//	 		            pic.resize();
	 		            
	 	            } catch(Exception e) {
	 	            	e.printStackTrace();
	 	            }
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getRnum());
//	                row.createCell(1).setCellValue("");
	                row.createCell(2).setCellValue(board.getPossession_nm());
	                row.createCell(3).setCellValue(board.getItem_no());
	                row.createCell(4).setCellValue(board.getItem_detail_no());
	                row.createCell(5).setCellValue(board.getItem_nm());
	                row.createCell(6).setCellValue(board.getExpl());
	                row.createCell(7).setCellValue(board.getQty());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4500);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);
	            sheet.setColumnWidth(5, 4500);
	            sheet.setColumnWidth(6, 4500);
	            sheet.setColumnWidth(7, 4500);
	            
	            File tmpFile = File.createTempFile("TMP~", ".xlsx");
	            try (OutputStream fos = new FileOutputStream(tmpFile);) {
	                workbook.write(fos);
	            }
	            InputStream res = new FileInputStream(tmpFile) {
	                @Override
	                public void close() throws IOException {
	                    super.close();
	                    if (tmpFile.delete()) {
	                    	System.out.println("임시 파일 삭제 완료");
	                    }
	                }
	            };
	    	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            String fileName = "관심자료관리";
	            
	            // 브라우저에 따른 파일명 인코딩	         
	            String userAgent = req.getHeader("User-Agent");
	            if (userAgent.indexOf("MSIE") > -1) {
	                fileName = URLEncoder.encode(fileName, "UTF-8");
	            } else {
	                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	            }
	            
		        response.setContentType("ms-vnd/excel");
		        response.setHeader("Content-Disposition", "attachment;filename="+fileName+"_"+today+".xlsx");
		 
		        workbook.write(response.getOutputStream());
		        workbook.close();
	        }
	
	}
	
	@RequestMapping(value = "/rgstrExcelDownload.do" )
	public void RgstrExcelDownload(@ModelAttribute("speciality1VO") Speciality1VO speciality1VO, @ModelAttribute("specialityVO") SpecialityVO specialityVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		speciality1VO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getSpecialityListCnt(speciality1VO);		
		if(speciality1VO.getPerPageNum() != 0) {
			int criPerPageNum = speciality1VO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    speciality1VO.setPageStart(0);
	    speciality1VO.setPerPageNum(100000);

		List<Speciality1VO> specialityList = myPageService.getSpecialityList(speciality1VO);
		
		List<SpecialityVO> specialityCodeList = codeMgrService.getSpecialityList(specialityVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("등록전문정보");
	            int rowNo = 0;
	 
	            CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_40_PERCENT.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
	            font.setFontHeightInPoints((short) 13);
	            font.setBold(true);
	            headStyle.setFont(font);
	            headStyle.setAlignment(HorizontalAlignment.CENTER);
	            headStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	 
	            Row headerRow = sheet.createRow(rowNo++);
	            headerRow.createCell(0).setCellValue("번호");
	            headerRow.createCell(1).setCellValue("일자");
	            headerRow.createCell(2).setCellValue("소장구분");
	            headerRow.createCell(3).setCellValue("자료번호");
	            headerRow.createCell(4).setCellValue("세부번호");
	            headerRow.createCell(5).setCellValue("명칭");
	            headerRow.createCell(6).setCellValue("구분");
	            headerRow.createCell(7).setCellValue("제목");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=7; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (Speciality1VO board : specialityList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getRnum());
	                row.createCell(1).setCellValue(board.getReg_date());
	                row.createCell(2).setCellValue(board.getPossession_nm());
	                row.createCell(3).setCellValue(board.getItem_no());
	                row.createCell(4).setCellValue(board.getItem_detail_no());
	                row.createCell(5).setCellValue(board.getItem_nm());
	                row.createCell(6).setCellValue(board.getSpeciality_nm());
	                row.createCell(7).setCellValue(board.getTitle());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4500);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);
	            sheet.setColumnWidth(5, 4500);
	            sheet.setColumnWidth(6, 4500);
	            sheet.setColumnWidth(7, 4500);
	            
	            File tmpFile = File.createTempFile("TMP~", ".xlsx");
	            try (OutputStream fos = new FileOutputStream(tmpFile);) {
	                workbook.write(fos);
	            }
	            InputStream res = new FileInputStream(tmpFile) {
	                @Override
	                public void close() throws IOException {
	                    super.close();
	                    if (tmpFile.delete()) {
	                    	System.out.println("임시 파일 삭제 완료");
	                    }
	                }
	            };
	    	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            String fileName = "등록전문정보";
	            
	            // 브라우저에 따른 파일명 인코딩	         
	            String userAgent = req.getHeader("User-Agent");
	            if (userAgent.indexOf("MSIE") > -1) {
	                fileName = URLEncoder.encode(fileName, "UTF-8");
	            } else {
	                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	            }
	            
		        response.setContentType("ms-vnd/excel");
		        response.setHeader("Content-Disposition", "attachment;filename="+fileName+"_"+today+".xlsx");
		 
		        workbook.write(response.getOutputStream());
		        workbook.close();
	        }
	
	}
	
	@RequestMapping(value = "/workHistoryExcelDownload.do" )
	public void WorkHistoryExcelDownload(@ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    workHistoryVO.setPageStart(0);
	    workHistoryVO.setPerPageNum(100000);
	    
	    List<WorkHistoryVO> workHistoryList = myPageService.getWorkHistoryList(workHistoryVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("작업내역");
	            int rowNo = 0;
	 
	            CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_40_PERCENT.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
	            font.setFontHeightInPoints((short) 13);
	            font.setBold(true);
	            headStyle.setFont(font);
	            headStyle.setAlignment(HorizontalAlignment.CENTER);
	            headStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	 
	            Row headerRow = sheet.createRow(rowNo++);
	            headerRow.createCell(0).setCellValue("번호");
	            headerRow.createCell(1).setCellValue("기관이름");
	            headerRow.createCell(2).setCellValue("소장구분이름");
	            headerRow.createCell(3).setCellValue("자료명칭");
	            headerRow.createCell(4).setCellValue("자료번호");
	            headerRow.createCell(5).setCellValue("세부번호");
	            headerRow.createCell(6).setCellValue("작업날짜");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=6; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (WorkHistoryVO board : workHistoryList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getRnum());
	                row.createCell(1).setCellValue(board.getOrg_nm());
	                row.createCell(2).setCellValue(board.getPossession_nm());
	                row.createCell(3).setCellValue(board.getItem_nm());
	                row.createCell(4).setCellValue(board.getItem_no());
	                row.createCell(5).setCellValue(board.getItem_detail_no());
	                row.createCell(6).setCellValue(board.getReg_date());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4500);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);
	            sheet.setColumnWidth(5, 4500);
	            sheet.setColumnWidth(6, 4500);
	            
	            File tmpFile = File.createTempFile("TMP~", ".xlsx");
	            try (OutputStream fos = new FileOutputStream(tmpFile);) {
	                workbook.write(fos);
	            }
	            InputStream res = new FileInputStream(tmpFile) {
	                @Override
	                public void close() throws IOException {
	                    super.close();
	                    if (tmpFile.delete()) {
	                    	System.out.println("임시 파일 삭제 완료");
	                    }
	                }
	            };
	    	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            String fileName = "작업내역";
	            
	            // 브라우저에 따른 파일명 인코딩	         
	            String userAgent = req.getHeader("User-Agent");
	            if (userAgent.indexOf("MSIE") > -1) {
	                fileName = URLEncoder.encode(fileName, "UTF-8");
	            } else {
	                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	            }
	            
		        response.setContentType("ms-vnd/excel");
		        response.setHeader("Content-Disposition", "attachment;filename="+fileName+"_"+today+".xlsx");
		 
		        workbook.write(response.getOutputStream());
		        workbook.close();
	        }
	
	}
	
	@RequestMapping(value = "/workHistoryViewExcelDownload.do" )
	public void WorkHistoryViewExcelDownload(@ModelAttribute("workHistoryVO") WorkHistoryVO workHistoryVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		workHistoryVO.setReg_user(userSessionId);
		 
    	int perPageNum = myPageService.getWorkHistoryViewListCnt(workHistoryVO);		
		if(workHistoryVO.getPerPageNum() != 0) {
			int criPerPageNum = workHistoryVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    workHistoryVO.setPageStart(cri.getPageStart());
	    workHistoryVO.setPerPageNum(cri.getPerPageNum());

	    workHistoryVO.setPageStart(0);
	    workHistoryVO.setPerPageNum(100000);
	    
	    List<WorkHistoryVO> workHistoryViewList = myPageService.getWorkHistoryViewList(workHistoryVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("작업내역상세");
	            int rowNo = 0;
	 
	            CellStyle headStyle = workbook.createCellStyle();
	            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.GREY_40_PERCENT.getIndex());
	            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	            Font font = workbook.createFont();
	            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
	            font.setFontHeightInPoints((short) 13);
	            font.setBold(true);
	            headStyle.setFont(font);
	            headStyle.setAlignment(HorizontalAlignment.CENTER);
	            headStyle.setVerticalAlignment(VerticalAlignment.CENTER);
	 
	            Row headerRow = sheet.createRow(rowNo++);
	            headerRow.createCell(0).setCellValue("번호");
	            headerRow.createCell(1).setCellValue("기관이름");
	            headerRow.createCell(2).setCellValue("소장구분이름");
	            headerRow.createCell(3).setCellValue("자료명칭");
	            headerRow.createCell(4).setCellValue("자료번호");
	            headerRow.createCell(5).setCellValue("새부번호");
	            headerRow.createCell(6).setCellValue("작업명");
	            headerRow.createCell(7).setCellValue("작업자");
	            headerRow.createCell(8).setCellValue("작업날짜");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=8; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (WorkHistoryVO board : workHistoryViewList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getRnum());
	                row.createCell(1).setCellValue(board.getOrg_nm());
	                row.createCell(2).setCellValue(board.getPossession_nm());
	                row.createCell(3).setCellValue(board.getItem_nm());
	                row.createCell(4).setCellValue(board.getItem_no());
	                row.createCell(5).setCellValue(board.getItem_detail_no());
	                row.createCell(6).setCellValue(board.getWork_nm());
	                row.createCell(7).setCellValue(board.getReg_user());
	                row.createCell(8).setCellValue(board.getReg_date());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4000);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);
	            sheet.setColumnWidth(5, 4500);
	            sheet.setColumnWidth(6, 4500);
	            sheet.setColumnWidth(7, 4500);
	            sheet.setColumnWidth(8, 4500);
	            
	            File tmpFile = File.createTempFile("TMP~", ".xlsx");
	            try (OutputStream fos = new FileOutputStream(tmpFile);) {
	                workbook.write(fos);
	            }
	            InputStream res = new FileInputStream(tmpFile) {
	                @Override
	                public void close() throws IOException {
	                    super.close();
	                    if (tmpFile.delete()) {
	                    	System.out.println("임시 파일 삭제 완료");
	                    }
	                }
	            };
	    	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            String fileName = "작업내역상세";
	            
	            // 브라우저에 따른 파일명 인코딩	         
	            String userAgent = req.getHeader("User-Agent");
	            if (userAgent.indexOf("MSIE") > -1) {
	                fileName = URLEncoder.encode(fileName, "UTF-8");
	            } else {
	                fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
	            }
	            
		        response.setContentType("ms-vnd/excel");
		        response.setHeader("Content-Disposition", "attachment;filename="+fileName+"_"+today+".xlsx");
		 
		        workbook.write(response.getOutputStream());
		        workbook.close();
	        }
	
	}
	
//	/** 수정 */
	@RequestMapping("/reasonKeywordModAjax.do")
	public String ReasonKeywordModAjax(Model model, HttpServletRequest req, @ModelAttribute("requestHistoryVO") RequestHistoryVO requestHistoryVO) throws Exception {
		int result = 0;	
		
		if(requestHistoryVO.getKeyword().equals("keyword")) {
			result = myPageService.updateKeywordRequest(requestHistoryVO);
		}else {			 
			result = myPageService.updateErasureRequest(requestHistoryVO);
		}
	
//		model.addAttribute("RefusalReason", RefusalReason);
	
		return "jsonView";
	}
}
