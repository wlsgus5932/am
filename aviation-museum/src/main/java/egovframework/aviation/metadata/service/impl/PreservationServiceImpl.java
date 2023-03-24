package egovframework.aviation.metadata.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.PreservationService;
import egovframework.aviation.metadata.vo.metadata.PreservationImageVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.param.PreservationParamVO;

@Service
public class PreservationServiceImpl implements PreservationService {
	
	@Autowired
	private PreservationMapper dao;
	
	@Override
	public int setPreservation(PreservationParamVO param) {
		return dao.setPreservation(param);
	}

	@Override
	public int setPreservationImage(Map<Integer, Object> map) {
		return dao.setPreservationImage(map);
	}

	@Override
	public List<PreservationVO> getPreservationList(int item_idx) {
		return dao.getPreservationList(item_idx);
	}

	@Override
	public List<PreservationImageVO> getPreservationImageList(String preservation_idx) {
		return dao.getPreservationImageList(preservation_idx);
	}

	@Override
	public int deletePreservationImage(List<String> image_idx) {
		return dao.deletePreservationImage(image_idx);
	}

	@Override
	public int deletePreservation(String preservation_idx) {
		return dao.deletePreservation(preservation_idx);
	}

	@Override
	public int updatePreservation(PreservationParamVO param) {
		return dao.updatePreservation(param);
	}

	@Override
	public int deleteImageAll(String preservation_idx) {
		return dao.deleteImageAll(preservation_idx);
	}

}
