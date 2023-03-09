package egovframework.aviation.metadata.service;

import java.util.HashMap;
import java.util.List;

import egovframework.aviation.metadata.vo.metadata.TransformVO;
import egovframework.aviation.metadata.vo.param.TransformParamVO;

public interface TransformService {

	List<TransformVO> getTransformList(TransformParamVO param);

	int getTransformListCnt(TransformParamVO param);

	int changeTransformReg(TransformParamVO param);

	List<TransformVO> getTransformAllList(TransformParamVO param);

}
