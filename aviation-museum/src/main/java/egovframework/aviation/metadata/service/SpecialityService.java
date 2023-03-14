package egovframework.aviation.metadata.service;

import java.util.List;

import egovframework.aviation.metadata.vo.param.SpecialityParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityVO;

public interface SpecialityService {

	List<SpecialityCodeVO> getSpecialityCode();

	int setSpeciality(SpecialityParamVO param);

	List<SpecialityVO> getSpeciality(SpecialityParamVO param);

	int deleteSpeciality(SpecialityParamVO param);

	int updateSpeciality(SpecialityParamVO param);

	List<SpecialityVO> getSpecialityData(int speciality_idx);

	int getSpecialityCnt(SpecialityParamVO param);

}
