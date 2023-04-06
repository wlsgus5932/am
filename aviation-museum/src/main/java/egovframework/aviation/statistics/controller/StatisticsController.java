package egovframework.aviation.statistics.controller;

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
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.statistics.service.StatisticsService;
import egovframework.aviation.statistics.vo.StatisticsImagesVO;
import egovframework.aviation.statistics.vo.StatisticsMuseumVO;
import egovframework.aviation.statistics.vo.StatisticsSpecialityVO;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class StatisticsController {
	
	@Autowired
	private MetaDataService metaDataService;
	@Autowired
	private StatisticsService statisticsService;
	
	/** 통계 메인 */
	@GetMapping("/statistics.do")
	public String Statistics(HttpServletRequest req) throws Exception {
		return "statistics/statistics_Main";
	}	
	
	/** 박물관 등록현황 */
	@RequestMapping("/statisticsMuseumAjax.do")
	public String StatisticsMuseumAjax(@ModelAttribute("statisticsMuseumVO") StatisticsMuseumVO statisticsMuseumVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<StatisticsMuseumVO> museumList = statisticsService.getMuseumList(statisticsMuseumVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("museumList", museumList);
		return "statistics/statistics_Museum";
	}
	
	/** 이미지 통계 */
	@RequestMapping("/statisticsImagesAjax.do")
	public String StatisticsImagesAjax(@ModelAttribute("statisticsImagesVO") StatisticsImagesVO statisticsImagesVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<StatisticsImagesVO> imagesList = statisticsService.getImagesList(statisticsImagesVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("imagesList", imagesList);
		return "statistics/statistics_Images";
	}
	
	/** 전문정보 등록현황 */
	@RequestMapping("/statisticsSpecialityAjax.do")
	public String StatisticsSpecialityAjax(@ModelAttribute("statisticsSpecialityVO") StatisticsSpecialityVO statisticsSpecialityVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req) throws Exception {
		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<StatisticsSpecialityVO> specialityList = statisticsService.getSpecialityList(statisticsSpecialityVO);
		
		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("specialityList", specialityList);		
		return "statistics/statistics_Speciality";
	}
	/** 박물관 등록현황 엑셀 */
	@RequestMapping(value = "/statisticsMuseumExcelDownload.do" )
	public void StatisticsMuseumExcelDownload(@ModelAttribute("statisticsMuseumVO") StatisticsMuseumVO statisticsMuseumVO, Model model, HttpServletRequest req, HttpServletResponse response) throws Exception {
		 
		 List<StatisticsMuseumVO> museumList = statisticsService.getMuseumList(statisticsMuseumVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("박물관 등록현황");
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
	            headerRow.createCell(1).setCellValue("기관명");
	            headerRow.createCell(2).setCellValue("구분");
	            headerRow.createCell(3).setCellValue("등록수량(건)");
	            headerRow.createCell(4).setCellValue("등록수량(점)");
	            headerRow.createCell(5).setCellValue("대국민서비스(점)");
	            headerRow.createCell(6).setCellValue("대국민서비스(점)");
	            headerRow.createCell(7).setCellValue("사진자료등록수량");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=7; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (StatisticsMuseumVO board : museumList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(rowNo);
	                row.createCell(1).setCellValue(board.getOrg_nm());
	                row.createCell(2).setCellValue(board.getPossession_nm());
	                row.createCell(3).setCellValue(board.getCnt());
	                row.createCell(4).setCellValue(board.getTotal());
	                row.createCell(5).setCellValue(board.getP_cnt());
	                row.createCell(6).setCellValue(board.getP_total());
	                row.createCell(7).setCellValue(board.getI_cnt());
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
	            
	            String fileName = "박물관등록현황";
	            
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
	
	/** 전문정보 등록현황 엑셀 */
	@RequestMapping(value = "/statisticsSpecialityExcelDownload.do" )
	public void StatisticsSpecialityExcelDownload(@ModelAttribute("statisticsSpecialityVO") StatisticsSpecialityVO statisticsSpecialityVO, Model model, HttpServletRequest req, HttpServletResponse response) throws Exception {
		 
		 List<StatisticsSpecialityVO> specialityList = statisticsService.getSpecialityList(statisticsSpecialityVO);
		
		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("전문정보 등록현황");
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
	            headerRow.createCell(1).setCellValue("기관");
	            headerRow.createCell(2).setCellValue("작성자");
	            headerRow.createCell(3).setCellValue("작성자ID");
	            headerRow.createCell(4).setCellValue("등록수량");
	            headerRow.setHeight((short) 700);
	            
	            for(int i=0; i<=4; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }
	                    
	            for (StatisticsSpecialityVO board : specialityList) {	            	
	               		       	     
	            	Row row = sheet.createRow(rowNo++);
	                row.createCell(0).setCellValue(board.getRnum());
	                row.createCell(1).setCellValue(board.getOrg_nm());
	                row.createCell(2).setCellValue(board.getMember_nm());
	                row.createCell(3).setCellValue(board.getReg_user());
	                row.createCell(4).setCellValue(board.getCount());
	                row.setHeight((short) 1500);
	            }
	 
	            sheet.setColumnWidth(0, 4500);
	            sheet.setColumnWidth(1, 4500);
	            sheet.setColumnWidth(2, 4500);
	            sheet.setColumnWidth(3, 4500);
	            sheet.setColumnWidth(4, 4500);

	            
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
	            
	            String fileName = "전문정보등록현황";
	            
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
