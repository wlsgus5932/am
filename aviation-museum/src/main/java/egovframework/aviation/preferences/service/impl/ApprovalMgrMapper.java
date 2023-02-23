package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.mypage.vo.RequestHistoryVO;

@Mapper
public interface ApprovalMgrMapper {

	int getErasureListCnt(RequestHistoryVO requestHistoryVO);

	List<RequestHistoryVO> getErasureList(RequestHistoryVO requestHistoryVO);
	
	List<RequestHistoryVO> getKeywordList(RequestHistoryVO requestHistoryVO);

	int getKeywordListCnt(RequestHistoryVO requestHistoryVO);
	
	int updateErasureApproval(RequestHistoryVO requestHistoryVO);

	int updateKeywordApproval(RequestHistoryVO requestHistoryVO);

	int insertAllKeyword(RequestHistoryVO requestHistoryVO);

	int insertKeyword(RequestHistoryVO requestHistoryVO);
}
