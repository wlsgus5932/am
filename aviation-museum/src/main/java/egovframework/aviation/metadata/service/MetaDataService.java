package egovframework.aviation.metadata.service;

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
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.metadata.vo.PriceUnitVO;
import egovframework.aviation.metadata.vo.Purchase1VO;
import egovframework.aviation.metadata.vo.Purchase2VO;
import egovframework.aviation.metadata.vo.QtyUnitVO;
import egovframework.aviation.metadata.vo.RankingVO;

public interface MetaDataService {

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

}
