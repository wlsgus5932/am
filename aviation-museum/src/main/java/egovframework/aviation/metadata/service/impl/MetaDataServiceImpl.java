package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.MetaDataService;
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

@Service
public class MetaDataServiceImpl implements MetaDataService {
	
	@Autowired
	private MetaDataMapper dao;

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
	
	

}
