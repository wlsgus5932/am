package egovframework.aviation.center.service;

import java.util.List;

import egovframework.aviation.center.vo.ErrorFixVO;

public interface ErrorFixService {
	
	public List<ErrorFixVO> getErrorFixList(ErrorFixVO errorFixVO);
	
	public int getErrorFixListCnt(ErrorFixVO errorFixVO);
	
	public int insertErrorFix(ErrorFixVO errorFixVO);
	
	public int updateErrorFix(ErrorFixVO errorFixVO);
	
	public int deleteErrorFixList(ErrorFixVO errorFixVO);
	
}
