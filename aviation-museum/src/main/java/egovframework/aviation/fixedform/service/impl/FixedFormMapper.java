package egovframework.aviation.fixedform.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.fixedform.vo.DataCardBackVO;
import egovframework.aviation.fixedform.vo.FixedFormVO;

@Mapper
public interface FixedFormMapper {
	
	public List<FixedFormVO> getDataCardFrontList(FixedFormVO fixedFormVO);
	
	public List<FixedFormVO> getDataCardBackList(DataCardBackVO dataCardBackVO);
	
	public List<FixedFormVO> getDataCardBackPList(DataCardBackVO dataCardBackVO);
}
