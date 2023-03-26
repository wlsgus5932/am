package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;

@Mapper
public interface ImageMapper {

	int setImage(ImageVO list);

	List<ImageVO> getImage(ImageParamVO param);

	int setPublicrep(@Param("image_idx") int image_idx, @Param("colunm") String colunm, @Param("val") String val);

	int getImageListCnt(String item_idx);

	int deleteImage(ImageParamVO param);

	int updateImageDesc(ImageParamVO param);

	List<ImageVO> getImageIUpdateList(ImageParamVO param);

	int getImageIUpdateListCnt(ImageParamVO param);

	List<ImageVO> getImageExcel(ImageParamVO param);

	List<ImageVO> getImageAll(ImageParamVO param);

	int updateRep(@Param("image_idx") int image_idx, @Param("val") String val);

	int updateNoRep();

}
