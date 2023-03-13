package egovframework.aviation.center.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.aviation.center.service.FaqService;
import egovframework.aviation.center.vo.FaqVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class FaqServiceImpl implements FaqService {

	private final FaqMapper dao;

	@Override
	public List<FaqVO> getFaqList(FaqVO faqVO) {
		return dao.getFaqList(faqVO);
	}

	@Override
	public int getFaqListCnt(FaqVO faqVO) {
		return dao.getFaqListCnt(faqVO);
	}

	@Override
	public int insertFaq(FaqVO faqVO) {
		return dao.insertFaq(faqVO);
	}

	@Override
	public int updateFaq(FaqVO faqVO) {
		return dao.updateFaq(faqVO);
	}

	@Override
	public int deleteFaqList(FaqVO faqVO) {
		return dao.deleteFaqList(faqVO);
	}

	
	

}
