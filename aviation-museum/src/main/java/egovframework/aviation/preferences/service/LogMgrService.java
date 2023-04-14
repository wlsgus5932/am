package egovframework.aviation.preferences.service;

import java.util.List;

import egovframework.aviation.preferences.vo.AccessLogVO;
import egovframework.aviation.preferences.vo.MovementDetailLogVO;
import egovframework.aviation.preferences.vo.MovementLogVO;
import egovframework.aviation.preferences.vo.SpecialityLogVO;

public interface LogMgrService {

	List<AccessLogVO> getAccessLogList(AccessLogVO accessLogVO);

	List<SpecialityLogVO> getSpecialityLogList(SpecialityLogVO specialityLogVO);

	List<MovementLogVO> getMovementLogList(MovementLogVO movementLogVO);

	List<MovementDetailLogVO> getMovementDetailLogList(MovementDetailLogVO movementDetailLogVO);

}
