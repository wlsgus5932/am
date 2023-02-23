package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.param.SpecialityParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityVO;

@Mapper
public interface SpecialityMapper {

	List<SpecialityCodeVO> getSpecialityCode();
	int setSpeciality(SpecialityParamVO param);
	List<SpecialityVO> getSpeciality();
	int deleteSpeciality(SpecialityParamVO param);
	int updateSpeciality(SpecialityParamVO param);
	
}
