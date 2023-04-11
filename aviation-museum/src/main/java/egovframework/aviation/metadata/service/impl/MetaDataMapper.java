package egovframework.aviation.metadata.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

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
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.metadata.PublicServiceVO;
import egovframework.aviation.metadata.vo.metadata.TaxonomyVO;
import egovframework.aviation.metadata.vo.param.AllChangeItemParamVO;
import egovframework.aviation.metadata.vo.param.DeletionParamVO;
import egovframework.aviation.metadata.vo.param.KeywordParamVO;
import egovframework.aviation.metadata.vo.param.MetaDataParamVO;
import egovframework.aviation.metadata.vo.param.MovementParamVO;

@Mapper
public interface MetaDataMapper {

	List<CountryVO> getCountry();

	List<EraVO> getEra(int country);

	List<Material1VO> getMaterial1();

	List<Material2VO> getMaterial2(int material);

	List<IcaoVO> getIcao();

	List<ExistenceVO> getExistence();

	List<MeasurementVO> getMeasurement();

	List<MeasurementUnitVO> getMeasurementUnit();

	List<Class1VO> getClass1();

	List<Class2VO> getClass2();

	List<Class3VO> getClass3();

	List<ObtainmentVO> getObtainment();

	List<Purchase1VO> getPurchase1();

	List<Purchase2VO> getPurchase2();

	List<PriceUnitVO> getPriceUnit();

	List<QtyUnitVO> getQtyUnit();

	List<ConditionVO> getCondition();

	List<RankingVO> getRanking();

	List<PosSessionVO> getPosSession();

	List<GgnuriVO> getGgnuri();

	List<OrgVO> getOrg();

	int setItemBase(MetaDataParamVO param);

	void setTaxonomy(@Param("classMap") HashMap<Integer, Object> classMap);

	void setCountry(@Param("countryMap") HashMap<Integer, Object> countryMap);

	void setMaterial(@Param("materialMap") HashMap<Integer, Object> materialMap);

	void setMeasurement(@Param("measureMap") HashMap<Integer, Object> measureMap);

	void setObtainment(MetaDataParamVO param);

	void setInvolvement(@Param("possessionMap") HashMap<Integer, Object> possessionMap);

	void setInsurance(@Param("insuranceMap") HashMap<Integer, Object> insuranceMap);

	void setCopyright(@Param("copyrightMap") HashMap<Integer, Object> copyrightMap);

	void setGgnuri(MetaDataParamVO param);

	void setKeyword(MetaDataParamVO param);

	List<StorageType1VO> getStorageType1();

	List<StorageType2VO> getStorageType2(int type2);

	List<StorageVO> getStorage(int i);

	int setMovement(MovementParamVO param);

	void setStorage(MovementParamVO param);

	void setStorage2(MovementParamVO param);

	int updateMovement(MovementParamVO param);

	void updateStorageIn(@Param("list") List<Map<String, Object>> list);

	int deleteStorage(int movement_idx);

	int deleteMovement(int movement_idx);

	List<MovementVO> getMovement(MovementParamVO param);

	List<MovementInVO> getMovementOut(int movement_id);

	List<ItemBaseVO> getItemBase(MetaDataParamVO param);

	List<Map<String, Object>> getClassCode();

	List<TaxonomyVO> getTaxonomy(int item_idx);

	List<CountryEraVO> getCountryEra(int item_idx);

	List<MaterialVO> getMaterial(int item_idx);

	List<MeasurementVO> getMeasure(int item_idx);

	List<ObtainmentVO> getObtainmentList(int item_idx);

	List<InvolvementVO> getInvolvementList(int item_idx);

	List<InsuranceVO> getInsuranceList(int item_idx);

	List<CopyrightVO> getCopyrightList(int item_idx);

	List<PublicServiceVO> getPublicService(int item_idx);

	List<KeywordVO> getKewordList(int item_idx);

	int updateItemBase(MetaDataParamVO param);

	void updateObtainment(MetaDataParamVO param);

	void updateGgnuri(MetaDataParamVO param);

	void updateKeyword(MetaDataParamVO param);

	int deleteTaxonomy(@Param("arr") String[] arr);

	int deleteCountry(@Param("arr") String[] arr);

	int deleteMaterial(@Param("arr") String[] arr);

	int deleteMeasurement(@Param("arr") String[] arr);

	int deleteInvolvement(@Param("arr") String[] arr);

	int deleteInsurance(@Param("arr") String[] arr);

	int deleteCopyright(@Param("arr") String[] arr);

	List<DeletionVO> getDeletionList(DeletionParamVO param);

	int getDeletionCnt(DeletionParamVO param);

	int deleteDeletion(DeletionParamVO param);

	int deleteDeletion(@Param("map") Map<Integer, Object> map);

	List<KeywordVO> getKeywordList(KeywordParamVO param);

	List<MovementVO> getMovementData(int movement_idx);

	List<MovementVO> getMovementExcel(MovementParamVO param);

	int getMovementListCnt(MovementParamVO param);

	Integer getMetaDataInfo(MetaDataParamVO param);

	String searchItemNo(MetaDataParamVO param);

	int setItemNo(MetaDataParamVO param);

	List<ExchangeVO> getExchange();

	List<ItemBaseVO> getSearchItemNext(MetaDataParamVO param);

	void updateTaxonomy(HashMap<String, Object> classUdt);

	void updateCountry(HashMap<String, Object> countryUdt);

	void updateMaterial(HashMap<String, Object> materialUdt);

	void updateMeasurement(HashMap<String, Object> measurementUdt);

	void updateInvolvement(HashMap<String, Object> involvementUdt);

	void updateInsurance(HashMap<String, Object> insuranceUdt);

	void updateCopyright(HashMap<String, Object> copyrightUdt);

	void deleteKeyword(MetaDataParamVO param);

	List<ItemBaseVO> getSearchItemPrev(MetaDataParamVO param);

	List<ItemBaseVO> searchItemNextMax(MetaDataParamVO param);

	List<ItemBaseVO> searchItemNextMin(MetaDataParamVO param);

	List<ItemBaseVO> getRankingCondition(int item_idx);

	int changeTaxonomyItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	List<Map<String, Object>> getItemIdx(AllChangeItemParamVO param);

	int changeCountryItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeMaterialItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeQtyItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeMeasurementItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeRankingItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeObtainmentItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changePurchase1Item(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changePurchase2Item(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changePriceItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeDesignationItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);

	int changeExistenceItem(@Param("param") AllChangeItemParamVO param, @Param("item_idx") List<Map<String, Object>> dto);
}
