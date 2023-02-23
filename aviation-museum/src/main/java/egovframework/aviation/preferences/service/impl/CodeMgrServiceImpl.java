package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import egovframework.aviation.preferences.service.CodeMgrService;
import egovframework.aviation.preferences.vo.SpecialityVO;
import egovframework.aviation.preferences.vo.StorageCodeVO;
import egovframework.aviation.preferences.vo.StorageType1VO;
import egovframework.aviation.preferences.vo.StorageType2VO;

@Service
public class CodeMgrServiceImpl implements CodeMgrService {
	
	@Autowired
	private CodeMgrMapper codeMgrMapper;

	@Override
	public List<OrgVO> getOrgList(OrgVO orgVO) {
		return codeMgrMapper.getOrgList(orgVO);
	}

	@Override
	public List<PosSessionVO> getPossessionList(PosSessionVO posSessionVO) {
		return codeMgrMapper.getPossessionList(posSessionVO);
	}

	@Override
	public List<IcaoVO> getIcaoList(IcaoVO icaoVO) {
		return codeMgrMapper.getIcaoList(icaoVO);
	}

	@Override
	public List<Class1VO> getClass1List(Class1VO class1VO) {
		return codeMgrMapper.getClass1List(class1VO);
	}

	@Override
	public List<Class2VO> getClass2List(Class2VO class2VO) {
		return codeMgrMapper.getClass2List(class2VO);
	}

	@Override
	public List<Class3VO> getClass3List(Class3VO class3VO) {
		return codeMgrMapper.getClass3List(class3VO);
	}

	@Override
	public List<CountryVO> getCountryList(CountryVO countryVO) {
		return codeMgrMapper.getCountryList(countryVO);
	}

	@Override
	public List<EraVO> getEraList(CountryVO countryVO) {
		return codeMgrMapper.getEraList(countryVO);
	}

	@Override
	public List<Material1VO> getMaterial1List(Material1VO material1VO) {
		return codeMgrMapper.getMaterial1List(material1VO);
	}

	@Override
	public List<Material2VO> getMaterial2List(Material2VO material2VO) {
		return codeMgrMapper.getMaterial2List(material2VO);
	}

	@Override
	public List<QtyUnitVO> getQtyUnitList(QtyUnitVO qtyUnitVO) {
		return codeMgrMapper.getQtyUnitList(qtyUnitVO);
	}

	@Override
	public List<ExistenceVO> getExistenceList(ExistenceVO existenceVO) {
		return codeMgrMapper.getExistenceList(existenceVO);
	}

	@Override
	public List<MeasurementUnitVO> getMeasurementUnitList(MeasurementUnitVO measurementUnitVO) {
		return codeMgrMapper.getMeasurementUnitList(measurementUnitVO);
	}

	@Override
	public List<MeasurementVO> getMeasurementList(MeasurementVO measurementVO) {
		return codeMgrMapper.getMeasurementList(measurementVO);
	}

	@Override
	public List<ConditionVO> getConditionList(ConditionVO conditionVO) {
		return codeMgrMapper.getConditionList(conditionVO);
	}

	@Override
	public List<RankingVO> getRankingList(RankingVO rankingVO) {
		return codeMgrMapper.getRankingList(rankingVO);
	}

	@Override
	public List<GgnuriVO> getGgnuriList(GgnuriVO ggnuriVO) {
		return codeMgrMapper.getGgnuriList(ggnuriVO);
	}

	@Override
	public List<SpecialityVO> getSpecialityList(SpecialityVO specialityVO) {
		return codeMgrMapper.getSpecialityList(specialityVO);
	}

	@Override
	public List<ObtainmentVO> getObtainmentList(ObtainmentVO obtainmentVO) {
		return codeMgrMapper.getObtainmentList(obtainmentVO);
	}

	@Override
	public List<PriceUnitVO> getPriceUnitList(PriceUnitVO priceUnitVO) {
		return codeMgrMapper.getPriceUnitList(priceUnitVO);
	}

	@Override
	public List<Purchase1VO> getPurchase1List(Purchase1VO purchase1VO) {
		return codeMgrMapper.getPurchase1List(purchase1VO);
	}

