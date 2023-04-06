package egovframework.aviation.statistics.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.statistics.vo.StatisticsImagesVO;
import egovframework.aviation.statistics.vo.StatisticsMuseumVO;
import egovframework.aviation.statistics.vo.StatisticsSpecialityVO;

@Mapper
public interface StatisticsMapper {

	List<StatisticsSpecialityVO> getSpecialityList(StatisticsSpecialityVO statisticsSpecialityVO);
	
	List<StatisticsImagesVO> getImagesList(StatisticsImagesVO statisticsImagesVO);
	
	List<StatisticsMuseumVO> getMuseumList(StatisticsMuseumVO statisticsMuseumVO);
}
