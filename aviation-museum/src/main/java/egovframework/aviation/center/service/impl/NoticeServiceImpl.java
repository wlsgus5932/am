package egovframework.aviation.center.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.user.vo.UserVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper dao;
	
	@Override
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO) {
		return dao.getNoticeList(noticeVO);
	}

	@Override
	public int getNoticeListCnt(NoticeVO noticeVO) {
		return dao.getNoticeListCnt(noticeVO);
	}

	@Override
	public int insertNotice(NoticeVO noticeVO) {
		return dao.insertNotice(noticeVO);
	}
	
	public int updateNotice(NoticeVO noticeVO) {
		return dao.updateNotice(noticeVO);
	}

	@Override
	public int deleteNoticeList(NoticeVO noticeVO) {
		return dao.deleteNoticeList(noticeVO);
	}

}
