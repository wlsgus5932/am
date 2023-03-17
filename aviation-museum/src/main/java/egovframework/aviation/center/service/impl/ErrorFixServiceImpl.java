package egovframework.aviation.center.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.aviation.center.service.ErrorFixService;
import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.ErrorFixVO;
import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.user.vo.UserVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ErrorFixServiceImpl implements ErrorFixService {

	private final ErrorFixMapper dao;

	@Override
	public List<ErrorFixVO> getErrorFixList(ErrorFixVO errorFixVO) {
		return dao.getErrorFixList(errorFixVO);
	}

	@Override
	public int getErrorFixListCnt(ErrorFixVO errorFixVO) {
		return dao.getErrorFixListCnt(errorFixVO);
	}

	@Override
	public int insertErrorFix(ErrorFixVO errorFixVO) {
		return dao.insertErrorFix(errorFixVO);
	}

	@Override
	public int updateErrorFix(ErrorFixVO errorFixVO) {
		return dao.updateErrorFix(errorFixVO);
	}

	@Override
	public int deleteErrorFixList(ErrorFixVO errorFixVO) {
		return dao.deleteErrorFixList(errorFixVO);
	}
	
	

}
