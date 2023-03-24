package egovframework.aviation.metadata.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import egovframework.aviation.metadata.vo.metadata.PreservationImageVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.param.PreservationParamVO;

public interface PreservationService {

	int setPreservation(PreservationParamVO param);
	int setPreservationImage(Map<Integer, Object> map);
	List<PreservationVO> getPreservationList(int item_idx);
	List<PreservationImageVO> getPreservationImageList(String preservation_idx);
	int deletePreservationImage(List<String> image_idx);
	int deletePreservation(String preservation_idx);
	int updatePreservation(PreservationParamVO param);
	int deleteImageAll(String preservation_idx);

}
