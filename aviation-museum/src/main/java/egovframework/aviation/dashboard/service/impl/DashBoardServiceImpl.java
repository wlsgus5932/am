package egovframework.aviation.dashboard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.dashboard.service.DashBoardService;
import egovframework.aviation.dashboard.vo.Class1DataVO;
import egovframework.aviation.dashboard.vo.CountryDataVO;
import egovframework.aviation.dashboard.vo.Material1DataVO;
import egovframework.aviation.dashboard.vo.RecentWorkVO;
import egovframework.aviation.dashboard.vo.RegStateDataVO;
import egovframework.aviation.dashboard.vo.RentalVO;
import egovframework.aviation.dashboard.vo.WorkerDataVO;

@Service
public class DashBoardServiceImpl implements DashBoardService {
	@Autowired
	private DashBoardMapper dashBoardMapper;

	@Override
	public List<CountryDataVO> getCountryDataList(CountryDataVO countryDataVO) {
		return dashBoardMapper.getCountryDataList(countryDataVO);
	}

	@Override
	public List<Class1DataVO> getClass1DataList(Class1DataVO class1DataVO) {
		return dashBoardMapper.getClass1DataList(class1DataVO);
	}

	@Override
	public List<Material1DataVO> getMaterial1DataList(Material1DataVO material1DataVO) {
		return dashBoardMapper.getMaterial1DataList(material1DataVO);
	}

	@Override
	public List<RegStateDataVO> getRegStateDataList(RegStateDataVO regStateDataVO) {
		return dashBoardMapper.getRegStateDataList(regStateDataVO);
	}

	@Override
	public int getWorkHistoryYear() {
		return dashBoardMapper.getWorkHistoryYear();
	}

	@Override
	public int getWorkHistoryMonth() {
		return dashBoardMapper.getWorkHistoryMonth();
	}

	@Override
	public int getWorkHistoryWeek() {
		return dashBoardMapper.getWorkHistoryWeek();
	}
	
	@Override
	public int getWorkHistoryDay() {
		return dashBoardMapper.getWorkHistoryDay();
	}

	@Override
	public List<WorkerDataVO> getWorkerDataList(WorkerDataVO workerDataVO) {
		return dashBoardMapper.getWorkerDataList(workerDataVO);
	}

	@Override
	public List<RecentWorkVO> getRecentWorkList(RecentWorkVO recentWorkVO) {
		return dashBoardMapper.getRecentWorkList(recentWorkVO);
	}

	@Override
	public List<RentalVO> getInsideRental(RentalVO rentalVO) {
		return dashBoardMapper.getInsideRental(rentalVO);
	}

	@Override
	public List<RentalVO> getOutsideRental(RentalVO rentalVO) {
		return dashBoardMapper.getOutsideRental(rentalVO);
	}

}
