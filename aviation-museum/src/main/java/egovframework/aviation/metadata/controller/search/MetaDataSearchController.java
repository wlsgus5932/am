package egovframework.aviation.metadata.controller.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
import egovframework.aviation.metadata.vo.ItemBaseVO;
import egovframework.aviation.metadata.vo.Material1VO;
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
import egovframework.aviation.metadata.vo.metadata.CopyrightVO;
import egovframework.aviation.metadata.vo.metadata.CountryEraVO;
import egovframework.aviation.metadata.vo.metadata.InsuranceVO;
import egovframework.aviation.metadata.vo.metadata.InvolvementVO;
import egovframework.aviation.metadata.vo.metadata.KeywordVO;
import egovframework.aviation.metadata.vo.metadata.MaterialVO;
import egovframework.aviation.metadata.vo.metadata.PublicServiceVO;
import egovframework.aviation.metadata.vo.metadata.TaxonomyVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class MetaDataSearchController {
	@Autowired
	private MetaDataSearchService metaDataSearchService;
	
	@Autowired
	private MetaDataService service;
	
	@Autowired
	private SpecialityService service2;

	@GetMapping("/searchItemBaseChild.do")
	public String searchClassCode(Model model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<TaxonomyVO> taxo = service.getTaxonomy(item_idx);
		List<CountryEraVO> country = service.getCountryEra(item_idx);
		List<MaterialVO> mate = service.getMaterial(item_idx);
		List<MeasurementVO> mea = service.getMeasure(item_idx);
		List<ObtainmentVO> obta = service.getObtainmentList(item_idx);
		List<InvolvementVO> invol = service.getInvolvementList(item_idx);
		List<InsuranceVO> insu = service.getInsuranceList(item_idx);
		List<CopyrightVO> copy = service.getCopyrightList(item_idx);
		List<PublicServiceVO> ps = service.getPublicService(item_idx);
		List<KeywordVO> key = service.getKewordList(item_idx);
		
		
		model.addAttribute("taxonomyList", taxo);
		model.addAttribute("countryList", country);
		model.addAttribute("materialList", mate);
		model.addAttribute("measurementList", mea);
		model.addAttribute("obtainmentList", obta);
		model.addAttribute("involvementList", invol);
		model.addAttribute("InsuranceList", insu);
		model.addAttribute("copyrightList", copy);
		model.addAttribute("publicServiceList", ps);
		model.addAttribute("keywordList", key);
		
		return "jsonView";
	}
	
	@PostMapping("/searchItemBase.do")
	public String searchItemBase(Model model, @ModelAttribute MetaDataParamVO param) throws Exception {
		System.out.println(param);
		List<ItemBaseVO> list = service.getItemBase(param);
		model.addAttribute("itemBaseList", list);
		
		return "jsonView";
	}
	
	@PostMapping("/getKeywordList.do")
	public String getKeywordList(Model model, @ModelAttribute MetaDataParamVO param) throws Exception {
		List<KeywordVO> list = service.getKeywordList(param);
		model.addAttribute("keywordList", list);
		System.out.println("keyword:::"+list);
		
		return "metadata/search/keywordList";
	}
	
	@GetMapping("/metaDataList.do")
	public String getMetaDataList(Model model) throws Exception {
		try {
			List<CountryVO> country = service.getCountry();
			List<Material1VO> material = service.getMaterial1();
			List<IcaoVO> icao = service.getIcao();
			List<ExistenceVO> existence = service.getExistence();
			List<MeasurementVO> measurement = service.getMeasurement();
			List<MeasurementUnitVO> measurementUnit = service.getMeasurementUnit();
			List<Class1VO> class1 = service.getClass1();
			List<Class2VO> class2 = service.getClass2();
			List<Class3VO> class3 = service.getClass3();
			List<ObtainmentVO> obtainment = service.getObtainment();
			List<Purchase1VO> purchase1 = service.getPurchase1();
			List<Purchase2VO> purchase2 = service.getPurchase2();
			List<PriceUnitVO> price = service.getPriceUnit();
			List<QtyUnitVO> qty = service.getQtyUnit();
			List<ConditionVO> condition = service.getCondition();
			List<RankingVO> ranking = service.getRanking();
			List<PosSessionVO> possession = service.getPosSession();
			List<GgnuriVO> ggnuri = service.getGgnuri();
			List<OrgVO> org = service.getOrg();
			List<StorageType1VO> type1 = service.getStorageType1();
			List<StorageVO> storage = service.getStorage(0);
			List<SpecialityCodeVO> scCode = service2.getSpecialityCode();
			
			
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
			
			
			return "metadata/search/searchMetaData";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "cmmn/egovError";
		}
	}
	
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
	
	
}
