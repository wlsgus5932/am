package egovframework.aviation.metadata.controller.management;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
import egovframework.aviation.metadata.vo.metadata.DeletionVO;
import egovframework.aviation.metadata.vo.param.DeletionParamVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
public class UpdateController {
	
	@Autowired
	private MetaDataService service;

	@Autowired
	private SpecialityService service2;
	
	@PostMapping("/update.do")
	public String updateData(@ModelAttribute MetaDataParamVO param, Model model, HttpServletRequest req) throws Exception {
		System.out.println(param);
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		param.setReg_user(userSessionId);
		try {
			int x = service.updateItemBase(param);
			service.updateGgnuri(param);
			//service.updateKeyword(param);
			
			if(x > 0) {
				 //필수
				 if(param.getUpdate_class1_code_idx() != null && !param.getUpdate_class1_code_idx().get(0).isEmpty()) {
					 HashMap<Integer, Object> classMap = new HashMap<Integer, Object>();
						for (int i = 0; i < param.getUpdate_class1_code_idx().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_class1_code_idx().get(i));
							item.add(param.getUpdate_class2_code_idx().get(i));
							item.add(param.getUpdate_class3_code_idx().get(i));
							classMap.put(i, item);
						}
						service.setTaxonomy(classMap);
					}
				 if(param.getClass1_code_idx() != null && !param.getClass1_code_idx().get(0).isEmpty()) {
					 HashMap<String, Object> classUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getClass1_code_idx().size(); i++) {
						 classUdt.put("class1_code_idx", param.getClass1_code_idx().get(i));
						 classUdt.put("class2_code_idx", param.getClass2_code_idx().get(i));
						 classUdt.put("class3_code_idx", param.getClass3_code_idx().get(i));
						 classUdt.put("taxonomy_idx", param.getTaxonomy_idx().get(i));
						 service.updateTaxonomy(classUdt);
					 }
				 }
				 
				 if(param.getUpdate_country_code_idx() != null && !param.getUpdate_country_code_idx().get(0).isEmpty()) {
					 HashMap<Integer, Object> countryMap = new HashMap<Integer, Object>();
						for (int i = 0; i < param.getUpdate_country_code_idx().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_country_code_idx().get(i));
							item.add(param.getUpdate_era_code_idx().get(i));
							item.add(param.getUpdate_detail_year().get(i));
							countryMap.put(i, item);
						}
						service.setCountry(countryMap);
					}
				 if(param.getCountry_code_idx() != null && !param.getCountry_code_idx().get(0).isEmpty()) {
					 HashMap<String, Object> countryUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getCountry_code_idx().size(); i++) {
						 countryUdt.put("country_code_idx", param.getCountry_code_idx().get(i));
						 countryUdt.put("era_code_idx", param.getEra_code_idx().get(i));
						 countryUdt.put("detail_year", param.getDetail_year().get(i));
						 countryUdt.put("country_idx", param.getCountry_idx().get(i));
						 service.updateCountry(countryUdt);
					 }
				 }
				 
				 if(param.getUpdate_material1_code_idx() != null && !param.getUpdate_material1_code_idx().get(0).isEmpty()) {
					 HashMap<Integer, Object> materialMap = new HashMap<Integer, Object>();
					 for (int i = 0; i < param.getUpdate_material1_code_idx().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_material1_code_idx().get(i));
							item.add(param.getUpdate_material2_code_idx().get(i));
							item.add(param.getUpdate_material_detail().get(i));
							materialMap.put(i, item);
					}
					 service.setMaterial(materialMap);
				 }
				 
				 if(param.getMaterial1_code_idx() != null && !param.getMaterial1_code_idx().isEmpty()) {
					 HashMap<String, Object> materialUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getMaterial1_code_idx().size(); i++) {
						 materialUdt.put("material1_code_idx", param.getMaterial1_code_idx().get(i));
						 materialUdt.put("material2_code_idx", param.getMaterial2_code_idx().get(i));
						 materialUdt.put("material_detail", param.getMaterial_detail().get(i));
						 materialUdt.put("material_idx", param.getMaterial_idx().get(i));
						 service.updateMaterial(materialUdt);
					 }
				 }
				 
				 if(param.getUpdate_measurement_item_type() != null && !param.getUpdate_measurement_item_type().get(0).isEmpty()) {
					 HashMap<Integer, Object> measureMap = new HashMap<Integer, Object>();
					 for (int i = 0; i < param.getUpdate_measurement_item_type().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_measurement_code_idx().get(i));
							item.add(param.getUpdate_measurement_unit_code_idx().get(i));
							item.add(param.getUpdate_measurement_value().get(i));
							item.add(param.getUpdate_measurement_item_type().get(i));
							measureMap.put(i, item);
					}
					 service.setMeasurement(measureMap);
				 }
				 
				 if(param.getMeasurement_code_idx() != null && !param.getMeasurement_code_idx().get(0).isEmpty()) {
	 				 HashMap<String, Object> measurementUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getMaterial1_code_idx().size(); i++) {
						 measurementUdt.put("measurement_item_type", param.getMeasurement_item_type().get(i));
						 measurementUdt.put("measurement_unit_code_idx", param.getMeasurement_unit_code_idx().get(i));
						 measurementUdt.put("measurement_value", param.getMeasurement_value().get(i));
						 measurementUdt.put("measurement_code_idx", param.getMeasurement_code_idx().get(i));
						 measurementUdt.put("measurement_idx", param.getMeasurement_idx().get(i));
						 service.updateMeasurement(measurementUdt);
					 }
				 }
				 
				 if(param.getUpdate_invol_item_no() != null && !param.getUpdate_invol_item_no().get(0).isEmpty()) {
					 HashMap<Integer, Object> possessionMap = new HashMap<Integer, Object>();
					 for (int i = 0; i < param.getUpdate_invol_item_no().size(); i++) {
						 List<Object> item = new ArrayList<>();
						 item.add(param.getItem_idx());
						 item.add(param.getReg_user());
						 item.add(param.getOrg_code_idx());
						 item.add(param.getUpdate_invol_possession_code_idx().get(i));
						 item.add(param.getUpdate_invol_item_no().get(i));
						 item.add(param.getUpdate_invol_remark().get(i));
						 possessionMap.put(i, item);
					 }
					 service.setInvolvement(possessionMap);
				 }
				 if(param.getInvol_item_no() != null && !param.getInvol_item_no().get(0).isEmpty()) {
					 HashMap<String, Object> involvementUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getInvol_item_no().size(); i++) {
						 involvementUdt.put("invol_possession_code_idx", param.getInvol_possession_code_idx().get(i));
						 involvementUdt.put("invol_item_no", param.getInvol_item_no().get(i));
						 involvementUdt.put("invol_remark", param.getInvol_remark().get(i));
						 involvementUdt.put("involvement_idx", param.getInvolvement_idx().get(i));
						 service.updateInvolvement(involvementUdt);
					 }
				 }
				 
				 if(param.getUpdate_insu_agreed_value() != null && !param.getUpdate_insu_agreed_value().get(0).isEmpty()) {
					 HashMap<Integer, Object> insuranceMap = new HashMap<Integer, Object>();
					 for (int i = 0; i < param.getUpdate_insu_agreed_value().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_insu_agreed_value().get(i));
							item.add(param.getUpdate_insu_price_unit_code_idx().get(i));
							item.add(param.getUpdate_insu_start_date().get(i));
							item.add(param.getUpdate_insu_end_date().get(i));
							item.add(param.getUpdate_insu_rental_org().get(i));
							item.add(param.getUpdate_insu_remark().get(i));
							insuranceMap.put(i, item);
					 }
					 service.setInsurance(insuranceMap);
				 }
				 if(param.getInsu_agreed_value() != null && !param.getInsu_agreed_value().isEmpty()) {
					 HashMap<String, Object> insuranceUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getInsu_agreed_value().size(); i++) {
						 insuranceUdt.put("agreed_value", param.getInsu_agreed_value().get(i));
						 insuranceUdt.put("price_unit_code_idx", param.getInsu_price_unit_code_idx().get(i));
						 insuranceUdt.put("start_date", param.getInsu_start_date().get(i));
						 insuranceUdt.put("end_date", param.getInsu_end_date().get(i));
						 insuranceUdt.put("rental_org", param.getInsu_rental_org().get(i));
						 insuranceUdt.put("remark", param.getInsu_remark().get(i));
						 insuranceUdt.put("insurance_idx", param.getInsurance_idx().get(i));
						 service.updateInsurance(insuranceUdt);
					 }
				 }
				 
				 if(param.getUpdate_copy_copyright() != null && !param.getUpdate_copy_copyright().get(0).isEmpty()) {
					 HashMap<Integer, Object> copyrightMap = new HashMap<Integer, Object>();
					 for (int i = 0; i < param.getUpdate_copy_copyright().size(); i++) {
							List<Object> item = new ArrayList<>();
							item.add(param.getItem_idx());
							item.add(param.getReg_user());
							item.add(param.getUpdate_copy_copyright().get(i));
							item.add(param.getUpdate_copy_owner().get(i));
							item.add(param.getUpdate_copy_expiry_date().get(i));
							item.add(param.getUpdate_copy_usage_permission().get(i));
							item.add(param.getUpdate_copy_copyright_transfer().get(i));
							item.add(param.getUpdate_copy_remark().get(i));
							copyrightMap.put(i, item);
					 }
					 service.setCopyright(copyrightMap);
				 }
				 if(param.getCopy_copyright() != null && !param.getCopy_copyright().get(0).isEmpty()) {
					 HashMap<String, Object> copyrightUdt = new HashMap<String, Object>();
					 for(int i=0; i<param.getCopy_copyright().size(); i++) {
						 copyrightUdt.put("copyright", param.getCopy_copyright().get(i));
						 copyrightUdt.put("owner", param.getCopy_owner().get(i));
						 copyrightUdt.put("expiry", param.getCopy_expiry_date().get(i));
						 copyrightUdt.put("permission", param.getCopy_usage_permission().get(i));
						 copyrightUdt.put("transfer", param.getCopy_copyright_transfer().get(i));
						 copyrightUdt.put("remark", param.getCopy_remark().get(i));
						 copyrightUdt.put("copyright_idx", param.getCopyright_idx().get(i));
						 service.updateCopyright(copyrightUdt);
					 }
				 }
				 
				 List<ObtainmentVO> ob = service.getObtainmentList(param.getItem_idx());
				 System.out.println("ob:::"+ob);
				 if(!ob.isEmpty()) {
					 service.updateObtainment(param);
				 } else if(ob.isEmpty()) {
					 if(!param.getObt_obtainment_date().isEmpty()|| !param.getObt_obtainment_code_idx().equals("0")
								|| !param.getObt_purchase1_code_idx().equals("0") || !param.getObt_purchase2_code_idx().equals("0")
								|| !param.getObt_obtainment_price().isEmpty() || !param.getObt_price_unit_code_idx().equals("0")
								|| !param.getObt_won_exchange().isEmpty() || !param.getObt_obtainment_no().isEmpty()
								|| !param.getObt_obtainment_place().isEmpty() || !param.getObt_record_date().isEmpty()
								|| !param.getObt_designation().equals("N") || !param.getObt_redemption().equals("N")) {
								 
								 service.setObtainment(param); 
					 	}
				 }
			}
			
			model.addAttribute("item_idx", param.getItem_idx());
			model.addAttribute("result", "success");
			return "jsonView";
		} catch (Exception e) {
			System.out.println(e);
			model.addAttribute("result", "error");
			return "jsonView";
		}
	}
		
	@PostMapping("/deleteTaxonomy.do")
	@ResponseBody
	public String deleteTaxonomy(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getTaxonomy_idx().get(0).split(",");
			int x = service.deleteTaxonomy(arr);
			System.out.println(x);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
//	@PostMapping("/update.do")
//	@ResponseBody
//	public String updateData(@ModelAttribute MetaDataParamVO param, Model model, HttpServletRequest req) throws Exception {
//		System.out.println(param);
//		String result = "error";
//		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
//		param.setReg_user(userSessionId);
//		try {
//			int x = service.updateItemBase(param);
//			service.updateObtainment(param);
//			service.updateGgnuri(param);
//			//service.updateKeyword(param);
//			HashMap<Integer, Object> classMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> countryMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> materialMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> measurementMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> involMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> insuMap = new HashMap<Integer, Object>();
//			HashMap<Integer, Object> copyMap = new HashMap<Integer, Object>();
//			
//			if(param.getUpdate_class1_code_idx() != null) {
//				for (int i = 0; i < param.getUpdate_class1_code_idx().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_class1_code_idx().get(i));
//					item.add(param.getUpdate_class2_code_idx().get(i));
//					item.add(param.getUpdate_class3_code_idx().get(i));
//					classMap.put(i, item);
//				}
//				service.setTaxonomy(classMap);
//			}
//			
//			if(param.getUpdate_country_code_idx() != null) {
//				for (int i = 0; i < param.getUpdate_country_code_idx().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_country_code_idx().get(i));
//					item.add(param.getUpdate_era_code_idx().get(i));
//					item.add(param.getUpdate_detail_year().get(i));
//					countryMap.put(i, item);
//				}
//				service.setCountry(countryMap);
//			}
//			
//			if(param.getUpdate_material1_code_idx() != null) {
//				for (int i = 0; i < param.getUpdate_material1_code_idx().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_material1_code_idx().get(i));
//					item.add(param.getUpdate_material2_code_idx().get(i));
//					item.add(param.getUpdate_material_detail().get(i));
//					materialMap.put(i, item);
//				}
//				service.setMaterial(materialMap);
//			}
//			
//			if(param.getUpdate_measurement_item_type() != null) {
//				for (int i = 0; i < param.getUpdate_measurement_item_type().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_measurement_item_type().get(i));
//					item.add(param.getUpdate_measurement_code_idx().get(i));
//					item.add(param.getUpdate_measurement_value().get(i));
//					item.add(param.getUpdate_measurement_unit_code_idx().get(i));
//					measurementMap.put(i, item);
//				}
//				service.setMeasurement(measurementMap);
//			}
//			
//			if(param.getUpdate_invol_possession_code_idx() != null) {
//				for (int i = 0; i < param.getUpdate_invol_possession_code_idx().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getOrg_code_idx());
//					item.add(param.getUpdate_invol_possession_code_idx().get(i));
//					item.add(param.getUpdate_invol_item_no().get(i));
//					item.add(param.getUpdate_invol_remark().get(i));
//					involMap.put(i, item);
//				}
//				service.setInvolvement(involMap);
//			}
//			
//			if(param.getUpdate_insu_agreed_value() != null) {
//				for (int i = 0; i < param.getUpdate_insu_agreed_value().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_insu_agreed_value().get(i));
//					item.add(param.getUpdate_insu_price_unit_code_idx().get(i));
//					item.add(param.getUpdate_insu_start_date().get(i));
//					item.add(param.getUpdate_insu_end_date().get(i));
//					item.add(param.getUpdate_insu_rental_org().get(i));
//					item.add(param.getUpdate_insu_remark().get(i));
//					insuMap.put(i, item);
//				}
//				service.setInsurance(insuMap);
//			}
//			
//			if(param.getUpdate_copy_copyright() != null) {
//				System.out.println(param.getUpdate_copy_copyright().size());
//				for (int i = 0; i < param.getUpdate_copy_copyright().size(); i++) {
//					List<Object> item = new ArrayList<>();
//					item.add(param.getItem_idx());
//					item.add(param.getReg_user());
//					item.add(param.getUpdate_copy_copyright().get(i));
//					item.add(param.getUpdate_copy_owner().get(i));
//					item.add(param.getUpdate_copy_expiry_date().get(i));
//					item.add(param.getUpdate_copy_usage_permission().get(i));
//					item.add(param.getUpdate_copy_copyright_transfer().get(i));
//					item.add(param.getUpdate_copy_remark().get(i));
//					copyMap.put(i, item);
//				}
//				service.setCopyright(copyMap);
//			}
//			result = "success";
//			return result;
//		} catch (Exception e) {
//			return result;
//		}
//	}
//		
//	@PostMapping("/deleteTaxonomy.do")
//	@ResponseBody
//	public String deleteTaxonomy(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
//		String result = "error";
//		try {
//			String[] arr = param.getTaxonomy_idx().get(0).split(",");
//			int x = service.deleteTaxonomy(arr);
//			System.out.println(x);
//			if(x!=0) {
//				result = "success";
//			}
//			return result;
//		} catch (Exception e) {
//			return result;
//		}
//	}
		
	@PostMapping("/deleteCountry.do")
	@ResponseBody
	public String deleteCountry(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getCountry_idx().get(0).split(",");
			int x = service.deleteCountry(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteMaterial.do")
	@ResponseBody
	public String deleteMaterial(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getMaterial_idx().get(0).split(",");
			int x = service.deleteMaterial(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteMeasurement.do")
	@ResponseBody
	public String deleteMeasurement(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getMeasurement_idx().get(0).split(",");
			int x = service.deleteMeasurement(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteInvolvement.do")
	@ResponseBody
	public String deleteInvolvement(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getInvolvement_idx().get(0).split(",");
			int x = service.deleteInvolvement(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteInsurance.do")
	@ResponseBody
	public String deleteInsurance(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getInsurance_idx().get(0).split(",");
			int x = service.deleteInsurance(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteCopyright.do")
	@ResponseBody
	public String deleteCopyright(@ModelAttribute MetaDataParamVO param, Model model) throws Exception {
		String result = "error";
		try {
			String[] arr = param.getCopyright_idx().get(0).split(",");
			int x = service.deleteCopyright(arr);
			if(x!=0) {
				result = "success";
			}
			return result;
		} catch (Exception e) {
			return result;
		}
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
		
		return "metadata/management/update/update";
	}
	
	@PostMapping("/getDeletionList.do")
	public String getDeletionList(@ModelAttribute DeletionParamVO param, @ModelAttribute Criteria cri, Model model) throws Exception {
		System.out.println(cri.getPerPageNum() + ","+ param.getPerPageNum());
		System.out.println(param);
		String result = "metadata/management/update/deletion";
		int perPageNum = service.getDeletionCnt(param);
		System.out.println("perPageNum:::"+ perPageNum);
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
	    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
	    
		List<DeletionVO> list = service.getDeletionList(param);
		System.out.println(list);
		System.out.println(list.size());
		model.addAttribute("deletionList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		return result;
	}
	
	@PostMapping("/deleteDeletion.do")
	@ResponseBody
	public String deleteDeletion(@ModelAttribute DeletionParamVO param, Model model) throws Exception {
		System.out.println(param);
		String result = "error";
		try {
			Map<Integer, Object> map = new HashMap<Integer, Object>();
			for (int i = 0; i < param.getItem_no().size(); i++) {
				List<Object> item = new ArrayList<>();
				item.add(param.getItem_idx().get(i));
				item.add(param.getOrg_nm());
				item.add(param.getPossession_nm());
				item.add(param.getItem_no().get(i));
				item.add(param.getItem_detail_no().get(i));
				item.add(param.getItem_nm().get(i));
				if(param.getErasure_reason().equals("")) {
					item.add("잘못 입력된 자료정보입니다.");
				} else {
					item.add(param.getErasure_reason());
				}
				item.add(param.getAproval_state());
				item.add(param.getReg_user());
				map.put(i, item);
			}
			int x = service.deleteDeletion(map);
			
			if(x > 0) {
				result = "success";
			}
			return result;
			
		} catch (Exception e) {
			return result;
		}
	}

}
