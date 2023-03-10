package egovframework.aviation.center.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.aviation.center.service.NoticeService;
import egovframework.aviation.center.vo.NoticeVO;
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

}
