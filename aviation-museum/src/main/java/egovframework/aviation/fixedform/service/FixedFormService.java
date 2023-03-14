package egovframework.aviation.fixedform.service;

import java.util.List;

import egovframework.aviation.fixedform.vo.DataCardBackVO;
import egovframework.aviation.fixedform.vo.FixedFormVO;

public interface FixedFormService {

	public List<FixedFormVO> getDataCardFrontList(FixedFormVO fixedFormVO);

	public List<FixedFormVO> getDataCardBackList(DataCardBackVO dataCardBackVO);

	public List<FixedFormVO> getDataCardBackPList(DataCardBackVO dataCardBackVO);

}
