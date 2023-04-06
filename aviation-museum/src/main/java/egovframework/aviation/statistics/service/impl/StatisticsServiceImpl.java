package egovframework.aviation.statistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.statistics.service.StatisticsService;
import egovframework.aviation.statistics.vo.StatisticsImagesVO;
import egovframework.aviation.statistics.vo.StatisticsMuseumVO;
import egovframework.aviation.statistics.vo.StatisticsSpecialityVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	private StatisticsMapper statisticsMapper;
	
	@Override
	public List<StatisticsSpecialityVO> getSpecialityList(StatisticsSpecialityVO statisticsSpecialityVO) {
		return statisticsMapper.getSpecialityList(statisticsSpecialityVO);
	}

	@Override
	public List<StatisticsImagesVO> getImagesList(StatisticsImagesVO statisticsImagesVO) {
		return statisticsMapper.getImagesList(statisticsImagesVO);
	}

	@Override
	public List<StatisticsMuseumVO> getMuseumList(StatisticsMuseumVO statisticsMuseumVO) {
		return statisticsMapper.getMuseumList(statisticsMuseumVO);
	}

}
