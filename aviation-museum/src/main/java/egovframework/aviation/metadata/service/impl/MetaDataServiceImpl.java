package egovframework.aviation.metadata.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.MetaDataService;
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
import egovframework.aviation.metadata.vo.MovementInVO;
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
import egovframework.aviation.metadata.vo.metadata.DeletionVO;
import egovframework.aviation.metadata.vo.metadata.InsuranceVO;
import egovframework.aviation.metadata.vo.metadata.InvolvementVO;
import egovframework.aviation.metadata.vo.metadata.KeywordVO;
import egovframework.aviation.metadata.vo.metadata.MaterialVO;
import egovframework.aviation.metadata.vo.metadata.PublicServiceVO;
import egovframework.aviation.metadata.vo.metadata.TaxonomyVO;
import egovframework.aviation.metadata.vo.param.DeletionParamVO;
import egovframework.aviation.metadata.vo.param.KeywordParamVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.param.MovementParamVO;

@Service
public class MetaDataServiceImpl implements MetaDataService {

	@Autowired
	private MetaDataMapper dao;

	//add.do 첫 로딩시
	@Override
	public List<CountryVO> getCountry() {
		return dao.getCountry();
	}

	@Override
	public List<EraVO> getEra(int country) {
		return dao.getEra(country);
	}

	@Override
	public List<Material1VO> getMaterial1() {
		return dao.getMaterial1();
	}

	@Override
	public List<Material2VO> getMaterial2(int material) {
		return dao.getMaterial2(material);
	}

	@Override
	public List<IcaoVO> getIcao() {
		return dao.getIcao();
	}

	@Override
	public List<ExistenceVO> getExistence() {
		return dao.getExistence();
	}

	@Override
	public List<MeasurementVO> getMeasurement() {
		return dao.getMeasurement();
	}

	@Override
	public List<MeasurementUnitVO> getMeasurementUnit() {
		return dao.getMeasurementUnit();
	}

	@Override
	public List<Class1VO> getClass1() {
		return dao.getClass1();
	}

	@Override
	public List<Class2VO> getClass2() {
		return dao.getClass2();
	}

	@Override
	public List<Class3VO> getClass3() {
		return dao.getClass3();
	}

	@Override
	public List<ObtainmentVO> getObtainment() {
		return dao.getObtainment();
	}

	@Override
	public List<Purchase1VO> getPurchase1() {
		return dao.getPurchase1();
	}

	@Override
	public List<Purchase2VO> getPurchase2() {
		return dao.getPurchase2();
	}

	@Override
	public List<PriceUnitVO> getPriceUnit() {
		return dao.getPriceUnit();
	}

	@Override
	public List<QtyUnitVO> getQtyUnit() {
		return dao.getQtyUnit();
	}

	@Override
	public List<ConditionVO> getCondition() {
		return dao.getCondition();
	}

	@Override
	public List<RankingVO> getRanking() {
		return dao.getRanking();
	}

	@Override
	public List<PosSessionVO> getPosSession() {
		return dao.getPosSession();
	}

	@Override
	public List<GgnuriVO> getGgnuri() {
		return dao.getGgnuri();
	}

	@Override
	public List<OrgVO> getOrg() {
		return dao.getOrg();
	}

	//자료등록
	@Override
	public int setItemBase(MetaDataParamVO param) {
		int x = dao.setItemBase(param);
		return x;
	}

	@Override
	public void setGgnuri(MetaDataParamVO param) {
		dao.setGgnuri(param);
	}

	@Override
	public void setKeyword(MetaDataParamVO param) {
		dao.setKeyword(param);
	}

	@Override
	public void setMeasurement(HashMap<Integer, Object> measureMap) {
		dao.setMeasurement(measureMap);
	}

	@Override
	public void setTaxonomy(HashMap<Integer, Object> classMap) {
		dao.setTaxonomy(classMap);
	}

	@Override
	public void setCountry(HashMap<Integer, Object> countryMap) {
		dao.setCountry(countryMap);
	}

	@Override
	public void setMaterial(HashMap<Integer, Object> materialMap) {
		dao.setMaterial(materialMap);
	}

	@Override
	public void setObtainment(MetaDataParamVO param) {
		dao.setObtainment(param);
	}

	@Override
	public void setInvolvement(HashMap<Integer, Object> possessionMap) {
		dao.setInvolvement(possessionMap);
	}

	@Override
	public void setInsurance(HashMap<Integer, Object> insuranceMap) {
		dao.setInsurance(insuranceMap);
	}

	@Override
	public void setCopyright(HashMap<Integer, Object> copyrightMap) {
		dao.setCopyright(copyrightMap);
	}

	@Override
	public List<StorageType1VO> getStorageType1() {
		return dao.getStorageType1();
	}

	@Override
	public List<StorageType2VO> getStorageType2(int type2) {
		return dao.getStorageType2(type2);
	}

	@Override
	public int setMovement(MovementParamVO param) {
		int x = dao.setMovement(param);
		return x;
	}

	@Override
	public List<StorageVO> getStorage(int i) {
		return dao.getStorage(i);
	}

