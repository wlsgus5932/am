package egovframework.aviation.metadata.service.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.metadata.TransformVO;
import egovframework.aviation.metadata.vo.param.TransformParamVO;

@Mapper
public interface TransformMapper {

	List<TransformVO> getTransformList(TransformParamVO param);

	int getTransformListCnt(TransformParamVO param);

	int changeTransformReg(TransformParamVO param);

	int changeTransformReg(String item_idx, String reg_state);

	List<TransformVO> getTransformAllList(TransformParamVO param);

}