	@Override
	public List<Purchase2VO> getPurchase2List(Purchase2VO purchase2VO) {
		return codeMgrMapper.getPurchase2List(purchase2VO);
	}

	@Override
	public List<StorageType1VO> getStorageType1List(StorageType1VO storageType1VO) {
		return codeMgrMapper.getStorageType1List(storageType1VO);
	}

	@Override
	public List<StorageType2VO> getStorageType2List(StorageType2VO storageType2VO) {
		return codeMgrMapper.getStorageType2List(storageType2VO);
	}

	@Override
	public List<StorageCodeVO> getStorageCodeList(StorageCodeVO storageCodeVO) {
		return codeMgrMapper.getStorageCodeList(storageCodeVO);
	}
	
	@Override
	public List<StorageCodeVO> getStorageCodeViewList(StorageCodeVO storageCodeVO) {
		return codeMgrMapper.getStorageCodeViewList(storageCodeVO);
	}
	
	@Override
	public int insertQtyUnit(QtyUnitVO qtyUnitVO) {
		return codeMgrMapper.insertQtyUnit(qtyUnitVO);
	}

	@Override
	public int insertExistence(ExistenceVO existenceVO) {
		return codeMgrMapper.insertExistence(existenceVO);
	}

	@Override
	public int insertMeasurement(MeasurementVO measurementVO) {
		return codeMgrMapper.insertMeasurement(measurementVO);
	}

	@Override
	public int insertMeasurementUnit(MeasurementUnitVO measurementUnitVO) {
		return codeMgrMapper.insertMeasurementUnit(measurementUnitVO);
	}

	@Override
	public int insertCondition(ConditionVO conditionVO) {
		return codeMgrMapper.insertCondition(conditionVO);
	}

	@Override
	public int insertRanking(RankingVO rankingVO) {
		return codeMgrMapper.insertRanking(rankingVO);
	}

	@Override
	public int insertGgnuri(GgnuriVO ggnuriVO) {
		return codeMgrMapper.insertGgnuri(ggnuriVO);
	}

	@Override
	public int insertSpeciality(SpecialityVO specialityVO) {
		return codeMgrMapper.insertSpeciality(specialityVO);
	}

	@Override
	public int insertObtainment(ObtainmentVO obtainmentVO) {
		return codeMgrMapper.insertObtainment(obtainmentVO);
	}

	@Override
	public int insertPriceUnit(PriceUnitVO priceUnitVO) {
		return codeMgrMapper.insertPriceUnit(priceUnitVO);
	}

	@Override
	public int insertPurchase1(Purchase1VO purchase1VO) {
		return codeMgrMapper.insertPurchase1(purchase1VO);
	}

	@Override
	public int insertPurchase2(Purchase2VO purchase2VO) {
		return codeMgrMapper.insertPurchase2(purchase2VO);
	}

	@Override
	public int insertIcao(IcaoVO icaoVO) {
		return codeMgrMapper.insertIcao(icaoVO);
	}

	@Override
	public int insertClass1(Class1VO class1VO) {
		return codeMgrMapper.insertClass1(class1VO);
	}

	@Override
	public int insertClass2(Class2VO class2VO) {
		return codeMgrMapper.insertClass2(class2VO);
	}

	@Override
	public int insertClass3(Class3VO class3VO) {
		return codeMgrMapper.insertClass3(class3VO);
	}

	@Override
	public int insertOrg(OrgVO orgVO) {
		return codeMgrMapper.insertOrg(orgVO);
	}

	@Override
	public int insertCountry(CountryVO countryVO) {
		return codeMgrMapper.insertCountry(countryVO);
	}

	@Override
	public int insertMaterial(Material1VO material1VO) {
		return codeMgrMapper.insertMaterial(material1VO);
	}

	@Override
	public int insertStorageType1(StorageType1VO storageType1VO) {
		return codeMgrMapper.insertStorageType1(storageType1VO);
	}

	@Override
	public int insertPossession(PosSessionVO posSessionVO) {
		return codeMgrMapper.insertPossession(posSessionVO);
	}

	@Override
	public int insertEra(EraVO eraVO) {
		return codeMgrMapper.insertEra(eraVO);
	}

