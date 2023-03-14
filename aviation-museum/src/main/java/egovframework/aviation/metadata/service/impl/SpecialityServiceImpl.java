package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.vo.param.SpecialityParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityCodeVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityVO;

@Service
public class SpecialityServiceImpl implements SpecialityService {
	@Autowired
	private SpecialityMapper dao;

	@Override
	public List<SpecialityCodeVO> getSpecialityCode() {
		return dao.getSpecialityCode();
	}

	@Override
	public int setSpeciality(SpecialityParamVO param) {
		return dao.setSpeciality(param);
	}

	@Override
	public int deleteSpeciality(SpecialityParamVO param) {
		return dao.deleteSpeciality(param);
	}

	@Override
	public int updateSpeciality(SpecialityParamVO param) {
		return dao.updateSpeciality(param);
	}

	@Override
	public List<SpecialityVO> getSpecialityData(int speciality_idx) {
		return dao.getSpecialityData(speciality_idx);
	}

	@Override
	public List<SpecialityVO> getSpeciality(SpecialityParamVO param) {
		return dao.getSpeciality(param);
	}

	@Override
	public int getSpecialityCnt(SpecialityParamVO param) {
		return dao.getSpecialityCnt(param);
	}
	
	


}
