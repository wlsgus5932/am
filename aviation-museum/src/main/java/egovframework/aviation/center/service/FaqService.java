package egovframework.aviation.center.service;

import java.util.List;

import egovframework.aviation.center.vo.FaqVO;

public interface FaqService {
	
	public List<FaqVO> getFaqList(FaqVO faqVO);
	
	public int getFaqListCnt(FaqVO faqVO);
	
	public int insertFaq(FaqVO faqVO);
	
	public int updateFaq(FaqVO faqVO);
	
	public int deleteFaqList(FaqVO faqVO);
	
}