	@Override
	public int insertMaterial2(Material2VO material2VO) {
		return codeMgrMapper.insertMaterial2(material2VO);
	}

	@Override
	public int insertStorageType2(StorageType2VO storageType2VO) {
		return codeMgrMapper.insertStorageType2(storageType2VO);
	}

	@Override
	public int insertStorageCode(StorageCodeVO storageCodeVO) {
		return codeMgrMapper.insertStorageCode(storageCodeVO);
	}

	@Override
	public int updateOrg(OrgVO orgVO) {
		return codeMgrMapper.updateOrg(orgVO);
	}

	@Override
	public int updatePossession(PosSessionVO posSessionVO) {
		return codeMgrMapper.updatePossession(posSessionVO);
	}

	@Override
	public int updateIcao(IcaoVO icaoVO) {
		return codeMgrMapper.updateIcao(icaoVO);
	}

	@Override
	public int updateClass1(Class1VO class1VO) {
		return codeMgrMapper.updateClass1(class1VO);
	}

	@Override
	public int updateClass2(Class2VO class2VO) {
		return codeMgrMapper.updateClass2(class2VO);
	}

	@Override
	public int updateClass3(Class3VO class3VO) {
		return codeMgrMapper.updateClass3(class3VO);
	}

	@Override
	public int updateCountry(CountryVO countryVO) {
		return codeMgrMapper.updateCountry(countryVO);
	}

	@Override
	public int updateEra(EraVO eraVO) {
		return codeMgrMapper.updateEra(eraVO);
	}

	@Override
	public int updateMaterial(Material1VO material1VO) {
		return codeMgrMapper.updateMaterial(material1VO);
	}

	@Override
	public int updateMaterial2(Material2VO material2VO) {
		return codeMgrMapper.updateMaterial2(material2VO);
	}

	@Override
	public int updateQtyUnit(QtyUnitVO qtyUnitVO) {
		return codeMgrMapper.updateQtyUnit(qtyUnitVO);
	}

	@Override
	public int updateExistence(ExistenceVO existenceVO) {
		return codeMgrMapper.updateExistence(existenceVO);
	}

	@Override
	public int updateMeasurement(MeasurementVO measurementVO) {
		return codeMgrMapper.updateMeasurement(measurementVO);
	}

	@Override
	public int updateMeasurementUnit(MeasurementUnitVO measurementUnitVO) {
		return codeMgrMapper.updateMeasurementUnit(measurementUnitVO);
	}

	@Override
	public int updateCondition(ConditionVO conditionVO) {
		return codeMgrMapper.updateCondition(conditionVO);
	}

	@Override
	public int updateRanking(RankingVO rankingVO) {
		return codeMgrMapper.updateRanking(rankingVO);
	}

	@Override
	public int updateGgnuri(GgnuriVO ggnuriVO) {
		return codeMgrMapper.updateGgnuri(ggnuriVO);
	}

	@Override
	public int updateSpeciality(SpecialityVO specialityVO) {
		return codeMgrMapper.updateSpeciality(specialityVO);
	}

	@Override
	public int updateObtainment(ObtainmentVO obtainmentVO) {
		return codeMgrMapper.updateObtainment(obtainmentVO);
	}

	@Override
	public int updatePriceUnit(PriceUnitVO priceUnitVO) {
		return codeMgrMapper.updatePriceUnit(priceUnitVO);
	}

	@Override
	public int updatePurchase1(Purchase1VO purchase1VO) {
		return codeMgrMapper.updatePurchase1(purchase1VO);
	}

	@Override
	public int updatePurchase2(Purchase2VO purchase2VO) {
		return codeMgrMapper.updatePurchase2(purchase2VO);
	}

	@Override
	public int updateStorageType1(StorageType1VO storageType1VO) {
		return codeMgrMapper.updateStorageType1(storageType1VO);
	}

	@Override
	public int updateStorageType2(StorageType2VO storageType2VO) {
		return codeMgrMapper.updateStorageType2(storageType2VO);
	}

	@Override
	public int updateStorageCode(StorageCodeVO storageCodeVO) {
		return codeMgrMapper.updateStorageCode(storageCodeVO);
	}

