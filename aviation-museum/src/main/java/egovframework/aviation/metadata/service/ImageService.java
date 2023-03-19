package egovframework.aviation.metadata.service;

import java.util.List;

import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;

public interface ImageService {

	int setImage(ImageVO list);

	List<ImageVO> getImage(ImageParamVO param);

	int setPublicrep(int image_idx, String colunm, String val);

	int deleteImage(ImageParamVO param);

	int getImageListCnt(String item_idx);

	int updateImageDesc(ImageParamVO param);

	List<ImageVO> getImageIUpdateList(ImageParamVO param);

	int getImageIUpdateListCnt(ImageParamVO param);

	List<ImageVO> getImageExcel(ImageParamVO param);

	List<ImageVO> getImageAll(ImageParamVO param);

}
