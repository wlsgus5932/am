package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.preferences.service.LogMgrService;
import egovframework.aviation.preferences.vo.AccessLogVO;
import egovframework.aviation.preferences.vo.MovementDetailLogVO;
import egovframework.aviation.preferences.vo.MovementLogVO;
import egovframework.aviation.preferences.vo.SpecialityLogVO;

@Service
public class LogMgrServiceImpl implements LogMgrService {

	@Autowired
	private LogMgrMapper logMgrMapper;

	@Override
	public List<AccessLogVO> getAccessLogList(AccessLogVO accessLogVO) {
		return logMgrMapper.getAccessLogList(accessLogVO);
	}

	@Override
	public List<SpecialityLogVO> getSpecialityLogList(SpecialityLogVO specialityLogVO) {
		return logMgrMapper.getSpecialityLogList(specialityLogVO);
	}

	@Override
	public List<MovementLogVO> getMovementLogList(MovementLogVO movementLogVO) {
		return logMgrMapper.getMovementLogList(movementLogVO);
	}

	@Override
	public List<MovementDetailLogVO> getMovementDetailLogList(MovementDetailLogVO movementDetailLogVO) {
		return logMgrMapper.getMovementDetailLogList(movementDetailLogVO);
	}
}
