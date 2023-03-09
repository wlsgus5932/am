package egovframework.aviation.mypage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.service.MyPageService;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.mypage.vo.Speciality1VO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public List<InterestVO> getInterestList(InterestVO interestVO) {
		return myPageMapper.getInterestList(interestVO);
	}

	@Override
	public int getInterestListCnt(InterestVO interestVO) {
		return myPageMapper.getInterestListCnt(interestVO);
	}

	@Override
	public List<Speciality1VO> getSpecialityList(Speciality1VO speciality1VO) {
		return myPageMapper.getSpecialityList(speciality1VO);
	}

	@Override
	public int getSpecialityListCnt(Speciality1VO speciality1VO) {
		return myPageMapper.getSpecialityListCnt(speciality1VO);
	}

	@Override
	public int deleteInterest(InterestVO interestVO) {
		return myPageMapper.deleteInterest(interestVO);
	}

	@Override
	public List<RequestHistoryVO> getRequestHistoryList(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.getRequestHistoryList(requestHistoryVO);
	}

	@Override
	public int getRequestHistoryListCnt(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.getRequestHistoryListCnt(requestHistoryVO);
	}

	@Override
	public List<PosSessionVO> getPossessionList(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.getPossessionList(requestHistoryVO);
	}

	@Override
	public RequestHistoryVO getErasureRefusalReason(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.getErasureRefusalReason(requestHistoryVO);
	}

	@Override
	public RequestHistoryVO getKeywordRefusalReason(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.getKeywordRefusalReason(requestHistoryVO);
	}

	@Override
	public int updateKeywordRequest(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.updateKeywordRequest(requestHistoryVO);
	}

	@Override
	public int updateErasureRequest(RequestHistoryVO requestHistoryVO) {
		return myPageMapper.updateErasureRequest(requestHistoryVO);
	}

	@Override
	public List<WorkHistoryVO> getWorkHistoryList(WorkHistoryVO workHistoryVO) {
		return myPageMapper.getWorkHistoryList(workHistoryVO);
	}

	@Override
	public int getWorkHistoryListCnt(WorkHistoryVO workHistoryVO) {
		return myPageMapper.getWorkHistoryListCnt(workHistoryVO);
	}

	@Override
	public int getWorkHistoryViewListCnt(WorkHistoryVO workHistoryVO) {
		return myPageMapper.getWorkHistoryViewListCnt(workHistoryVO);
	}

	@Override
	public List<WorkHistoryVO> getWorkHistoryViewList(WorkHistoryVO workHistoryVO) {
		return myPageMapper.getWorkHistoryViewList(workHistoryVO);
	}

	@Override
	public int updateInterest(InterestVO interestVO) {
		return myPageMapper.updateInterest(interestVO);
	}
}
