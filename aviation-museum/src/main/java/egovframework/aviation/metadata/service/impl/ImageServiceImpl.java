package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.vo.image.ImageVO;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired ImageMapper dao;

	@Override
	public int setImage(ImageVO list) {
		return dao.setImage(list);
	}

	@Override
	public List<ImageVO> getImage(int item_idx) {
		return dao.getImage(item_idx);
	}

	@Override
	public int setPublicrep(int image_idx, String colunm, String val) {
		return dao.setPublicrep(image_idx, colunm, val);
	}

	@Override
	public int deleteImage(List<String> values) {
		return dao.deleteImage(values);
	}
	

}
