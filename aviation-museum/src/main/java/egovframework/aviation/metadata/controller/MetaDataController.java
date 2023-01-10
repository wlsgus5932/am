package egovframework.aviation.metadata.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.Class1VO;
import egovframework.aviation.metadata.vo.Class2VO;
import egovframework.aviation.metadata.vo.Class3VO;
import egovframework.aviation.metadata.vo.ConditionVO;
import egovframework.aviation.metadata.vo.CountryVO;
import egovframework.aviation.metadata.vo.EraVO;
import egovframework.aviation.metadata.vo.ExistenceVO;
import egovframework.aviation.metadata.vo.GgnuriVO;
import egovframework.aviation.metadata.vo.IcaoVO;
import egovframework.aviation.metadata.vo.Material1VO;
import egovframework.aviation.metadata.vo.Material2VO;
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
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;

@Controller
@RequestMapping("/metadata")
public class MetaDataController {
	
	@Autowired
	private MetaDataService service;
	
	@GetMapping("/add.do")
	public String addMetaDataForm(Model model) throws Exception {
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
			
			return "metadata/add";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "cmmn/egovError";
		}
//		System.out.println(org);
//		model.addAttribute("session", session.getId());
	}
	
	@PostMapping("/add.do")
	@ResponseBody
	public String addMetaForm(@ModelAttribute MetaDataParamVO param) throws Exception {
		System.out.println(param);
		 try { 
			 int x = service.setItemBase(param); 
			 
			 if(x == 1) {
				 service.setTaxonomy(param); 
				 service.setCountry(param);
				 service.setMaterial(param);
				 service.setMeasurement(param);
				 service.setObtainment(param);
				 service.setInvolvement(param);
				 service.setInsurance(param);
				 service.setCopyright(param);
				 service.setGgnuri(param);
				 service.setKeyword(param);
			 }
		 	return "success"; 
		 } catch (Exception e) {
			 System.out.println(e); 
			 return "error"; 
		 }
	}
	
	@GetMapping("/getEraData.do")
	public String getEraData(@RequestParam("country") int country, ModelMap model) throws Exception {
		List<EraVO> list = service.getEra(country);
		model.addAttribute("eraList", list);
		
		return "jsonView";
	}
	
	@GetMapping("/getMaterialData.do")
	public String getMaterialData(@RequestParam("material") int material, ModelMap model) throws Exception {
		List<Material2VO> list = service.getMaterial2(material);
		model.addAttribute("material2List", list);
		
		return "jsonView";
	}

}
