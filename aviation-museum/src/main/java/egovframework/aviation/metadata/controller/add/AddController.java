package egovframework.aviation.metadata.controller.add;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.service.impl.MetaDataMapper;
import egovframework.aviation.metadata.vo.Class1VO;
import egovframework.aviation.metadata.vo.Class2VO;
import egovframework.aviation.metadata.vo.Class3VO;
import egovframework.aviation.metadata.vo.ConditionVO;
import egovframework.aviation.metadata.vo.CountryVO;
import egovframework.aviation.metadata.vo.EraVO;
import egovframework.aviation.metadata.vo.ExistenceVO;
import egovframework.aviation.metadata.vo.GgnuriVO;
import egovframework.aviation.metadata.vo.IcaoVO;
import egovframework.aviation.metadata.vo.ItemBaseVO;
import egovframework.aviation.metadata.vo.Material1VO;
import egovframework.aviation.metadata.vo.Material2VO;
import egovframework.aviation.metadata.vo.MeasurementUnitVO;
import egovframework.aviation.metadata.vo.MeasurementVO;
import egovframework.aviation.metadata.vo.MovementVO;
import egovframework.aviation.metadata.vo.ObtainmentVO;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.metadata.vo.PriceUnitVO;
import egovframework.aviation.metadata.vo.Purchase1VO;
import egovframework.aviation.metadata.vo.Purchase2VO;
import egovframework.aviation.metadata.vo.QtyUnitVO;
import egovframework.aviation.metadata.vo.RankingVO;
import egovframework.aviation.metadata.vo.StorageType1VO;
import egovframework.aviation.metadata.vo.StorageType2VO;
import egovframework.aviation.metadata.vo.StorageVO;
import egovframework.aviation.metadata.vo.metadata.CopyrightVO;
import egovframework.aviation.metadata.vo.metadata.CountryEraVO;
import egovframework.aviation.metadata.vo.metadata.InsuranceVO;
import egovframework.aviation.metadata.vo.metadata.InvolvementVO;
import egovframework.aviation.metadata.vo.metadata.KeywordVO;
import egovframework.aviation.metadata.vo.metadata.MaterialVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.metadata.PublicServiceVO;
import egovframework.aviation.metadata.vo.metadata.TaxonomyVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.param.MovementParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;

@Controller
//@RequestMapping("/metadata")
public class AddController {
	
	@Autowired
	private MetaDataService service;
	
