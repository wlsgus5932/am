package egovframework.aviation.preferences.controller;

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

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
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
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;
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
	    accessLogVO.setPageStart(0);
	    accessLogVO.setPerPageNum(100000);
	    
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
		specialityLogVO.setPageStart(0);
		specialityLogVO.setPerPageNum(100000);
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
		movementLogVO.setPageStart(0);
		movementLogVO.setPerPageNum(100000);
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
	
	@RequestMapping(value = "/userAccessExcelDownload.do" )
	public void UserAccessExcelDownload(@ModelAttribute("accessLogVO") AccessLogVO accessLogVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {

	    accessLogVO.setPageStart(0);
	    accessLogVO.setPerPageNum(100000);
	    
	    List<AccessLogVO> getAccessLogList = logMgrService.getAccessLogList(accessLogVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("사용자접속로그");
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
	            headerRow.createCell(0).setCellValue("접근일시");
	            headerRow.createCell(1).setCellValue("박물관");
	            headerRow.createCell(2).setCellValue("상태");
	            headerRow.createCell(3).setCellValue("수정자");
	            headerRow.createCell(4).setCellValue("사용자명");
	            headerRow.createCell(5).setCellValue("수정자IP");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=5; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (AccessLogVO board : getAccessLogList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getAccess_date());
	                row.createCell(1).setCellValue(board.getOrg_nm());
	                row.createCell(2).setCellValue(board.getAccess_type());
	                row.createCell(3).setCellValue("");
	                row.createCell(4).setCellValue(board.getMember_nm());
	                row.createCell(5).setCellValue(board.getAccess_ip());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4500);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);
	            sheet.setColumnWidth(5, 4500);
	            
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
	            
	            String fileName = "사용자접속로그";
	            
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
	@RequestMapping(value = "/specialityRegisterExcelDownload.do" )
	public void SpecialityRegisterExcelDownload(@ModelAttribute("specialityLogVO") SpecialityLogVO specialityLogVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {

		specialityLogVO.setPageStart(0);
		specialityLogVO.setPerPageNum(100000);
	    
		List<SpecialityLogVO> getSpecialityLogList = logMgrService.getSpecialityLogList(specialityLogVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("전문정보등록로그");
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
	            headerRow.createCell(0).setCellValue("수정일");
	            headerRow.createCell(1).setCellValue("박물관 소장구분명");
	            headerRow.createCell(2).setCellValue("자료번호");
	            headerRow.createCell(3).setCellValue("세부번호");
	            headerRow.createCell(4).setCellValue("상태");
	            headerRow.createCell(5).setCellValue("전문정보 제목");
	            headerRow.createCell(6).setCellValue("파일명");
	            headerRow.createCell(7).setCellValue("수정자");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=7; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (SpecialityLogVO board : getSpecialityLogList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getAccess_date());
	                row.createCell(1).setCellValue(board.getPossession_nm());
	                row.createCell(2).setCellValue(board.getItem_no());
	                row.createCell(3).setCellValue(board.getItem_detail_no());
	                row.createCell(4).setCellValue(board.getAccess_type());
	                row.createCell(5).setCellValue(board.getSpeciality_title());
	                row.createCell(6).setCellValue(board.getSpeciality_file_nm());
	                row.createCell(7).setCellValue(board.getMember_nm());
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
	            
	            String fileName = "전문정보 등록로그";
	            
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
	@RequestMapping(value = "/movementHistoryExcelDownload.do" )
	public void MovementHistoryExcelDownload(@ModelAttribute("movementLogVO") MovementLogVO movementLogVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {

		movementLogVO.setPageStart(0);
		movementLogVO.setPerPageNum(100000);
	    
		List<MovementLogVO> getMovementLogList = logMgrService.getMovementLogList(movementLogVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("이동사항 내역로그");
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
	            headerRow.createCell(0).setCellValue("변경일자");
	            headerRow.createCell(1).setCellValue("소장구분");
	            headerRow.createCell(2).setCellValue("자료번호");
	            headerRow.createCell(3).setCellValue("세부번호");
	            headerRow.createCell(4).setCellValue("수정자");
	            headerRow.createCell(5).setCellValue("수정자IP");
	            headerRow.createCell(6).setCellValue("상태");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=6; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (MovementLogVO board : getMovementLogList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getAccess_date());
	                row.createCell(1).setCellValue(board.getPossession_nm());
	                row.createCell(2).setCellValue(board.getItem_no());
	                row.createCell(3).setCellValue(board.getItem_detail_no());
	                row.createCell(4).setCellValue(board.getMember_nm());
	                row.createCell(5).setCellValue(board.getAccess_ip());
	                row.createCell(6).setCellValue(board.getAccess_type());
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
	            
	            String fileName = "이동사항내역로그";
	            
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
}
