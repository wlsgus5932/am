package egovframework.aviation.center.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.center.vo.ErrorFixVO;
import egovframework.aviation.center.vo.NoticeVO;

@Mapper
public interface ErrorFixMapper {
	
	public List<ErrorFixVO> getErrorFixList(ErrorFixVO errorFixVO);

	public int getErrorFixListCnt(ErrorFixVO errorFixVO);
	
	public int insertErrorFix(ErrorFixVO errorFixVO);
	
	public int updateErrorFix(ErrorFixVO errorFixVO);
	
	public int deleteErrorFixList(ErrorFixVO errorFixVO);
}
