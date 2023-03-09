package egovframework.aviation.preferences.service;

import java.util.List;

import egovframework.aviation.mypage.vo.RequestHistoryVO;

public interface ApprovalMgrService {

	int getErasureListCnt(RequestHistoryVO requestHistoryVO);

	List<RequestHistoryVO> getErasureList(RequestHistoryVO requestHistoryVO);

	List<RequestHistoryVO> getKeywordList(RequestHistoryVO requestHistoryVO);

	int getKeywordListCnt(RequestHistoryVO requestHistoryVO);

	int updateErasureApproval(RequestHistoryVO requestHistoryVO);

	int updateKeywordApproval(RequestHistoryVO requestHistoryVO);

	int insertAllKeyword(RequestHistoryVO requestHistoryVO);

	int insertKeyword(RequestHistoryVO requestHistoryVO);

	int deleteItem(RequestHistoryVO requestHistoryVO);

}