	@Autowired
	private SpecialityService service2;
	
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
			
			
			return "metadata/add/add";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "cmmn/egovError";
		}
		
	}
	
	@PostMapping("/add.do")
	public String addMetaForm(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		try {
			System.out.println(param);
			 int x = service.setItemBase(param);
			 
			 if(x == 1) {
				 HashMap<Integer, Object> classMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> countryMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> materialMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> measureMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> possessionMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> insuranceMap = new HashMap<Integer, Object>();
				 HashMap<Integer, Object> copyrightMap = new HashMap<Integer, Object>();
				 
				 for (int i = 0; i < param.getClass1_code_idx().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getClass1_code_idx().get(i));
						item.add(param.getClass2_code_idx().get(i));
						item.add(param.getClass3_code_idx().get(i));
						classMap.put(i, item);
						}
				 for (int i = 0; i < param.getCountry_code_idx().size(); i++) {
						List<Object> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getCountry_code_idx().get(i));
						item.add(param.getEra_code_idx().get(i));
						item.add(param.getDetail_year().get(i));
						countryMap.put(i, item);
						}
				 for (int i = 0; i < param.getMaterial1_code_idx().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getMaterial1_code_idx().get(i));
						item.add(param.getMaterial2_code_idx().get(i));
						item.add(param.getMaterial_detail().get(i));
						materialMap.put(i, item);
						}
				 for (int i = 0; i < param.getMeasurement_value().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getMeasurement_code_idx().get(i));
						item.add(param.getMeasurement_unit_code_idx().get(i));
						item.add(param.getMeasurement_value().get(i));
						item.add(param.getMeasurement_item_type().get(i));
						measureMap.put(i, item);
						}
				 for (int i = 0; i < param.getInvol_org_code_idx().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getInvol_org_code_idx().get(i));
						item.add(param.getInvol_possession_code_idx().get(i));
						item.add(param.getInvol_item_no().get(i));
						item.add(param.getInvol_remark().get(i));
						possessionMap.put(i, item);
				 		}
				 for (int i = 0; i < param.getInsu_price_unit_code_idx().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getInsu_agreed_value().get(i));
						item.add(param.getInsu_price_unit_code_idx().get(i));
						item.add(param.getInsu_start_date().get(i));
						item.add(param.getInsu_end_date().get(i));
						item.add(param.getInsu_rental_org().get(i));
						item.add(param.getInsu_remark().get(i));
						insuranceMap.put(i, item);
				 		}
				 for (int i = 0; i < param.getInsu_price_unit_code_idx().size(); i++) {
						List<String> item = new ArrayList<>();
						item.add(param.getReg_user());
						item.add(param.getCopy_copyright().get(i));
						item.add(param.getCopy_owner().get(i));
						item.add(param.getCopy_expiry_date().get(i));
						item.add(param.getCopy_usage_permission().get(i));
						item.add(param.getCopy_copyright_transfer().get(i));
						item.add(param.getCopy_remark().get(i));
						copyrightMap.put(i, item);
				 		}
				service.setTaxonomy(classMap);
				service.setCountry(countryMap);
				service.setMaterial(materialMap);
				service.setMeasurement(measureMap);
				service.setObtainment(param);
				service.setInvolvement(possessionMap);
				service.setInsurance(insuranceMap);
				service.setCopyright(copyrightMap);
				service.setGgnuri(param);
				service.setKeyword(param);
				
				model.addAttribute("item_idx", param.getItem_idx());
			 }
			 return "jsonView"; 
				
		 } catch (Exception e) {
			 System.out.println(e); 
			 return "error"; 
		 }
	}
	
	@PostMapping("/addMovement.do")
	public String addMovementForm(Model model, @ModelAttribute MovementParamVO param) throws Exception {
		try {
			 int v = service.setMovement(param);
			 
			 if(v == 1) {
				 param.getStorage1_code_idx().removeAll(Arrays.asList("", null));
				 param.getStorage2_code_idx().removeAll(Arrays.asList("", null));
				 
				 service.setStorage(param);
				 service.setStorage2(param);
			 }
			 model.addAttribute("movement_idx", param.getMovement_idx());
			 return "jsonView"; 
		 } catch (Exception e) {
			 System.out.println(e); 
			 return "error"; 
		 }
	}
	
	@PostMapping("/modifyMovement.do")
	@ResponseBody
	public String modifyMovementForm(@ModelAttribute MovementParamVO param) throws Exception {
		try {
			int x = service.updateMovement(param);
			
			if(x != 0) {
				param.getStorage1_code_idx().removeAll(Arrays.asList("", null));
				param.getStorage2_code_idx().removeAll(Arrays.asList("", null));
				int y =  service.deleteStorage(param.getMovement_idx());
				
				if(y != 0) {
					service.setStorage(param);
					service.setStorage2(param);
				}
			}
			return "success"; 
		 } catch (Exception e) {
			 System.out.println(e); 
			 return "error"; 
		 }
	}
	
	@GetMapping("/deleteMovement.do")
	@ResponseBody
	public String deleteMovement(@RequestParam("movement") int movement_idx) throws Exception {
		try {
			int x = service.deleteStorage(movement_idx);
			if(x == 1) {
				service.deleteMovement(movement_idx);
			}
			
			return "success";
		} catch (Exception e) {
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
	
	@GetMapping("/getStorageType2.do")
	public String getStorageType2(@RequestParam("type2") int type2, ModelMap model) throws Exception {
		List<StorageType2VO> list = service.getStorageType2(type2);
		model.addAttribute("storage2List", list);
		
		return "jsonView";
	}
	
	@GetMapping("/getMovementData.do")
	public String getMovementData(ModelMap model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<MovementVO> list = service.getMovement(item_idx);
		model.addAttribute("movementList", list);
		
		return "jsonView";
	}
	
	@GetMapping("/getStorageCode.do")
	public String getStorageData(ModelMap model, @RequestParam("storage") int stroage) throws Exception {
		List<StorageVO> list = service.getStorage(stroage);
		model.addAttribute("storageCodeList", list);
		
		return "jsonView";
	}
}
