package egovframework.aviation.statistics.service;

import java.util.List;

import egovframework.aviation.statistics.vo.StatisticsImagesVO;
import egovframework.aviation.statistics.vo.StatisticsMuseumVO;
import egovframework.aviation.statistics.vo.StatisticsSpecialityVO;

public interface StatisticsService{

	List<StatisticsSpecialityVO> getSpecialityList(StatisticsSpecialityVO statisticsSpecialityVO);

	List<StatisticsImagesVO> getImagesList(StatisticsImagesVO statisticsImagesVO);

	List<StatisticsMuseumVO> getMuseumList(StatisticsMuseumVO statisticsMuseumVO);

}
