package egovframework.aviation.metadata.controller.search;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

@Controller
public class SearchMetaDataController {
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

}
