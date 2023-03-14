package egovframework.aviation.metadata.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.metadata.PreservationImageVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.param.PreservationParamVO;

@Mapper
public interface PreservationMapper {

	int setPreservation(PreservationParamVO param);

	int setPreservationImage(@Param("map") Map<Integer, Object> map);

	List<PreservationVO> getPreservationList(int item_idx);

	List<PreservationImageVO> getPreservationImageList(String preservation_idx);

	int deletePreservationImage(@Param("image_idx") List<String> image_idx);

	int deletePreservation(String preservation_idx);

}