	@Override
	public void setStorage(MovementParamVO param) {
		dao.setStorage(param);
	}

	@Override
	public void setStorage2(MovementParamVO param) {
		dao.setStorage2(param);
	}

	@Override
	public int updateMovement(MovementParamVO param) {
		return dao.updateMovement(param);
	}

	@Override
	public void updateSotrageIn(List<Map<String, Object>> list) {
		dao.updateStorageIn(list);
	}

	@Override
	public int deleteStorage(int movement_idx) {
		return dao.deleteStorage(movement_idx);
	}

	@Override
	public int deleteMovement(int movement_idx) {
		return dao.deleteMovement(movement_idx);
	}

	@Override
	public List<MovementInVO> getMovementOut(int movement_id) {
		return dao.getMovementOut(movement_id);
	}

	@Override
	public List<ItemBaseVO> getItemBase(MetaDataParamVO param) {
		return dao.getItemBase(param);
	}

	@Override
	public List<TaxonomyVO> getTaxonomy(int item_idx) {
		return dao.getTaxonomy(item_idx);
	}

	@Override
	public List<CountryEraVO> getCountryEra(int item_idx) {
		return dao.getCountryEra(item_idx);
	}

	@Override
	public List<MaterialVO> getMaterial(int item_idx) {
		return dao.getMaterial(item_idx);
	}

	@Override
	public List<MeasurementVO> getMeasure(int item_idx) {
		return dao.getMeasure(item_idx);
	}

	@Override
	public List<ObtainmentVO> getObtainmentList(int item_idx) {
		return dao.getObtainmentList(item_idx);
	}

	@Override
	public List<InvolvementVO> getInvolvementList(int item_idx) {
		return dao.getInvolvementList(item_idx);
	}

	@Override
	public List<InsuranceVO> getInsuranceList(int item_idx) {
		return dao.getInsuranceList(item_idx);
	}

	@Override
	public List<CopyrightVO> getCopyrightList(int item_idx) {
		return dao.getCopyrightList(item_idx);
	}

	@Override
	public List<PublicServiceVO> getPublicService(int item_idx) {
		return dao.getPublicService(item_idx);
	}

	@Override
	public List<KeywordVO> getKewordList(int item_idx) {
		return dao.getKewordList(item_idx);
	}

	@Override
	public int updateItemBase(MetaDataParamVO param) {
		return dao.updateItemBase(param);
	}

	@Override
	public void updateObtainment(MetaDataParamVO param) {
		dao.updateObtainment(param);
	}

	@Override
	public void updateGgnuri(MetaDataParamVO param) {
		dao.updateGgnuri(param);
	}

	@Override
	public void updateKeyword(MetaDataParamVO param) {
		dao.updateKeyword(param);
	}

	@Override
	public int deleteTaxonomy(String[] arr) {
		return dao.deleteTaxonomy(arr);
	}

	@Override
	public int deleteCountry(String[] arr) {
		return dao.deleteCountry(arr);
	}

	@Override
	public int deleteMaterial(String[] arr) {
		return dao.deleteMaterial(arr);
	}

	@Override
	public int deleteMeasurement(String[] arr) {
		return dao.deleteMeasurement(arr);
	}

	@Override
	public int deleteInvolvement(String[] arr) {
		return dao.deleteInvolvement(arr);
	}

	@Override
	public int deleteInsurance(String[] arr) {
		return dao.deleteInsurance(arr);
	}

	@Override
	public int deleteCopyright(String[] arr) {
		return dao.deleteCopyright(arr);
	}

	@Override
	public List<DeletionVO> getDeletionList(DeletionParamVO param) {
		return dao.getDeletionList(param);
	}

	@Override
	public int getDeletionCnt(DeletionParamVO param) {
		// TODO Auto-generated method stub
		return dao.getDeletionCnt(param);
	}

	@Override
	public int deleteDeletion(Map<Integer, Object> map) {
		return dao.deleteDeletion(map);
	}

	@Override
	public List<KeywordVO> getKeywordList(KeywordParamVO param) {
		return dao.getKeywordList(param);
	}

	@Override
	public List<MovementVO> getMovementData(int movement_idx) {
		return dao.getMovementData(movement_idx);
	}

	@Override
	public List<MovementVO> getMovementExcel(MovementParamVO param) {
		return dao.getMovementExcel(param);
	}

	@Override
	public List<MovementVO> getMovement(MovementParamVO param) {
		return dao.getMovement(param);
	}

	@Override
	public int getMovementListCnt(MovementParamVO param) {
		return dao.getMovementListCnt(param);
	}

	@Override
	public Integer getMetaDataInfo(MetaDataParamVO param) {
		return dao.getMetaDataInfo(param);
	}

	@Override
	public String searchItemNo(MetaDataParamVO param) {
		return dao.searchItemNo(param);
	}

	@Override
	public int setItemNo(MetaDataParamVO param) {
		return dao.setItemNo(param);
	}

	@Override
	public List<ExchangeVO> getExchange() {
		return dao.getExchange();
	}

	@Override
	public List<ItemBaseVO> getSearchItemNext(MetaDataParamVO param) {
		return dao.getSearchItemNext(param);
	}




}
