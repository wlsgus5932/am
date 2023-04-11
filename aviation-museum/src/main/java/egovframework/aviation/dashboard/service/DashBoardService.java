package egovframework.aviation.dashboard.service;

import java.util.List;

import egovframework.aviation.dashboard.vo.Class1DataVO;
import egovframework.aviation.dashboard.vo.CountryDataVO;
import egovframework.aviation.dashboard.vo.Material1DataVO;
import egovframework.aviation.dashboard.vo.RecentWorkVO;
import egovframework.aviation.dashboard.vo.RegStateDataVO;
import egovframework.aviation.dashboard.vo.RentalVO;
import egovframework.aviation.dashboard.vo.WorkerDataVO;

public interface DashBoardService {

	List<CountryDataVO> getCountryDataList(CountryDataVO countryDataVO);

	List<Class1DataVO> getClass1DataList(Class1DataVO class1DataVO);

	List<Material1DataVO> getMaterial1DataList(Material1DataVO material1DataVO);

	List<RegStateDataVO> getRegStateDataList(RegStateDataVO regStateDataVO);

	int getWorkHistoryYear();

	int getWorkHistoryMonth();

	int getWorkHistoryWeek();
	
	int getWorkHistoryDay();

	List<WorkerDataVO> getWorkerDataList(WorkerDataVO workerDataVO);

	List<RecentWorkVO> getRecentWorkList(RecentWorkVO recentWorkVO);

	List<RentalVO> getInsideRental(RentalVO rentalVO);

	List<RentalVO> getOutsideRental(RentalVO rentalVO);

}
