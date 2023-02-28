package egovframework.aviation.metadata.controller.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;

@Controller
public class UpdateController {
	
	@Autowired
	private MetaDataService service;

	@Autowired
	private SpecialityService service2;
	
	@PostMapping("/update.do")
	public String updateData(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		System.out.println(param);
		try {
			int x = service.updateItemBase(param);
			
			if(x != 0) {
				service.updateObtainment(param);
				service.updateGgnuri(param);
				service.updateKeyword(param);
			}
			
		} catch (Exception e) {
		}
		
		
//		try {
//			 int x = service.setItemBase(param);
//			 
//			 if(x == 1) {
//				 HashMap<Integer, Object> classMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> countryMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> materialMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> measureMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> possessionMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> insuranceMap = new HashMap<Integer, Object>();
//				 HashMap<Integer, Object> copyrightMap = new HashMap<Integer, Object>();
//				 
//				 for (int i = 0; i < param.getClass1_code_idx().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getClass1_code_idx().get(i));
//						item.add(param.getClass2_code_idx().get(i));
//						item.add(param.getClass3_code_idx().get(i));
//						classMap.put(i, item);
//						}
//				 for (int i = 0; i < param.getCountry_code_idx().size(); i++) {
//						List<Object> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getCountry_code_idx().get(i));
//						item.add(param.getEra_code_idx().get(i));
//						item.add(param.getDetail_year().get(i));
//						countryMap.put(i, item);
//						}
//				 for (int i = 0; i < param.getMaterial1_code_idx().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getMaterial1_code_idx().get(i));
//						item.add(param.getMaterial2_code_idx().get(i));
//						item.add(param.getMaterial_detail().get(i));
//						materialMap.put(i, item);
//						}
//				 for (int i = 0; i < param.getMeasurement_value().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getMeasurement_code_idx().get(i));
//						item.add(param.getMeasurement_unit_code_idx().get(i));
//						item.add(param.getMeasurement_value().get(i));
//						item.add(param.getMeasurement_item_type().get(i));
//						measureMap.put(i, item);
//						}
//				 for (int i = 0; i < param.getInvol_org_code_idx().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getInvol_org_code_idx().get(i));
//						item.add(param.getInvol_possession_code_idx().get(i));
//						item.add(param.getInvol_item_no().get(i));
//						item.add(param.getInvol_remark().get(i));
//						possessionMap.put(i, item);
//				 		}
//				 for (int i = 0; i < param.getInsu_price_unit_code_idx().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getInsu_agreed_value().get(i));
//						item.add(param.getInsu_price_unit_code_idx().get(i));
//						item.add(param.getInsu_start_date().get(i));
//						item.add(param.getInsu_end_date().get(i));
//						item.add(param.getInsu_rental_org().get(i));
//						item.add(param.getInsu_remark().get(i));
//						insuranceMap.put(i, item);
//				 		}
//				 for (int i = 0; i < param.getInsu_price_unit_code_idx().size(); i++) {
//						List<String> item = new ArrayList<>();
//						item.add(param.getReg_user());
//						item.add(param.getCopy_copyright().get(i));
//						item.add(param.getCopy_owner().get(i));
//						item.add(param.getCopy_expiry_date().get(i));
//						item.add(param.getCopy_usage_permission().get(i));
//						item.add(param.getCopy_copyright_transfer().get(i));
//						item.add(param.getCopy_remark().get(i));
//						copyrightMap.put(i, item);
//				 		}
//				service.setTaxonomy(classMap);
//				service.setCountry(countryMap);
//				service.setMaterial(materialMap);
//				service.setMeasurement(measureMap);
//				service.setObtainment(param);
//				service.setInvolvement(possessionMap);
//				service.setInsurance(insuranceMap);
//				service.setCopyright(copyrightMap);
//				service.setGgnuri(param);
//				service.setKeyword(param);
//				
//				model.addAttribute("item_idx", param.getItem_idx());
//			 }
//			 return "jsonView"; 
//				
//		 } catch (Exception e) {
//			 System.out.println(e); 
//			 return "error"; 
//		 }
		return "ddd";
	}
	
	@GetMapping("/dataUpdate.do")
	public String dataUpdate(Model model) {
		
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
		
		return "metadata/management/update";
	}

}
