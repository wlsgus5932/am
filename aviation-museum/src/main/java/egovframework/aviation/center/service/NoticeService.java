package egovframework.aviation.center.service;

import java.util.List;

import egovframework.aviation.center.vo.NoticeVO;
import egovframework.aviation.user.vo.UserVO;

public interface NoticeService {
	
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO);
	
	public int getNoticeListCnt(NoticeVO noticeVO);
	
	public int insertNotice(NoticeVO noticeVO);
}
