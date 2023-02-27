package egovframework.aviation.metadata.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.metadata.service.MetaDataSearchService;
import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class MetaDataSearchController {
	@Autowired
	private MetaDataSearchService metaDataSearchService;
	
	/** 자료검색 */
	@RequestMapping("/metaDataSearch.do")
	public String InterestAjax(@ModelAttribute("interestVO") InterestVO interestVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {

		return "metaDataSearch/metaDataSearch_Main";
	}

	/** 자료검색리스트 */
	@RequestMapping("/metaDataSearchListAjax.do")
	public String MetaDataSearchListAjax(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		metaDataSearchVO.setReg_user(userSessionId);
//		 
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
		
    	model.addAttribute("metaDataSearchList", metaDataSearchList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "metaDataSearch/metaDataSearch_List";
	}
	
	/** 자료검색이미지리스트 */
	@RequestMapping("/metaDataSearchImageListAjax.do")
	public String MetaDataSearchImageListAjax(@ModelAttribute("metaDataSearchImageVO") MetaDataSearchImageVO metaDataSearchImageVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
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
		
    	model.addAttribute("metaDataSearchImageList", metaDataSearchImageList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		return "metaDataSearch/metaDataSearch_ImageList";
	}
	
	/** 간략보기 */
	@RequestMapping("/metaDataSearchQuickViewAjax.do")
	public String MetaDataSearchQuickViewAjax(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
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
	@RequestMapping("/metaDataSearchImageQuickViewAjax.do")
	public String MetaDataSearchImageQuickViewAjax(@ModelAttribute("metaDataSearchImageVO") MetaDataSearchImageVO metaDataSearchImageVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		interestVO.setReg_user(userSessionId);
//		 
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
	@RequestMapping(value = "/interestInsert.do")
    public String InterestInsert(HttpServletRequest req, @ModelAttribute("interestVO") InterestVO interestVO, Model model) throws Exception {
		int result = metaDataSearchService.insertInterest(interestVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	@RequestMapping(value = "/metaDataSearchListExcelDownload.do" )
	public Object MetaDataSearchListExcelDownload(@ModelAttribute("metaDataSearchVO") MetaDataSearchVO metaDataSearchVO, @ModelAttribute("userVO") UserVO userVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {

//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		metaDataSearchVO.setReg_user(userSessionId);
//		 
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
		
    	model.addAttribute("metaDataSearchList", metaDataSearchList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		
		return "metaDataSearch/excel/metaDataSearchExcelList";
	}
}
