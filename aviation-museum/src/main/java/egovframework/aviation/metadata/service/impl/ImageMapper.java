package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.image.ImageVO;

@Mapper
public interface ImageMapper {

	int setImage(ImageVO list);

	List<ImageVO> getImage();

	List<ImageVO> getImage(int item_idx);

	int setPublicrep(@Param("image_idx") int image_idx, @Param("colunm") String colunm, @Param("val") String val);

	int deleteImage(@Param("values") List<String> values);

}