	@Override
	public int updateOrgSeq(OrgVO orgVO) {
		return codeMgrMapper.updateOrgSeq(orgVO);
	}

	@Override
	public int updatePossessionSeq(PosSessionVO posSessionVO) {
		return codeMgrMapper.updatePossessionSeq(posSessionVO);
	}

	@Override
	public int updateIcaoSeq(IcaoVO icaoVO) {
		return codeMgrMapper.updateIcaoSeq(icaoVO);
	}

	@Override
	public int updateClass1Seq(Class1VO class1VO) {
		return codeMgrMapper.updateClass1Seq(class1VO);
	}

	@Override
	public int updateClass2Seq(Class2VO class2VO) {
		return codeMgrMapper.updateClass2Seq(class2VO);
	}

	@Override
	public int updateClass3Seq(Class3VO class3VO) {
		return codeMgrMapper.updateClass3Seq(class3VO);
	}

	@Override
	public int updateCountrySeq(CountryVO countryVO) {
		return codeMgrMapper.updateCountrySeq(countryVO);
	}

	@Override
	public int updateEraSeq(EraVO eraVO) {
		return codeMgrMapper.updateEraSeq(eraVO);
	}

	@Override
	public int updateMaterialSeq(Material1VO material1VO) {
		return codeMgrMapper.updateMaterialSeq(material1VO);
	}

	@Override
	public int updateMaterial2Seq(Material2VO material2VO) {
		return codeMgrMapper.updateMaterial2Seq(material2VO);
	}

	@Override
	public int updateQtyUnitSeq(QtyUnitVO qtyUnitVO) {
		return codeMgrMapper.updateQtyUnitSeq(qtyUnitVO);
	}

	@Override
	public int updateExistenceSeq(ExistenceVO existenceVO) {
		return codeMgrMapper.updateExistenceSeq(existenceVO);
	}

	@Override
	public int updateMeasurementSeq(MeasurementVO measurementVO) {
		return codeMgrMapper.updateMeasurementSeq(measurementVO);
	}

	@Override
	public int updateMeasurementUnitSeq(MeasurementUnitVO measurementUnitVO) {
		return codeMgrMapper.updateMeasurementUnitSeq(measurementUnitVO);
	}

	@Override
	public int updateConditionSeq(ConditionVO conditionVO) {
		return codeMgrMapper.updateConditionSeq(conditionVO);
	}

	@Override
	public int updateRankingSeq(RankingVO rankingVO) {
		return codeMgrMapper.updateRankingSeq(rankingVO);
	}

	@Override
	public int updateGgnuriSeq(GgnuriVO ggnuriVO) {
		return codeMgrMapper.updateGgnuriSeq(ggnuriVO);
	}

	@Override
	public int updateSpecialitySeq(SpecialityVO specialityVO) {
		return codeMgrMapper.updateSpecialitySeq(specialityVO);
	}

	@Override
	public int updateObtainmentSeq(ObtainmentVO obtainmentVO) {
		return codeMgrMapper.updateObtainmentSeq(obtainmentVO);
	}

	@Override
	public int updatePriceUnitSeq(PriceUnitVO priceUnitVO) {
		return codeMgrMapper.updatePriceUnitSeq(priceUnitVO);
	}

	@Override
	public int updatePurchase1Seq(Purchase1VO purchase1VO) {
		return codeMgrMapper.updatePurchase1Seq(purchase1VO);
	}

	@Override
	public int updatePurchase2Seq(Purchase2VO purchase2VO) {
		return codeMgrMapper.updatePurchase2Seq(purchase2VO);
	}

	@Override
	public int updateStorageType1Seq(StorageType1VO storageType1VO) {
		return codeMgrMapper.updateStorageType1Seq(storageType1VO);
	}

	@Override
	public int updateStorageType2Seq(StorageType2VO storageType2VO) {
		return codeMgrMapper.updateStorageType2Seq(storageType2VO);
	}

	@Override
	public int updateStorageCodeSeq(StorageCodeVO storageCodeVO) {
		return codeMgrMapper.updateStorageCodeSeq(storageCodeVO);
	}

}
