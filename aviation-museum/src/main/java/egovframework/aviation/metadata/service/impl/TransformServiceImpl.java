package egovframework.aviation.metadata.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.TransformService;
import egovframework.aviation.metadata.vo.metadata.TransformVO;
import egovframework.aviation.metadata.vo.param.TransformParamVO;

@Service
public class TransformServiceImpl implements TransformService {
	
	@Autowired
	TransformMapper dao;

	@Override
	public List<TransformVO> getTransformList(TransformParamVO param) {
		return dao.getTransformList(param);
	}

	@Override
	public int getTransformListCnt(TransformParamVO param) {
		return dao.getTransformListCnt(param);
	}

	@Override
	public int changeTransformReg(TransformParamVO param) {
		return dao.changeTransformReg(param);
	}

	@Override
	public List<TransformVO> getTransformAllList(TransformParamVO param) {
		return dao.getTransformAllList(param);
	}

}
