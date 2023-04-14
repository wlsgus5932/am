package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.preferences.vo.AccessLogVO;
import egovframework.aviation.preferences.vo.MovementDetailLogVO;
import egovframework.aviation.preferences.vo.MovementLogVO;
import egovframework.aviation.preferences.vo.SpecialityLogVO;

@Mapper
public interface LogMgrMapper {

	List<AccessLogVO> getAccessLogList(AccessLogVO accessLogVO);

	List<SpecialityLogVO> getSpecialityLogList(SpecialityLogVO specialityLogVO);
	
	List<MovementLogVO> getMovementLogList(MovementLogVO movementLogVO);
	
	List<MovementDetailLogVO> getMovementDetailLogList(MovementDetailLogVO movementDetailLogVO);
}
