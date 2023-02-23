package egovframework.aviation.preferences.service;

import java.util.List;

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
import egovframework.aviation.preferences.vo.SpecialityVO;
import egovframework.aviation.preferences.vo.StorageCodeVO;
import egovframework.aviation.preferences.vo.StorageType1VO;
import egovframework.aviation.preferences.vo.StorageType2VO;

public interface CodeMgrService {

	List<OrgVO> getOrgList(OrgVO orgVO);

	List<PosSessionVO> getPossessionList(PosSessionVO posSessionVO);

	List<IcaoVO> getIcaoList(IcaoVO icaoVO);
	
	List<Class1VO> getClass1List(Class1VO class1VO);
	
	List<Class2VO> getClass2List(Class2VO class2VO);
	
	List<Class3VO> getClass3List(Class3VO class3VO);
	
	List<CountryVO> getCountryList(CountryVO countryVO);
	
	List<EraVO> getEraList(CountryVO countryVO);

	List<Material1VO> getMaterial1List(Material1VO material1VO);

	List<Material2VO> getMaterial2List(Material2VO material2VO);

	List<QtyUnitVO> getQtyUnitList(QtyUnitVO qtyUnitVO);

	List<ExistenceVO> getExistenceList(ExistenceVO existenceVO);

	List<MeasurementUnitVO> getMeasurementUnitList(MeasurementUnitVO measurementUnitVO);

	List<MeasurementVO> getMeasurementList(MeasurementVO measurementVO);

	List<ConditionVO> getConditionList(ConditionVO conditionVO);

	List<RankingVO> getRankingList(RankingVO rankingVO);

	List<GgnuriVO> getGgnuriList(GgnuriVO ggnuriVO);

	List<SpecialityVO> getSpecialityList(SpecialityVO specialityVO);

	List<ObtainmentVO> getObtainmentList(ObtainmentVO obtainmentVO);

	List<PriceUnitVO> getPriceUnitList(PriceUnitVO priceUnitVO);

	List<Purchase1VO> getPurchase1List(Purchase1VO purchase1VO);

	List<Purchase2VO> getPurchase2List(Purchase2VO purchase2VO);

	List<StorageType1VO> getStorageType1List(StorageType1VO storageType1VO);

	List<StorageType2VO> getStorageType2List(StorageType2VO storageType2VO);

	List<StorageCodeVO> getStorageCodeList(StorageCodeVO storageCodeVO);
	
	List<StorageCodeVO> getStorageCodeViewList(StorageCodeVO storageCodeVO);
	
	int insertQtyUnit(QtyUnitVO qtyUnitVO);

	int insertExistence(ExistenceVO existenceVO);

	int insertMeasurement(MeasurementVO measurementVO);

	int insertMeasurementUnit(MeasurementUnitVO measurementUnitVO);

	int insertCondition(ConditionVO conditionVO);

	int insertRanking(RankingVO rankingVO);

	int insertGgnuri(GgnuriVO ggnuriVO);

	int insertSpeciality(SpecialityVO specialityVO);

	int insertObtainment(ObtainmentVO obtainmentVO);

	int insertPriceUnit(PriceUnitVO priceUnitVO);

	int insertPurchase1(Purchase1VO purchase1VO);

	int insertPurchase2(Purchase2VO purchase2VO);

	int insertIcao(IcaoVO icaoVO);

	int insertClass1(Class1VO class1VO);

	int insertClass2(Class2VO class2VO);

	int insertClass3(Class3VO class3VO);

	int insertOrg(OrgVO orgVO);

	int insertCountry(CountryVO countryVO);

	int insertMaterial(Material1VO material1VO);

	int insertStorageType1(StorageType1VO storageType1VO);

	int insertPossession(PosSessionVO posSessionVO);

	int insertEra(EraVO eraVO);

	int insertMaterial2(Material2VO material2VO);

	int insertStorageType2(StorageType2VO storageType2VO);

	int insertStorageCode(StorageCodeVO storageCodeVO);

	int updateOrg(OrgVO orgVO);

	int updatePossession(PosSessionVO posSessionVO);

	int updateIcao(IcaoVO icaoVO);

	int updateClass1(Class1VO class1VO);

	int updateClass2(Class2VO class2VO);

	int updateClass3(Class3VO class3VO);

	int updateCountry(CountryVO countryVO);

	int updateEra(EraVO eraVO);

	int updateMaterial(Material1VO material1VO);

	int updateMaterial2(Material2VO material2VO);

	int updateQtyUnit(QtyUnitVO qtyUnitVO);

	int updateExistence(ExistenceVO existenceVO);

	int updateMeasurement(MeasurementVO measurementVO);

	int updateMeasurementUnit(MeasurementUnitVO measurementUnitVO);

	int updateCondition(ConditionVO conditionVO);

	int updateRanking(RankingVO rankingVO);

	int updateGgnuri(GgnuriVO ggnuriVO);

	int updateSpeciality(SpecialityVO specialityVO);

	int updateObtainment(ObtainmentVO obtainmentVO);

	int updatePriceUnit(PriceUnitVO priceUnitVO);

	int updatePurchase1(Purchase1VO purchase1VO);

	int updatePurchase2(Purchase2VO purchase2VO);

	int updateStorageType1(StorageType1VO storageType1VO);

	int updateStorageType2(StorageType2VO storageType2VO);

	int updateStorageCode(StorageCodeVO storageCodeVO);

	int updateOrgSeq(OrgVO orgVO);

	int updatePossessionSeq(PosSessionVO posSessionVO);

	int updateIcaoSeq(IcaoVO icaoVO);

	int updateClass1Seq(Class1VO class1vo);

	int updateClass2Seq(Class2VO class2vo);

	int updateClass3Seq(Class3VO class3vo);

	int updateCountrySeq(CountryVO countryVO);

	int updateEraSeq(EraVO eraVO);

	int updateMaterialSeq(Material1VO material1VO);

	int updateMaterial2Seq(Material2VO material2VO);

	int updateQtyUnitSeq(QtyUnitVO qtyUnitVO);

	int updateExistenceSeq(ExistenceVO existenceVO);

	int updateMeasurementSeq(MeasurementVO measurementVO);

	int updateMeasurementUnitSeq(MeasurementUnitVO measurementUnitVO);

	int updateConditionSeq(ConditionVO conditionVO);

	int updateRankingSeq(RankingVO rankingVO);

	int updateGgnuriSeq(GgnuriVO ggnuriVO);

	int updateSpecialitySeq(SpecialityVO specialityVO);

	int updateObtainmentSeq(ObtainmentVO obtainmentVO);

	int updatePriceUnitSeq(PriceUnitVO priceUnitVO);

	int updatePurchase1Seq(Purchase1VO purchase1VO);

	int updatePurchase2Seq(Purchase2VO purchase2VO);

	int updateStorageType1Seq(StorageType1VO storageType1VO);

	int updateStorageType2Seq(StorageType2VO storageType2VO);

	int updateStorageCodeSeq(StorageCodeVO storageCodeVO);

}
