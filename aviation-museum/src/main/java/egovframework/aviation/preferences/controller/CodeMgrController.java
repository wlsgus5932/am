package egovframework.aviation.preferences.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.CodeMgrService;
import egovframework.aviation.preferences.vo.SpecialityVO;
import egovframework.aviation.preferences.vo.StorageCodeVO;
import egovframework.aviation.preferences.vo.StorageType1VO;
import egovframework.aviation.preferences.vo.StorageType2VO;
import egovframework.aviation.preferences.vo.TagVO;

@Controller
public class CodeMgrController {
	
	@Autowired
	private CodeMgrService codeMgrService;
	
	/** 코드 관리 메인 */
	@GetMapping("/codeMgr.do")
	public String CodeMgr(HttpServletRequest req) throws Exception {

		return "preferences/codeMgr/codeMgr_Main";
	}
	
	/** 기관/소장구분코드 조회 */
	@RequestMapping("/orgPossessionListAjax.do")
	public String OrgPossessionListAjax(@ModelAttribute("orgVO") OrgVO orgVO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, Model model, HttpServletRequest req) throws Exception {
		List<OrgVO> orgList = codeMgrService.getOrgList(orgVO);
		if(posSessionVO.getOrg_code_idx() != null) {
			posSessionVO.setPossession_code(null);
			List<PosSessionVO> possessionList = codeMgrService.getPossessionList(posSessionVO);
	    	model.addAttribute("possessionList", possessionList);
		}
    	model.addAttribute("orgList", orgList);
		
		return "preferences/codeMgr/codeMgr_OrgPossession";
	}
	
	/** 분류체계코드 조회 */
	@RequestMapping("/taxonomyListAjax.do")
	public String TaxonomyListAjax(@ModelAttribute("icaoVO") IcaoVO icaoVO, @ModelAttribute("class1VO") Class1VO class1VO, @ModelAttribute("class2VO") Class2VO class2VO, @ModelAttribute("class3VO") Class3VO class3VO, Model model, HttpServletRequest req) throws Exception {
		List<IcaoVO> icaoList = codeMgrService.getIcaoList(icaoVO);
		List<Class1VO> class1List = codeMgrService.getClass1List(class1VO);
		List<Class2VO> class2List = codeMgrService.getClass2List(class2VO);
		List<Class3VO> class3List = codeMgrService.getClass3List(class3VO);

    	model.addAttribute("icaoList", icaoList);
    	model.addAttribute("class1List", class1List);
    	model.addAttribute("class2List", class2List);
    	model.addAttribute("class3List", class3List);
    	
		return "preferences/codeMgr/codeMgr_Taxonomy";
	}
	
	/** 국적/시대코드 조회 */
	@RequestMapping("/countryEraListAjax.do")
	public String CountryEraListAjax(@ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("eraVO") EraVO eraVO, Model model, HttpServletRequest req) throws Exception {
		List<CountryVO> countryList =  codeMgrService.getCountryList(countryVO);	
		
		if(countryVO.getCountry_code_idx() != null) {
			List<EraVO> eraList =  codeMgrService.getEraList(countryVO);	
			model.addAttribute("eraList", eraList);
		}
		
		model.addAttribute("countryList", countryList);
		
		return "preferences/codeMgr/codeMgr_CountryEra";
	}
	
	/** 국적/시대코드 조회 */
	@RequestMapping("/materialListAjax.do")
	public String MaterialListAjax(@ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("material2VO") Material2VO material2VO, Model model, HttpServletRequest req) throws Exception {
		List<Material1VO> material1List =  codeMgrService.getMaterial1List(material1VO);	
		
		if(material1VO.getMaterial1_code_idx() != null) {
			List<Material2VO> material2List =  codeMgrService.getMaterial2List(material2VO);	
			model.addAttribute("material2List", material2List);
		}
		
		model.addAttribute("material1List", material1List);
		
		return "preferences/codeMgr/codeMgr_Material";
	}
	
