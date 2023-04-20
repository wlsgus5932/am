package egovframework.aviation.metadata.controller.add;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.service.impl.MetaDataMapper;
import egovframework.aviation.metadata.vo.Class1VO;
import egovframework.aviation.metadata.vo.Class2VO;
import egovframework.aviation.metadata.vo.Class3VO;
import egovframework.aviation.metadata.vo.ConditionVO;
import egovframework.aviation.metadata.vo.CountryVO;
import egovframework.aviation.metadata.vo.EraVO;
import egovframework.aviation.metadata.vo.ExchangeVO;
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
import egovframework.aviation.metadata.vo.param.AllChangeItemParamVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.param.MovementParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
//@RequestMapping("/metadata")
public class AddController {
	
	@Autowired
	private MetaDataService service;
	
	@Autowired
	private SpecialityService service2;
	
	@Autowired
	private MetaDataMapper mapper;
	
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
			List<ExchangeVO> exchange = service.getExchange();
			
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
			model.addAttribute("exchangeList", exchange);
			
			
			return "metadata/add/add";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "cmmn/egovError";
		}
		
	}
	
	@PostMapping("/add.do")
	public String addMetaForm(@ModelAttribute MetaDataParamVO param, Model model, HttpServletRequest req) throws Exception {
		try {
			String searchItemNo = service.searchItemNo(param);
			if(searchItemNo == null) {
				String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
				param.setReg_user(userSessionId);
				 int x = service.setItemBase(param);
				 System.out.println(param);
				 
				 if(x == 1) {
					 HashMap<Integer, Object> classMap = new HashMap<Integer, Object>();
					 HashMap<Integer, Object> countryMap = new HashMap<Integer, Object>();
					 HashMap<Integer, Object> materialMap = new HashMap<Integer, Object>();
					 HashMap<Integer, Object> measureMap = new HashMap<Integer, Object>();
					 
					 //필수
					 System.out.println("ddd:::"+param.getClass1_code_idx().get(0));
					 if(param.getClass1_code_idx() != null && !param.getClass1_code_idx().get(0).isEmpty() && !param.getClass1_code_idx().get(0).equals("0")) {
						 for (int i = 0; i < param.getClass1_code_idx().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								item.add(param.getClass1_code_idx().get(i));
								item.add(param.getClass2_code_idx().get(i));
								item.add(param.getClass3_code_idx().get(i));
								classMap.put(i, item);
							}
						 service.setTaxonomy(classMap);
					 }
					 if(param.getCountry_code_idx() != null && !param.getCountry_code_idx().get(0).isEmpty() && !param.getCountry_code_idx().get(0).equals("0")) {
						 for (int i = 0; i < param.getCountry_code_idx().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								 
								item.add(param.getCountry_code_idx().get(i));
								item.add(param.getEra_code_idx().get(i));
								item.add(param.getDetail_year().get(i));
								countryMap.put(i, item);
							}
						 service.setCountry(countryMap);
					 }
					 if(param.getMaterial1_code_idx() != null && !param.getMaterial1_code_idx().get(0).isEmpty() && !param.getMaterial1_code_idx().get(0).equals("0")) {
						 for (int i = 0; i < param.getMaterial1_code_idx().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								item.add(param.getMaterial1_code_idx().get(i));
								item.add(param.getMaterial2_code_idx().get(i));
								item.add(param.getMaterial_detail().get(i));
								materialMap.put(i, item);
							}
						 service.setMaterial(materialMap);
					 }
					 if(param.getMeasurement_code_idx() != null && !param.getMeasurement_code_idx().get(0).isEmpty() && !param.getMeasurement_code_idx().get(0).equals("0")) {
						 for (int i = 0; i < param.getMeasurement_value().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								item.add(param.getMeasurement_code_idx().get(i));
								item.add(param.getMeasurement_unit_code_idx().get(i));
								item.add(param.getMeasurement_value().get(i));
								item.add(param.getMeasurement_item_type().get(i));
								measureMap.put(i, item);
							}
						 service.setMeasurement(measureMap);
					 }
						
					 //
					 if(!param.getObt_obtainment_date().isEmpty()|| !param.getObt_obtainment_code_idx().equals("0")
						|| !param.getObt_purchase1_code_idx().equals("0") || !param.getObt_purchase2_code_idx().equals("0")
						|| !param.getObt_obtainment_price().isEmpty() || !param.getObt_price_unit_code_idx().equals("0")
						|| !param.getObt_won_exchange().isEmpty() || !param.getObt_obtainment_no().isEmpty()
						|| !param.getObt_obtainment_place().isEmpty() || !param.getObt_record_date().isEmpty()
						|| !param.getObt_designation().equals("N") || !param.getObt_redemption().equals("N")) {
						 
						 service.setObtainment(param); 
					 }
					 
					 if(param.getInvol_item_no() != null && !param.getInvol_item_no().get(0).isEmpty()) {
						 HashMap<Integer, Object> possessionMap = new HashMap<Integer, Object>();
						 for (int i = 0; i < param.getInvol_item_no().size(); i++) {
							 List<Object> item = new ArrayList<>();
							 item.add(param.getItem_idx());
							 item.add(param.getReg_user());
							 item.add(param.getOrg_code_idx());
							 item.add(param.getInvol_possession_code_idx().get(i));
							 item.add(param.getInvol_item_no().get(i));
							 item.add(param.getInvol_remark().get(i));
							 possessionMap.put(i, item);
						 }
						 service.setInvolvement(possessionMap);
					 }
					 
					 if(param.getInsu_agreed_value() != null && !param.getInsu_agreed_value().get(0).isEmpty()) {
						 HashMap<Integer, Object> insuranceMap = new HashMap<Integer, Object>();
						 for (int i = 0; i < param.getInsu_price_unit_code_idx().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								item.add(param.getInsu_agreed_value().get(i));
								item.add(param.getInsu_price_unit_code_idx().get(i));
								item.add(param.getInsu_start_date().get(i));
								item.add(param.getInsu_end_date().get(i));
								item.add(param.getInsu_rental_org().get(i));
								item.add(param.getInsu_remark().get(i));
								insuranceMap.put(i, item);
						 }
						 service.setInsurance(insuranceMap);
					 }
					 
					 if(param.getCopy_copyright() != null && !param.getCopy_copyright().get(0).isEmpty() && !param.getCopy_copyright().get(0).equals("0")) {
						 HashMap<Integer, Object> copyrightMap = new HashMap<Integer, Object>();
						 for (int i = 0; i < param.getCopy_owner().size(); i++) {
								List<Object> item = new ArrayList<>();
								item.add(param.getItem_idx());
								item.add(param.getReg_user());
								item.add(param.getCopy_copyright().get(i));
								item.add(param.getCopy_owner().get(i));
								item.add(param.getCopy_expiry_date().get(i));
								item.add(param.getCopy_usage_permission().get(i));
								item.add(param.getCopy_copyright_transfer().get(i));
								item.add(param.getCopy_remark().get(i));
								copyrightMap.put(i, item);
						 }
						 service.setCopyright(copyrightMap);
					 }
					 
					 if(param.getItembasekeyword() != null && !param.getItembasekeyword().get(0).isEmpty()) {
						 List<String> ddd = new ArrayList<String>();
						 String[] arr = param.getItembasekeyword().get(0).split(",");
						 for(int i=0; i<arr.length; i++) {
							 ddd.add(arr[i]);
						 }
						 param.setItembasekeyword(ddd);
						 service.setKeyword(param);
					 }
					 
					service.setGgnuri(param);
					
				 }
				 model.addAttribute("item_idx", param.getItem_idx());
				 model.addAttribute("result", "success");
				 return "jsonView";
			} else {
				model.addAttribute("result", "not");
				return "jsonView";
			}
		 } catch (Exception e) {
			 System.out.println(e);
			 model.addAttribute("result", "error");
			 return "jsonView";
		 }
		
	}
	
	@PostMapping("/addMovement.do")
	public String addMovementForm(Model model, @ModelAttribute MovementParamVO param) throws Exception {
		try {
			 int v = service.setMovement(param);
			 
			 if(v > 0) {
//				 param.getStorage1_code_idx().removeAll(Arrays.asList("", null));
//				 param.getStorage2_code_idx().removeAll(Arrays.asList("", null));
				 
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
	
	@PostMapping("/getMovementList.do")
	public String getMovementList(ModelMap model, @ModelAttribute MovementParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getMovementListCnt(param);
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
	    
		List<MovementVO> list = service.getMovement(param);
		model.addAttribute("movementList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/movement/movementList";
	}
	
	@PostMapping("/getMovemenExceltList.do")
	public String getMovemenExceltList(ModelMap model, @ModelAttribute MovementParamVO param) throws Exception {
		List<MovementVO> list = service.getMovementExcel(param);
		model.addAttribute("movementList", list);
		
		return "metadata/add/movement/movementExcel";
	}
	
	@PostMapping("/getPastMovementList.do")
	public String getPastMovementList(ModelMap model, @ModelAttribute MovementParamVO param) throws Exception {
		List<MovementVO> list = service.getMovement(param);
		model.addAttribute("movementList", list);
		
		return "metadata/add/movement/pastMovement";
	}
	
	@GetMapping("/getMovementData.do")
	public String getMovementData(ModelMap model, @RequestParam("movement_idx") int movement_idx) throws Exception {
		List<MovementVO> list = service.getMovementData(movement_idx);
		model.addAttribute("movementList", list);
		
		return "jsonView";
	}
	
	@GetMapping("/getStorageCode.do")
	public String getStorageData(ModelMap model, @RequestParam("storage") int stroage) throws Exception {
		List<StorageVO> list = service.getStorage(stroage);
		model.addAttribute("storageCodeList", list);
		
		return "jsonView";
	}
	
	@PostMapping("/setItemNo.do")
	@ResponseBody
	public String setItemNo(ModelMap model, @ModelAttribute MetaDataParamVO param) throws Exception {
		String result = "error";
		try {
			String searchItemNo = service.searchItemNo(param);
			System.out.println("search:::"+ searchItemNo);
			if(searchItemNo != null) {
				int x = service.setItemNo(param);
				if(x > 0) {
					result = "success";
				}
			} else if(searchItemNo == null) {
				result = "not";
			}
		} catch (Exception e) {
			result = "error";
		}
		
		return result;
	}
	
	@PostMapping("/getMovementListSc.do")
	public String getMovementListSc(ModelMap model, @ModelAttribute MovementParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getMovementListCnt(param);		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
	    
		List<MovementVO> list = service.getMovement(param);
		model.addAttribute("movementList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/movement/movementListSc";
	}
	
	@PostMapping("/getPastMovementListSc.do")
	public String getPastMovementListSc(ModelMap model, @ModelAttribute MovementParamVO param) throws Exception {
		List<MovementVO> list = service.getMovement(param);
		model.addAttribute("movementList", list);
		
		return "metadata/add/movement/pastMovementSc";
	}
	
	@GetMapping("/getChangeItem.do")
	public String getChangeItem(ModelMap model, @RequestParam("idx") String idx) throws Exception {
		switch(idx) {
		case "country":
			List<CountryVO> country = service.getCountry();
			model.addAttribute("countryList", country);
			break;
		case "material":
			List<Material1VO> material = service.getMaterial1();
			model.addAttribute("material1List", material);
			break;
		case "taxonomy":
			List<Class1VO> class1 = service.getClass1();
			List<Class2VO> class2 = service.getClass2();
			List<Class3VO> class3 = service.getClass3();
			model.addAttribute("class1List", class1);
			model.addAttribute("class2List", class2);
			model.addAttribute("class3List", class3);
			break;
		case "qty":
			List<QtyUnitVO> qty = service.getQtyUnit();
			model.addAttribute("qtyUnitList", qty);
			break;
			
		case "measurement":
			List<MeasurementVO> measurement = service.getMeasurement();
			model.addAttribute("measurementList", measurement);
			break;
		
		case "ranking":
			List<RankingVO> ranking = service.getRanking();
			model.addAttribute("rankingList", ranking);
			break;
			
		case "obtainment":
			List<ObtainmentVO> obtainment = service.getObtainment();
			model.addAttribute("obtainmentList", obtainment);
			break;
		
		case "purchase1":
			List<Purchase1VO> purchase1 = service.getPurchase1();
			model.addAttribute("purchase1List", purchase1);
			break;
		
		case "purchase2":
			List<Purchase2VO> purchase2 = service.getPurchase2();
			model.addAttribute("purchase2List", purchase2);
			break;
		
		case "price_qty":
			List<PriceUnitVO> price = service.getPriceUnit();
			model.addAttribute("priceUnitList", price);
			break;
			
		case "existence":
			List<ExistenceVO> existence = service.getExistence();
			model.addAttribute("existenceList", existence);
			break;
			
		case "storageType":
			List<StorageType1VO> type1 = service.getStorageType1();
			model.addAttribute("storage1List", type1);
			break;
		}
		
		return "jsonView";
	}
	
	@PostMapping("/allChangeItem.do")
	@ResponseBody
	public String allChangeItem(ModelMap model, @ModelAttribute AllChangeItemParamVO param) throws Exception {
		System.out.println(param);
		String result = "error";
		List<Map<String, Object>> dto = null;
		if(param.getChangeItemCheck().equals("Y")) {
			dto = mapper.getItemIdx(param);
		} else {
			dto = mapper.getItemIdx2(param);
		}
		int x = 0;
		
		switch(param.getChangeItem()) {
			case "country":
				x = mapper.changeCountryItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			case "material":
				x = mapper.changeMaterialItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "taxonomy":
				x = mapper.changeTaxonomyItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			case "qty":
				x = mapper.changeQtyItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "measurement":
				x = mapper.changeMeasurementItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "ranking":
				x = mapper.changeRankingItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "obtainment":
				x = mapper.changeObtainmentItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "purchase1":
				x = mapper.changePurchase1Item(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "purchase2":
				x = mapper.changePurchase2Item(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "price_qty":
				x = mapper.changePriceItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "designation":
				x = mapper.changeDesignationItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "existence":
				x = mapper.changeExistenceItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
		}
		return result;
	}
	
	@PostMapping("/oneChangeItem.do")
	@ResponseBody
	public String oneChangeItem(ModelMap model, @ModelAttribute AllChangeItemParamVO param) throws Exception {
		System.out.println(param);
		String result = "error";
		List<Map<String, Object>> dto = mapper.getItemIdx(param);
		int x = 0;
		
		switch(param.getChangeItem()) {
			case "country":
				x = mapper.changeCountryItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			case "material":
				x = mapper.changeMaterialItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "taxonomy":
				x = mapper.changeTaxonomyItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			case "qty":
				x = mapper.changeQtyItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "measurement":
				x = mapper.changeMeasurementItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "ranking":
				x = mapper.changeRankingItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "obtainment":
				x = mapper.changeObtainmentItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "purchase1":
				x = mapper.changePurchase1Item(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
			
			case "purchase2":
				x = mapper.changePurchase2Item(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "price_qty":
				x = mapper.changePriceItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "designation":
				x = mapper.changeDesignationItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
				
			case "existence":
				x = mapper.changeExistenceItem(param, dto);
				if(x > 0) {
					result = "success";
				}
				break;
		}
		return result;
	}
	
	@PostMapping("/searchItemBase2.do")
	public String getMetadata(ModelMap model, @ModelAttribute MetaDataParamVO param) throws Exception {
		List<ItemBaseVO> list = mapper.getItemBase2(param);
		model.addAttribute("itemBaseList", list);
		System.out.println(param);
		return "jsonView";
	}
	
	@GetMapping("/autoAdd.do")
	public String autoAdd(Model model) throws Exception {
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
		List<ExchangeVO> exchange = service.getExchange();
		
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
		model.addAttribute("exchangeList", exchange);
		
		return "metadata/add/autoAdd";
	}
	
	@PostMapping("/uploadMetaDataExcel.do")
	public String uploadMetaDataExcel(ModelMap model, @RequestParam("uploadExcel") MultipartFile file) throws Exception {
		System.out.println(file);
		
		InputStream fileInputStream = file.getInputStream();
		Workbook workbook = new HSSFWorkbook(file.getInputStream());

        Sheet sheet = workbook.getSheetAt(0);
        
//        Map<Integer, List<String>> data = new HashMap<>();
        
        int i = 0;
        int j = 0;
        
        String[] names = {
        		"possession_nm", 
        		"item_no", 
        		"item_detail_no", 
        		"qty", 
        		"qty_unit_nm", 
        		"item_nm", 
        		"item_se_nm", 
        		"country_nm", 
        		"era_nm", 
        		"material1_nm", 
        		"material2_nm", 
        		"feature", 
        		"obtainment_date", 
        		"obtainment_nm", 
        		"obtainment_price", 
        		"price_unit_nm", 
        		"obtainment_reg_date",
        		"not",
        		"obtainment_place",
        		"obtainment_addr",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"not",
        		"agreed_value", 
        		"insurance_price_unit_nm",
        		"start_date",
        		"end_date",
        		"rental_org",
        		"rental_remark",
        		"data_recorder",
        		"reg_user",
        		"remark",
        		"reference",
        		"item_eng_nm"
        };
        List<Map<String, Object>> data = new ArrayList<>();
        
        for (Row row : sheet) {
          Map<String, Object> map = new HashMap<>();
          j = 0;
          for (Cell cell : row) {
        	  if(i != 0 && i != 1) {
              switch (cell.getCellType()) {
	                case STRING: {
	                	map.put(names[j], cell.getRichStringCellValue().getString());
	                    break;
	                }
	                case NUMERIC: {
	                	System.out.println("format1:::"+cell.getNumericCellValue() + "");
	                	
//	                		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-mm-dd");
//	                		Date format1 = sdf1.parse(cell.getNumericCellValue() + "");
//	                		map.put(names[j], format1);
//	                	} else {
//	                		map.put(names[j], cell.getNumericCellValue() + "");
//	                	}
	                   /* if (DateUtil.isCellDateFormatted(cell)) {
	                    	map.put(names[j], cell.getDateCellValue() + "");
	                    } else {
	                    }*/
	                    break;
	                }
	                case BOOLEAN: {
	                	map.put(names[j], cell.getBooleanCellValue() + "");
	                    break;
	                }
	                case FORMULA: {
	                	map.put(names[j], cell.getCellFormula() + "");
	                    break;
	                }
	                default:
	                	map.put(names[j], " ");
	        		}
              j++;
          	}
      	}
          data.add(map);
          i++;
      	System.out.println(map);
      }
        
        for(int k=0; k<=1; k++) {
        	data.remove(0);
        }
        
//        for (Row row : sheet) {
//        	data.put(i, new ArrayList<String>());
//            for (Cell cell : row) {
//            	if(i != 0 && i != 1) {
//                switch (cell.getCellType()) {
//	                case STRING: {
//	                    data.get(i).add(cell.getRichStringCellValue().getString());
//	                    break;
//	                }
//	                case NUMERIC: {
//	                    if (DateUtil.isCellDateFormatted(cell)) {
//	                	    data.get(i).add(cell.getDateCellValue() + "");
//	                    } else {
//	                    	data.get(i).add(cell.getNumericCellValue() + "");
//	                    }
//	                    break;
//	                }
//	                case BOOLEAN: {
//	                    data.get(i).add(cell.getBooleanCellValue() + "");
//	                    break;
//	                }
//	                case FORMULA: {
//	                    data.get(i).add(cell.getCellFormula() + "");
//	                    break;
//	                }
//	                default:
//	                    data.get(i).add(" ");
//	        		}
//            	}
//        	}
//        	i++;
//        }
        
        
        model.addAttribute("excelList", data);
		
//		return "metadata/add/autoAddList";
		return "jsonView";
	}
}
