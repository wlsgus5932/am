package egovframework.aviation.center.service.impl;

import java.util.List;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.center.vo.FaqVO;

@Mapper
public interface FaqMapper {
	
	public List<FaqVO> getFaqList(FaqVO faqVO);

	public int getFaqListCnt(FaqVO faqVO);
	
	public int insertFaq(FaqVO faqVO);
	
	public int updateFaq(FaqVO faqVO);
	
	public int deleteFaqList(FaqVO faqVO);
}
