package egovframework.aviation.mypage.service;

import java.util.List;

import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.vo.InterestVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.mypage.vo.Speciality1VO;
import egovframework.aviation.mypage.vo.WorkHistoryVO;

public interface MyPageService {
	
	public List<InterestVO> getInterestList(InterestVO interestVO);
	
	public int getInterestListCnt(InterestVO interestVO);
	
	public List<Speciality1VO> getSpecialityList(Speciality1VO speciality1VO);
	
	public int getSpecialityListCnt(Speciality1VO speciality1VO);

	public int deleteInterest(InterestVO interestVO);
	
	public List<RequestHistoryVO> getRequestHistoryList(RequestHistoryVO requestHistoryVO);
	
	public int getRequestHistoryListCnt(RequestHistoryVO requestHistoryVO);
	
	public List<PosSessionVO> getPossessionList(RequestHistoryVO requestHistoryVO);
	
	public RequestHistoryVO getErasureRefusalReason(RequestHistoryVO requestHistoryVO);
	
	public RequestHistoryVO getKeywordRefusalReason(RequestHistoryVO requestHistoryVO);

	public int updateKeywordRequest(RequestHistoryVO requestHistoryVO);

	public int updateErasureRequest(RequestHistoryVO requestHistoryVO);

	public List<WorkHistoryVO> getWorkHistoryList(WorkHistoryVO workHistoryVO);

	public int getWorkHistoryListCnt(WorkHistoryVO workHistoryVO);

	public int getWorkHistoryViewListCnt(WorkHistoryVO workHistoryVO);

	public List<WorkHistoryVO> getWorkHistoryViewList(WorkHistoryVO workHistoryVO);
}
