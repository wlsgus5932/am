package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.preferences.service.ApprovalMgrService;

@Service
public class ApprovalMgrServiceImpl implements ApprovalMgrService{
	
	@Autowired
	private ApprovalMgrMapper approvalMgrMapper;
	
	@Override
	public int getErasureListCnt(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.getErasureListCnt(requestHistoryVO);
	}

	@Override
	public List<RequestHistoryVO> getErasureList(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.getErasureList(requestHistoryVO);
	}

	@Override
	public List<RequestHistoryVO> getKeywordList(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.getKeywordList(requestHistoryVO);
	}

	@Override
	public int getKeywordListCnt(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.getKeywordListCnt(requestHistoryVO);
	}

	@Override
	public int updateErasureApproval(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.updateErasureApproval(requestHistoryVO);
	}

	@Override
	public int updateKeywordApproval(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.updateKeywordApproval(requestHistoryVO);
	}

	@Override
	public int insertAllKeyword(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.insertAllKeyword(requestHistoryVO);
	}

	@Override
	public int insertKeyword(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.insertKeyword(requestHistoryVO);
	}

	@Override
	public int deleteItem(RequestHistoryVO requestHistoryVO) {
		return approvalMgrMapper.deleteItem(requestHistoryVO);
	}

}
