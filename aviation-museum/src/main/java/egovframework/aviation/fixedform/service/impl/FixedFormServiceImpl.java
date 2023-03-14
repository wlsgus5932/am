package egovframework.aviation.fixedform.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.fixedform.service.FixedFormService;
import egovframework.aviation.fixedform.vo.DataCardBackVO;
import egovframework.aviation.fixedform.vo.FixedFormVO;

@Service
public class FixedFormServiceImpl implements FixedFormService  {
	@Autowired
	private FixedFormMapper fixedFormMapper;
	
	@Override
	public List<FixedFormVO> getDataCardFrontList(FixedFormVO fixedFormVO) {
		return fixedFormMapper.getDataCardFrontList(fixedFormVO);
	}

	@Override
	public List<FixedFormVO> getDataCardBackList(DataCardBackVO dataCardBackVO) {
		return fixedFormMapper.getDataCardBackList(dataCardBackVO);
	}

	@Override
	public List<FixedFormVO> getDataCardBackPList(DataCardBackVO dataCardBackVO) {
		return fixedFormMapper.getDataCardBackPList(dataCardBackVO);
	}

}