	/** 기본정보코드 조회 */
	@RequestMapping("/basicInforListAjax.do")
	public String BasicInforListAjax(@ModelAttribute("qtyUnitVO") QtyUnitVO qtyUnitVO, @ModelAttribute("existenceVO") ExistenceVO existenceVO, @ModelAttribute("measurementUnitVO") MeasurementUnitVO measurementUnitVO, @ModelAttribute("measurementVO") MeasurementVO measurementVO, @ModelAttribute("conditionVO") ConditionVO conditionVO, @ModelAttribute("rankingVO") RankingVO rankingVO, @ModelAttribute("ggnuriVO") GgnuriVO ggnuriVO, @ModelAttribute("specialityVO") SpecialityVO specialityVO, Model model, HttpServletRequest req) throws Exception {
		List<QtyUnitVO> qtyUnitList =  codeMgrService.getQtyUnitList(qtyUnitVO);
		List<ExistenceVO> existenceList =  codeMgrService.getExistenceList(existenceVO);
		List<MeasurementVO> measurementList =  codeMgrService.getMeasurementList(measurementVO);
		List<MeasurementUnitVO> measurementUnitList =  codeMgrService.getMeasurementUnitList(measurementUnitVO);		
		List<ConditionVO> conditionList =  codeMgrService.getConditionList(conditionVO);
		List<RankingVO> rankingList =  codeMgrService.getRankingList(rankingVO);
		List<GgnuriVO> ggnuriList =  codeMgrService.getGgnuriList(ggnuriVO);
		List<SpecialityVO> specialityList =  codeMgrService.getSpecialityList(specialityVO);
		
		model.addAttribute("qtyUnitList", qtyUnitList);
    	model.addAttribute("existenceList", existenceList);
    	model.addAttribute("measurementList", measurementList);
    	model.addAttribute("measurementUnitList", measurementUnitList);
    	model.addAttribute("conditionList", conditionList);
    	model.addAttribute("rankingList", rankingList);
    	model.addAttribute("ggnuriList", ggnuriList);
    	model.addAttribute("specialityList", specialityList);
		return "preferences/codeMgr/codeMgr_BasicInfor";
	}
	
	/** 입수정보코드 조회 */
	@RequestMapping("/obtainmentListAjax.do")
	public String ObtainmentListAjax(@ModelAttribute("obtainmentVO") ObtainmentVO obtainmentVO, @ModelAttribute("priceUnitVO") PriceUnitVO priceUnitVO, @ModelAttribute("purchase1VO") Purchase1VO purchase1VO, @ModelAttribute("purchase2VO") Purchase2VO purchase2VO, Model model, HttpServletRequest req) throws Exception {
		List<ObtainmentVO> obtainmentList =  codeMgrService.getObtainmentList(obtainmentVO);
		List<PriceUnitVO> priceUnitList =  codeMgrService.getPriceUnitList(priceUnitVO);
		List<Purchase1VO> purchase1List =  codeMgrService.getPurchase1List(purchase1VO);
		List<Purchase2VO> purchase2List =  codeMgrService.getPurchase2List(purchase2VO);		

		
		model.addAttribute("obtainmentList", obtainmentList);
    	model.addAttribute("priceUnitList", priceUnitList);
    	model.addAttribute("purchase1List", purchase1List);
    	model.addAttribute("purchase2List", purchase2List);

		return "preferences/codeMgr/codeMgr_Obtainment";
	}
	
	/** 보관구분코드 조회 */
	@RequestMapping("/storageTypeListAjax.do")
	public String StorageTypeListAjax(@ModelAttribute("storageType1VO") StorageType1VO storageType1VO, @ModelAttribute("storageType2VO") StorageType2VO storageType2VO, Model model, HttpServletRequest req) throws Exception {
		List<StorageType1VO> storageType1List =  codeMgrService.getStorageType1List(storageType1VO);	
		
		if(storageType1VO.getStorage_type1_code_idx() != null) {
			List<StorageType2VO> storageType2List =  codeMgrService.getStorageType2List(storageType2VO);	
			model.addAttribute("storageType2List", storageType2List);
		}
		
		model.addAttribute("storageType1List", storageType1List);
		
		return "preferences/codeMgr/codeMgr_StorageType";
	}
	
	/** 보관처코드 조회 */
	@RequestMapping("/storageListAjax.do")
	public String StorageListAjax(@ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		return "preferences/codeMgr/codeMgr_Storage";
	}
	
	/** 보관처코드 보관처 구조 조회 */
	@RequestMapping("/treelist.do")
	public String Treelist(@ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		List<StorageCodeVO> storageCodeList =  codeMgrService.getStorageCodeList(storageCodeVO);	
		model.addAttribute(storageCodeList);
		return "jsonView";
	}
	
