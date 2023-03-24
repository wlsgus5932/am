package egovframework.aviation.metadata.controller.search;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.aviation.metadata.service.MetaDataSearchService;
import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.vo.Class1VO;
import egovframework.aviation.metadata.vo.Class2VO;
import egovframework.aviation.metadata.vo.Class3VO;
import egovframework.aviation.metadata.vo.ConditionVO;
import egovframework.aviation.metadata.vo.CountryVO;
import egovframework.aviation.metadata.vo.ExistenceVO;
import egovframework.aviation.metadata.vo.GgnuriVO;
import egovframework.aviation.metadata.vo.IcaoVO;
import egovframework.aviation.metadata.vo.Material1VO;
import egovframework.aviation.metadata.vo.Material2VO;
import egovframework.aviation.metadata.vo.MeasurementUnitVO;
import egovframework.aviation.metadata.vo.MeasurementVO;
import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.metadata.vo.ObtainmentVO;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.metadata.vo.PriceUnitVO;
import egovframework.aviation.metadata.vo.Purchase1VO;
import egovframework.aviation.metadata.vo.Purchase2VO;
import egovframework.aviation.metadata.vo.QtyUnitVO;
import egovframework.aviation.metadata.vo.RankingVO;
import egovframework.aviation.metadata.vo.StorageType1VO;
import egovframework.aviation.metadata.vo.StorageVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class PRgstMetaDataSearchController {
	@Autowired
	private MetaDataSearchService metaDataSearchService;
	
	@Autowired
	private MetaDataService metaDataService;
	
	@Autowired
	private SpecialityService specialityService;
	/** 자료검색 */
	@RequestMapping("/pRgstMetaDataSearchMain.do")
	public String PRgstMetaDataSearchMain(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri, RedirectAttributes rttr) throws Exception {
		String all_search_word = req.getParameter("all_search_word");
		rttr.addFlashAttribute("all_search_word", all_search_word);
		return "redirect:/pRgstMetaDataSearch.do";
	}
	
	@RequestMapping(value="/pRgstMetaDataSearch.do")
	public String PRgstMetaDataSearch( HttpServletRequest req, RedirectAttributes rttr) {
		String all_search_word = req.getParameter("all_search_word");
		System.out.println(all_search_word);
		rttr.addFlashAttribute("all_search_word", all_search_word);
	    return "metaDataSearch/pRgstMetaDataSearch_Main";
	}
 
	/** 자료검색리스트 */
	@RequestMapping("/pRgstMetaDataSearchListAjax.do")
	public String PRgstMetaDataSearchListAjax(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("userVO") UserVO userVO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		metaDataSearchVO.setReg_user(userSessionId);
//		 
		System.out.println(metaDataSearchVO);
		metaDataSearchVO.setReg_state("N");
    	int perPageNum = metaDataSearchService.getMetaDataSearchListCnt(metaDataSearchVO);		
		if(metaDataSearchVO.getPerPageNum() != 0) {
			int criPerPageNum = metaDataSearchVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    metaDataSearchVO.setPageStart(cri.getPageStart());
	    metaDataSearchVO.setPerPageNum(cri.getPerPageNum());

		List<MetaDataSearchVO> metaDataSearchList = metaDataSearchService.getMetaDataSearchList(metaDataSearchVO);
		
		List<Material1VO> material1List = metaDataService.getMaterial1();
		List<CountryVO> countryList = metaDataService.getCountry();
		List<PosSessionVO> possesionList = metaDataService.getPosSession();
		
		List<MetaDataSearchVO> metaDataSearchList2 = metaDataSearchService.getMetaDataSearchListCurrentQty(metaDataSearchVO);
		
		model.addAttribute("possesionList", possesionList);
		model.addAttribute("material1List", material1List);
		model.addAttribute("countryList", countryList);
    	model.addAttribute("metaDataSearchList", metaDataSearchList);
    	model.addAttribute("metaDataSearchList2", metaDataSearchList2);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "metaDataSearch/pRgstMetaDataSearch_List";
	}
	
	/** 자료검색이미지리스트 */
	@RequestMapping("/pRgstMetaDataSearchImageListAjax.do")
	public String PRgstMetaDataSearchImageListAjax(@ModelAttribute("metaDataSearchImageVO") MetaDataSearchImageVO metaDataSearchImageVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
		System.out.println(metaDataSearchImageVO);
		metaDataSearchImageVO.setReg_state("N");
    	int perPageNum = metaDataSearchService.getMetaDataSearchImageListCnt(metaDataSearchImageVO);		
		if(metaDataSearchImageVO.getPerPageNum() != 0) {
			int criPerPageNum = metaDataSearchImageVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    metaDataSearchImageVO.setPageStart(cri.getPageStart());
	    metaDataSearchImageVO.setPerPageNum(cri.getPerPageNum());

		List<MetaDataSearchImageVO> metaDataSearchImageList = metaDataSearchService.getMetaDataSearchImageList(metaDataSearchImageVO);
		
		List<Material1VO> material1List = metaDataService.getMaterial1();
		List<CountryVO> countryList = metaDataService.getCountry();
		List<PosSessionVO> possesionList = metaDataService.getPosSession();
		
		List<MetaDataSearchImageVO> metaDataSearchImageList2 = metaDataSearchService.getMetaDataSearchImageListCurrentQty(metaDataSearchImageVO);

		model.addAttribute("metaDataSearchImageList2", metaDataSearchImageList2);
		model.addAttribute("possesionList", possesionList);
		model.addAttribute("material1List", material1List);
		model.addAttribute("countryList", countryList);
    	model.addAttribute("metaDataSearchImageList", metaDataSearchImageList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "metaDataSearch/pRgstMetaDataSearch_ImageList";
	}
	
	/** 간략보기 */
	@RequestMapping("/pRgstMetaDataSearchQuickViewAjax.do")
	public String PRgstMetaDataSearchQuickViewAjax(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
		System.out.println(metaDataSearchVO);
		metaDataSearchVO.setReg_state("N");
    	int perPageNum = metaDataSearchService.getMetaDataSearchListCnt(metaDataSearchVO);		
		if(metaDataSearchVO.getPerPageNum() != 0) {
			int criPerPageNum = metaDataSearchVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    metaDataSearchVO.setPageStart(cri.getPageStart());
	    metaDataSearchVO.setPerPageNum(cri.getPerPageNum());

		List<MetaDataSearchVO> metaDataSearchQuickView = metaDataSearchService.getMetaDataSearchList(metaDataSearchVO);
		
    	model.addAttribute("metaDataSearchQuickView", metaDataSearchQuickView);

		return "metaDataSearch/metaDataSearch_QuickView";
	}
	
	/** 간략보기 */
	@RequestMapping("/pRgstMetaDataSearchImageQuickViewAjax.do")
	public String PRgstMetaDataSearchImageQuickViewAjax(@ModelAttribute("metaDataSearchImageVO") MetaDataSearchImageVO metaDataSearchImageVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
		System.out.println(metaDataSearchImageVO);
		metaDataSearchImageVO.setReg_state("N");
    	int perPageNum = metaDataSearchService.getMetaDataSearchImageListCnt(metaDataSearchImageVO);		
		if(metaDataSearchImageVO.getPerPageNum() != 0) {
			int criPerPageNum = metaDataSearchImageVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    metaDataSearchImageVO.setPageStart(cri.getPageStart());
	    metaDataSearchImageVO.setPerPageNum(cri.getPerPageNum());

		List<MetaDataSearchImageVO> metaDataSearchQuickView = metaDataSearchService.getMetaDataSearchImageList(metaDataSearchImageVO);
		
    	model.addAttribute("metaDataSearchQuickView", metaDataSearchQuickView);
    	model.addAttribute("image","image");
		return "metaDataSearch/metaDataSearch_QuickView";
	}
	
	/** 관심자료 등록 */
	@RequestMapping(value = "/pRgstInterestInsert.do")
    public String PRgstInterestInsert(HttpServletRequest req, @ModelAttribute("interestVO") InterestVO interestVO, Model model) throws Exception {		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		interestVO.setReg_user(userSessionId);
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();		
		
		String[] arrStr = req.getParameterValues("group_seqList");
		
		int result = 0;
		 try {
		       if(arrStr !=null && arrStr.length > 0) {
		            for(int i=0; i<arrStr.length; i++) {
		               System.out.println("ajax traditional result : " + i +" : "+ arrStr[i]);

		               interestVO.setItem_idx(arrStr[i]);
		               result = metaDataSearchService.insertInterest(interestVO);
		       	    }
		       	   
		       	} else {
		      	    resultMap.put("result", "false");
		      	}
		    } catch (Exception e) {
		        e.printStackTrace();
		   }	  
				
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	@RequestMapping(value = "/pRgstMetaDataSearchListExcelDownload.do" )
	public void PRgstMetaDataSearchListExcelDownload(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, HttpServletResponse response, @ModelAttribute("criteria") Criteria cri) throws Exception {

		 try (Workbook workbook = new XSSFWorkbook()) {
	            Sheet sheet = workbook.createSheet("자료정보검색_가등록");
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
	            headerRow.createCell(6).setCellValue("ICAO");
	            headerRow.createCell(7).setCellValue("주수량");
	            headerRow.setHeight((short) 1000);
	            
	            for(int i=0; i<=7; i++){
	                headerRow.getCell(i).setCellStyle(headStyle);
	            }

	    		metaDataSearchVO.setReg_state("N");
	        	int perPageNum = metaDataSearchService.getMetaDataSearchListCnt(metaDataSearchVO);		
	    		if(metaDataSearchVO.getPerPageNum() != 0) {
	    			int criPerPageNum = metaDataSearchVO.getPerPageNum();
	    			cri.setPerPageNum(criPerPageNum);
	    		}
	    		PageMaker pageMaker = new PageMaker();
	    	    pageMaker.setCri(cri);
	    	    pageMaker.setTotalCount(perPageNum);
	    		    
	    	    metaDataSearchVO.setPageStart(cri.getPageStart());
	    	    metaDataSearchVO.setPerPageNum(cri.getPerPageNum());
	    	  
	    	    metaDataSearchVO.setPageStart(0);
	    	    metaDataSearchVO.setPerPageNum(100000);
	    	    
	    		List<MetaDataSearchVO> metaDataSearchList = metaDataSearchService.getMetaDataSearchList(metaDataSearchVO);
	    			                   
	            for (MetaDataSearchVO board : metaDataSearchList) {
	            	
	            	 try {
	            		String filePath = board.getImage_nm();
	            		System.out.println("filePath1"+filePath);
            	        if (filePath == null || filePath.isEmpty()) {
            	        	filePath = "/images/no_image.png";
            	            System.out.println("filePathnull2"+filePath);
            	        }else {
            	        	filePath = "/images"+board.getImage_nm();
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
	                row.createCell(6).setCellValue(board.getIcao_nm());
	                row.createCell(7).setCellValue(board.getQty());
	                row.setHeight((short) 3000);
	            }
	 
	            sheet.setColumnWidth(0, 5000);
	            sheet.setColumnWidth(1, 8000);
	            sheet.setColumnWidth(2, 5000);
	            sheet.setColumnWidth(3, 5000);
	            sheet.setColumnWidth(4, 5000);
	            sheet.setColumnWidth(5, 5000);
	            sheet.setColumnWidth(6, 5000);
	            sheet.setColumnWidth(7, 5000);
	            
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
//	                        logger.info(() -> "임시 파일 삭제 완료");
	                    }
	                }
	            };
	    	    java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
	            String today = formatter.format(new java.util.Date());
	            
	            String fileName = "자료정보검색_가등록";
	            
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
	
	@RequestMapping("/pRgstMetaDataListView.do")
	public String PRgstMetaDataListView(Model model, HttpServletRequest req) throws Exception {
		System.out.println(req.getParameter("possession_code_idx"));
		System.out.println(req.getParameter("org_code_idx"));
		System.out.println(req.getParameter("item_no"));
		System.out.println(req.getParameter("item_detail_no"));
		try {
			List<CountryVO> country = metaDataService.getCountry();
			List<Material1VO> material = metaDataService.getMaterial1();
			List<IcaoVO> icao = metaDataService.getIcao();
			List<ExistenceVO> existence = metaDataService.getExistence();
			List<MeasurementVO> measurement = metaDataService.getMeasurement();
			List<MeasurementUnitVO> measurementUnit = metaDataService.getMeasurementUnit();
			List<Class1VO> class1 = metaDataService.getClass1();
			List<Class2VO> class2 = metaDataService.getClass2();
			List<Class3VO> class3 = metaDataService.getClass3();
			List<ObtainmentVO> obtainment = metaDataService.getObtainment();
			List<Purchase1VO> purchase1 = metaDataService.getPurchase1();
			List<Purchase2VO> purchase2 = metaDataService.getPurchase2();
			List<PriceUnitVO> price = metaDataService.getPriceUnit();
			List<QtyUnitVO> qty = metaDataService.getQtyUnit();
			List<ConditionVO> condition = metaDataService.getCondition();
			List<RankingVO> ranking = metaDataService.getRanking();
			List<PosSessionVO> possession = metaDataService.getPosSession();
			List<GgnuriVO> ggnuri = metaDataService.getGgnuri();
			List<OrgVO> org = metaDataService.getOrg();
			List<StorageType1VO> type1 = metaDataService.getStorageType1();
			List<StorageVO> storage = metaDataService.getStorage(0);
			List<SpecialityCodeVO> scCode = specialityService.getSpecialityCode();
			
			
			model.addAttribute("countryList", country);
			model.addAttribute("material1List", material);
			model.addAttribute("IcaoList", icao);
			model.addAttribute("existenceList", existence);
			model.addAttribute("measurementList", measurement);
			model.addAttribute("measurementUnitList", measurementUnit);
			model.addAttribute("class1List", class1);
			model.addAttribute("class2List", class2);
			model.addAttribute("class3List", class3);
			model.addAttribute("obtainmentList", obtainment);
			model.addAttribute("purchase1List", purchase1);
			model.addAttribute("purchase2List", purchase2);
			model.addAttribute("priceUnitList", price);
			model.addAttribute("qtyUnitList", qty);
			model.addAttribute("conditionList", condition);
			model.addAttribute("rankingList", ranking);
			model.addAttribute("posSessionList", possession);
			model.addAttribute("ggnuriList", ggnuri);
			model.addAttribute("orgList", org);
			model.addAttribute("storage1List", type1);
			model.addAttribute("storageCodeList", storage);
			model.addAttribute("specialityCodeList", scCode);
			model.addAttribute("possession_code_idx", req.getParameter("possession_code_idx"));
			model.addAttribute("org_code_idx", req.getParameter("org_code_idx"));
			model.addAttribute("item_no", req.getParameter("item_no"));
			model.addAttribute("item_detail_no", req.getParameter("item_detail_no"));
			model.addAttribute("reg_state", "N");
			return "metaDataSearch/metaDataSearch_View";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "cmmn/egovError";
		}
	}
}
