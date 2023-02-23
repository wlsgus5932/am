package egovframework.aviation.metadata.service;

import java.util.List;

import egovframework.aviation.metadata.vo.image.ImageVO;

public interface ImageService {

	int setImage(ImageVO list);

	List<ImageVO> getImage(int item_idx);

	int setPublicrep(int image_idx, String colunm, String val);

	int deleteImage(List<String> values);

}