	/** 보관처코드 보관처 코드 조회 */
	@RequestMapping("/storageViewListAjax.do")
	public String StorageViewListAjax(@ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		List<StorageCodeVO> storageCodeViewList =  codeMgrService.getStorageCodeViewList(storageCodeVO);	
		storageCodeVO.setStorageCodeViewList(storageCodeViewList);
		return "preferences/codeMgr/codeMgr_StorageView"; 
	}
	
	/** 보관처코드 코드찾기 */
	@RequestMapping("/storageSearchListAjax.do")
	public String StorageSearchListAjax(@ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		List<StorageCodeVO> storageCodeList =  codeMgrService.getStorageCodeList(storageCodeVO);	
		storageCodeVO.setStorageCodeViewList(storageCodeList);
		return "preferences/codeMgr/codeMgr_StorageSearchList"; 
	}
	
	/** 코드 등록 */
	@RequestMapping("/codeInsertAjax.do/{insType}.do")
	public String CodeInsertAjax(@PathVariable("insType") String insType, @ModelAttribute("orgVO") OrgVO orgVO, @ModelAttribute("eraVO") EraVO eraVO, @ModelAttribute("material2VO") Material2VO material2VO, @ModelAttribute("storageType2VO") StorageType2VO storageType2VO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("storageType1VO") StorageType1VO storageType1VO, @ModelAttribute("qtyUnitVO") QtyUnitVO qtyUnitVO, @ModelAttribute("existenceVO") ExistenceVO existenceVO, @ModelAttribute("measurementUnitVO") MeasurementUnitVO measurementUnitVO, @ModelAttribute("measurementVO") MeasurementVO measurementVO, @ModelAttribute("conditionVO") ConditionVO conditionVO, @ModelAttribute("rankingVO") RankingVO rankingVO, @ModelAttribute("ggnuriVO") GgnuriVO ggnuriVO, @ModelAttribute("obtainmentVO") ObtainmentVO obtainmentVO, @ModelAttribute("priceUnitVO") PriceUnitVO priceUnitVO, @ModelAttribute("purchase1VO") Purchase1VO purchase1VO, @ModelAttribute("purchase2VO") Purchase2VO purchase2VO,  @ModelAttribute("specialityVO") SpecialityVO specialityVO, @ModelAttribute("icaoVO") IcaoVO icaoVO, @ModelAttribute("class1VO") Class1VO class1VO, @ModelAttribute("class2VO") Class2VO class2VO, @ModelAttribute("class3VO") Class3VO class3VO, @ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		
		String reg_user = (String) req.getSession().getAttribute("userSessionId");
		int result = 0;		
		
		if(insType.equals("org")) {
			orgVO.setReg_user(reg_user);
			result = codeMgrService.insertOrg(orgVO);
		}else if(insType.equals("country")) {
			countryVO.setReg_user(reg_user);
			result = codeMgrService.insertCountry(countryVO);
		}else if(insType.equals("material1")) {
			material1VO.setReg_user(reg_user);
			result = codeMgrService.insertMaterial(material1VO);
		}else if(insType.equals("storage-type1")) {
			storageType1VO.setReg_user(reg_user);
			result = codeMgrService.insertStorageType1(storageType1VO);
		}else if(insType.equals("icao")) {
			icaoVO.setReg_user(reg_user);
			result = codeMgrService.insertIcao(icaoVO);
		}else if(insType.equals("class1")) {
			class1VO.setReg_user(reg_user);
			result = codeMgrService.insertClass1(class1VO);
		}else if(insType.equals("class2")) {
			class2VO.setReg_user(reg_user);
			result = codeMgrService.insertClass2(class2VO);
		}else if(insType.equals("class3")) {
			class3VO.setReg_user(reg_user);
			result = codeMgrService.insertClass3(class3VO);
		}else if(insType.equals("qty-unit")) {
			qtyUnitVO.setReg_user(reg_user);
			result = codeMgrService.insertQtyUnit(qtyUnitVO);
		}else if(insType.equals("existence")){
			existenceVO.setReg_user(reg_user);
			result = codeMgrService.insertExistence(existenceVO);
		}else if(insType.equals("measurement")){
			measurementVO.setReg_user(reg_user);
			result = codeMgrService.insertMeasurement(measurementVO);
		}else if(insType.equals("measurement-unit")){
			measurementUnitVO.setReg_user(reg_user);
			result = codeMgrService.insertMeasurementUnit(measurementUnitVO);
		}else if(insType.equals("condition")){
			conditionVO.setReg_user(reg_user);
			result = codeMgrService.insertCondition(conditionVO);
		}else if(insType.equals("ranking")){
			rankingVO.setReg_user(reg_user);
			result = codeMgrService.insertRanking(rankingVO);
		}else if(insType.equals("ggnuri")){
			ggnuriVO.setReg_user(reg_user);
			result = codeMgrService.insertGgnuri(ggnuriVO);
		}else if(insType.equals("speciality")){
			specialityVO.setReg_user(reg_user);
			result = codeMgrService.insertSpeciality(specialityVO);
		}else if(insType.equals("obtainment")){
			obtainmentVO.setReg_user(reg_user);
			result = codeMgrService.insertObtainment(obtainmentVO);
		}else if(insType.equals("price-unit")){
			priceUnitVO.setReg_user(reg_user);
			result = codeMgrService.insertPriceUnit(priceUnitVO);
		}else if(insType.equals("purchase1")){
			purchase1VO.setReg_user(reg_user);
			result = codeMgrService.insertPurchase1(purchase1VO);
		}else if(insType.equals("purchase2")){
			purchase2VO.setReg_user(reg_user);
			result = codeMgrService.insertPurchase2(purchase2VO);
		}else if(insType.equals("possession")) {
			posSessionVO.setReg_user(reg_user);
			result = codeMgrService.insertPossession(posSessionVO);
		}else if(insType.equals("era")) {
			eraVO.setReg_user(reg_user);
			result = codeMgrService.insertEra(eraVO);
		}else if(insType.equals("material2")) {
			material2VO.setReg_user(reg_user);
			result = codeMgrService.insertMaterial2(material2VO);
		}else if(insType.equals("storage-type2")) {
			storageType2VO.setReg_user(reg_user);
			result = codeMgrService.insertStorageType2(storageType2VO);
		}else if(insType.equals("storage")) {
			storageCodeVO.setReg_user(reg_user);
			result = codeMgrService.insertStorageCode(storageCodeVO);
		}
		
		
		model.addAttribute("insType", insType);
		model.addAttribute("result", result);
		return "jsonView";
	}
	
