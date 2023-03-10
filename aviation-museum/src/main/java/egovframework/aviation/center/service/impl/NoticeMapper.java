package egovframework.aviation.center.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.aviation.center.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	
	public List<NoticeVO> getNoticeList(NoticeVO noticeVO);

	public int getNoticeListCnt(NoticeVO noticeVO);
	
	public int insertNotice(NoticeVO noticeVO);
}