	/** 등록 중복체크 */
	@RequestMapping(value = "/codeDuplicateCheck.do/{insType}.do")
    public String TagDuplicateCheck(@PathVariable("insType") String insType,@ModelAttribute("orgVO") OrgVO orgVO, @ModelAttribute("eraVO") EraVO eraVO, @ModelAttribute("material2VO") Material2VO material2VO, @ModelAttribute("storageType2VO") StorageType2VO storageType2VO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("storageType1VO") StorageType1VO storageType1VO, @ModelAttribute("qtyUnitVO") QtyUnitVO qtyUnitVO, @ModelAttribute("existenceVO") ExistenceVO existenceVO, @ModelAttribute("measurementUnitVO") MeasurementUnitVO measurementUnitVO, @ModelAttribute("measurementVO") MeasurementVO measurementVO, @ModelAttribute("conditionVO") ConditionVO conditionVO, @ModelAttribute("rankingVO") RankingVO rankingVO, @ModelAttribute("ggnuriVO") GgnuriVO ggnuriVO, @ModelAttribute("obtainmentVO") ObtainmentVO obtainmentVO, @ModelAttribute("priceUnitVO") PriceUnitVO priceUnitVO, @ModelAttribute("purchase1VO") Purchase1VO purchase1VO, @ModelAttribute("purchase2VO") Purchase2VO purchase2VO,  @ModelAttribute("specialityVO") SpecialityVO specialityVO, @ModelAttribute("icaoVO") IcaoVO icaoVO, @ModelAttribute("class1VO") Class1VO class1VO, @ModelAttribute("class2VO") Class2VO class2VO, @ModelAttribute("class3VO") Class3VO class3VO, HttpServletRequest req, Model model) throws Exception {

		String result = "";
		
		if(insType.equals("org")) {
			List<OrgVO> orgList = codeMgrService.getOrgList(orgVO);
			if(orgList.size()>0) {
				result = "success";
			}
		}else if(insType.equals("possession")) {
			List<PosSessionVO> posSessionList = codeMgrService.getPossessionList(posSessionVO);
			if(posSessionList.size()>0) {
				result = "success";
			}
		}else if(insType.equals("icao")) {
			List<IcaoVO> icaoList = codeMgrService.getIcaoList(icaoVO);
			if(icaoList.size()>0) {
				result = "success";
			}
		}else if(insType.equals("class1")) {
			List<Class1VO> class1List = codeMgrService.getClass1List(class1VO);
			if(class1List.size()>0) {
				result = "success";
			}
		}else if(insType.equals("class2")) {
			List<Class2VO> class2List = codeMgrService.getClass2List(class2VO);
			if(class2List.size()>0) {
				result = "success";
			}
		}else if(insType.equals("class3")) {
			List<Class3VO> class3List = codeMgrService.getClass3List(class3VO);
			if(class3List.size()>0) {
				result = "success";
			}
		}
		
		model.addAttribute("result", result);
        return "jsonView";
    } 
	
	/** 코드 수정 */
	@RequestMapping(value = "/codeModAjax.do/{modType}.do")
	public String CodeModAjax(@PathVariable("modType") String modType, @ModelAttribute("orgVO") OrgVO orgVO, @ModelAttribute("eraVO") EraVO eraVO, @ModelAttribute("material2VO") Material2VO material2VO, @ModelAttribute("storageType2VO") StorageType2VO storageType2VO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("storageType1VO") StorageType1VO storageType1VO, @ModelAttribute("qtyUnitVO") QtyUnitVO qtyUnitVO, @ModelAttribute("existenceVO") ExistenceVO existenceVO, @ModelAttribute("measurementUnitVO") MeasurementUnitVO measurementUnitVO, @ModelAttribute("measurementVO") MeasurementVO measurementVO, @ModelAttribute("conditionVO") ConditionVO conditionVO, @ModelAttribute("rankingVO") RankingVO rankingVO, @ModelAttribute("ggnuriVO") GgnuriVO ggnuriVO, @ModelAttribute("obtainmentVO") ObtainmentVO obtainmentVO, @ModelAttribute("priceUnitVO") PriceUnitVO priceUnitVO, @ModelAttribute("purchase1VO") Purchase1VO purchase1VO, @ModelAttribute("purchase2VO") Purchase2VO purchase2VO,  @ModelAttribute("specialityVO") SpecialityVO specialityVO, @ModelAttribute("icaoVO") IcaoVO icaoVO, @ModelAttribute("class1VO") Class1VO class1VO, @ModelAttribute("class2VO") Class2VO class2VO, @ModelAttribute("class3VO") Class3VO class3VO, @ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {

		String mod_user = (String) req.getSession().getAttribute("userSessionId");
		int result = 0;		
		
		if(modType.equals("org")) {
			orgVO.setMod_user(mod_user);
			result = codeMgrService.updateOrg(orgVO);
		}else if(modType.equals("possession")) {
			posSessionVO.setMod_user(mod_user);
			result = codeMgrService.updatePossession(posSessionVO);
		}else if(modType.equals("icao")) {
			icaoVO.setMod_user(mod_user);
			result = codeMgrService.updateIcao(icaoVO);
		}else if(modType.equals("class1")) {
			class1VO.setMod_user(mod_user);
			result = codeMgrService.updateClass1(class1VO);
		}else if(modType.equals("class2")) {
			class2VO.setMod_user(mod_user);
			result = codeMgrService.updateClass2(class2VO);
		}else if(modType.equals("class3")) {
			class3VO.setMod_user(mod_user);
			result = codeMgrService.updateClass3(class3VO);
		}else if(modType.equals("country")) {
			countryVO.setMod_user(mod_user);
			result = codeMgrService.updateCountry(countryVO);
		}else if(modType.equals("era")) {
			eraVO.setMod_user(mod_user);
			result = codeMgrService.updateEra(eraVO);
		}else if(modType.equals("material1")) {
			material1VO.setMod_user(mod_user);
			result = codeMgrService.updateMaterial(material1VO);
		}else if(modType.equals("material2")) {
			material2VO.setMod_user(mod_user);
			result = codeMgrService.updateMaterial2(material2VO);
		}else if(modType.equals("qty-unit")) {
			qtyUnitVO.setMod_user(mod_user);
			result = codeMgrService.updateQtyUnit(qtyUnitVO);
		}else if(modType.equals("existence")){
			existenceVO.setMod_user(mod_user);
			result = codeMgrService.updateExistence(existenceVO);
		}else if(modType.equals("measurement")){
			measurementVO.setMod_user(mod_user);
			result = codeMgrService.updateMeasurement(measurementVO);
		}else if(modType.equals("measurement-unit")){
			measurementUnitVO.setMod_user(mod_user);
			result = codeMgrService.updateMeasurementUnit(measurementUnitVO);							
		}else if(modType.equals("condition")){
			conditionVO.setMod_user(mod_user);
			result = codeMgrService.updateCondition(conditionVO);
		}else if(modType.equals("ranking")){
			rankingVO.setMod_user(mod_user);
			result = codeMgrService.updateRanking(rankingVO);
		}else if(modType.equals("ggnuri")){
			ggnuriVO.setMod_user(mod_user);
			result = codeMgrService.updateGgnuri(ggnuriVO);
		}else if(modType.equals("speciality")){
			specialityVO.setMod_user(mod_user);
			result = codeMgrService.updateSpeciality(specialityVO);									
		}else if(modType.equals("obtainment")){
			obtainmentVO.setMod_user(mod_user);
			result = codeMgrService.updateObtainment(obtainmentVO);
		}else if(modType.equals("price-unit")){
			priceUnitVO.setMod_user(mod_user);
			result = codeMgrService.updatePriceUnit(priceUnitVO);
		}else if(modType.equals("purchase1")){
			purchase1VO.setMod_user(mod_user);
			result = codeMgrService.updatePurchase1(purchase1VO);
		}else if(modType.equals("purchase2")){
			purchase2VO.setMod_user(mod_user);
			result = codeMgrService.updatePurchase2(purchase2VO);		
		}else if(modType.equals("storage-type1")) {
			storageType1VO.setMod_user(mod_user);
			result = codeMgrService.updateStorageType1(storageType1VO);
		}else if(modType.equals("storage-type2")) {
			storageType2VO.setMod_user(mod_user);
			result = codeMgrService.updateStorageType2(storageType2VO);
		}else if(modType.equals("storage")) {
			storageCodeVO.setMod_user(mod_user);
			result = codeMgrService.updateStorageCode(storageCodeVO);
		}
				
		model.addAttribute("modType", modType);
		model.addAttribute("result", result);
        return "jsonView";
    } 
	

	/** 코드 수정 */
	@RequestMapping(value = "/updateSeqAjax/{modType}.do")
	public String UpdateSeqAjax(@PathVariable("modType") String modType, @ModelAttribute("orgVO") OrgVO orgVO, @ModelAttribute("eraVO") EraVO eraVO, @ModelAttribute("material2VO") Material2VO material2VO, @ModelAttribute("storageType2VO") StorageType2VO storageType2VO, @ModelAttribute("posSessionVO") PosSessionVO posSessionVO, @ModelAttribute("countryVO") CountryVO countryVO, @ModelAttribute("material1VO") Material1VO material1VO, @ModelAttribute("storageType1VO") StorageType1VO storageType1VO, @ModelAttribute("qtyUnitVO") QtyUnitVO qtyUnitVO, @ModelAttribute("existenceVO") ExistenceVO existenceVO, @ModelAttribute("measurementUnitVO") MeasurementUnitVO measurementUnitVO, @ModelAttribute("measurementVO") MeasurementVO measurementVO, @ModelAttribute("conditionVO") ConditionVO conditionVO, @ModelAttribute("rankingVO") RankingVO rankingVO, @ModelAttribute("ggnuriVO") GgnuriVO ggnuriVO, @ModelAttribute("obtainmentVO") ObtainmentVO obtainmentVO, @ModelAttribute("priceUnitVO") PriceUnitVO priceUnitVO, @ModelAttribute("purchase1VO") Purchase1VO purchase1VO, @ModelAttribute("purchase2VO") Purchase2VO purchase2VO,  @ModelAttribute("specialityVO") SpecialityVO specialityVO, @ModelAttribute("icaoVO") IcaoVO icaoVO, @ModelAttribute("class1VO") Class1VO class1VO, @ModelAttribute("class2VO") Class2VO class2VO, @ModelAttribute("class3VO") Class3VO class3VO, @ModelAttribute("storageCodeVO") StorageCodeVO storageCodeVO, Model model, HttpServletRequest req) throws Exception {
		
		String mod_user = (String) req.getSession().getAttribute("userSessionId");
		int result = 0;		
		
		if(modType.equals("org")) {
			orgVO.setMod_user(mod_user);
			result = codeMgrService.updateOrgSeq(orgVO);
		}else if(modType.equals("possession")) {
			posSessionVO.setMod_user(mod_user);
			result = codeMgrService.updatePossessionSeq(posSessionVO);
		}else if(modType.equals("icao")) {
			icaoVO.setMod_user(mod_user);
			result = codeMgrService.updateIcaoSeq(icaoVO);
		}else if(modType.equals("class1")) {
			class1VO.setMod_user(mod_user);
			result = codeMgrService.updateClass1Seq(class1VO);
		}else if(modType.equals("class2")) {
			class2VO.setMod_user(mod_user);
			result = codeMgrService.updateClass2Seq(class2VO);
		}else if(modType.equals("class3")) {
			class3VO.setMod_user(mod_user);
			result = codeMgrService.updateClass3Seq(class3VO);
		}else if(modType.equals("country")) {
			countryVO.setMod_user(mod_user);
			result = codeMgrService.updateCountrySeq(countryVO);
		}else if(modType.equals("era")) {
			eraVO.setMod_user(mod_user);
			result = codeMgrService.updateEraSeq(eraVO);
		}else if(modType.equals("material1")) {
			material1VO.setMod_user(mod_user);
			result = codeMgrService.updateMaterialSeq(material1VO);
		}else if(modType.equals("material2")) {
			material2VO.setMod_user(mod_user);
			result = codeMgrService.updateMaterial2Seq(material2VO);
		}else if(modType.equals("qty-unit")) {
			qtyUnitVO.setMod_user(mod_user);
			result = codeMgrService.updateQtyUnitSeq(qtyUnitVO);
		}else if(modType.equals("existence")){
			existenceVO.setMod_user(mod_user);
			result = codeMgrService.updateExistenceSeq(existenceVO);
		}else if(modType.equals("measurement")){
			measurementVO.setMod_user(mod_user);
			result = codeMgrService.updateMeasurementSeq(measurementVO);
		}else if(modType.equals("measurement-unit")){
			measurementUnitVO.setMod_user(mod_user);
			result = codeMgrService.updateMeasurementUnitSeq(measurementUnitVO);							
		}else if(modType.equals("condition")){
			conditionVO.setMod_user(mod_user);
			result = codeMgrService.updateConditionSeq(conditionVO);
		}else if(modType.equals("ranking")){
			rankingVO.setMod_user(mod_user);
			result = codeMgrService.updateRankingSeq(rankingVO);
		}else if(modType.equals("ggnuri")){
			ggnuriVO.setMod_user(mod_user);
			result = codeMgrService.updateGgnuriSeq(ggnuriVO);
		}else if(modType.equals("speciality")){
			specialityVO.setMod_user(mod_user);
			result = codeMgrService.updateSpecialitySeq(specialityVO);		
		}else if(modType.equals("obtainment")){
			obtainmentVO.setMod_user(mod_user);
			result = codeMgrService.updateObtainmentSeq(obtainmentVO);
		}else if(modType.equals("price-unit")){
			priceUnitVO.setMod_user(mod_user);
			result = codeMgrService.updatePriceUnitSeq(priceUnitVO);
		}else if(modType.equals("purchase1")){
			purchase1VO.setMod_user(mod_user);
			result = codeMgrService.updatePurchase1Seq(purchase1VO);
		}else if(modType.equals("purchase2")){
			purchase2VO.setMod_user(mod_user);
			result = codeMgrService.updatePurchase2Seq(purchase2VO);			
		}else if(modType.equals("storage-type1")) {
			storageType1VO.setMod_user(mod_user);
			result = codeMgrService.updateStorageType1Seq(storageType1VO);
		}else if(modType.equals("storage-type2")) {
			storageType2VO.setMod_user(mod_user);
			result = codeMgrService.updateStorageType2Seq(storageType2VO);
		}else if(modType.equals("storage")) {
			storageCodeVO.setMod_user(mod_user);
			result = codeMgrService.updateStorageCodeSeq(storageCodeVO);
		}
				
		model.addAttribute("modType", modType);
		model.addAttribute("result", result);
        return "jsonView";
    } 
}
