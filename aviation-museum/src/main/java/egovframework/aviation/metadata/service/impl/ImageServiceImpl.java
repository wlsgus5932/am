package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;

@Service
public class ImageServiceImpl implements ImageService {
	
	@Autowired ImageMapper dao;

	@Override
	public int setImage(ImageVO list) {
		return dao.setImage(list);
	}

	@Override
	public int setPublicrep(int image_idx, String colunm, String val) {
		return dao.setPublicrep(image_idx, colunm, val);
	}

	@Override
	public int getImageListCnt(String item_idx) {
		// TODO Auto-generated method stub
		return dao.getImageListCnt(item_idx);
	}

	@Override
	public List<ImageVO> getImage(ImageParamVO param) {
		return dao.getImage(param);
	}

	@Override
	public int deleteImage(ImageParamVO param) {
		return dao.deleteImage(param);
	}

	@Override
	public int updateImageDesc(ImageParamVO param) {
		// TODO Auto-generated method stub
		return dao.updateImageDesc(param);
	}

	@Override
	public List<ImageVO> getImageIUpdateList(ImageParamVO param) {
		// TODO Auto-generated method stub
		return dao.getImageIUpdateList(param);
	}

	@Override
	public int getImageIUpdateListCnt(ImageParamVO param) {
		return dao.getImageIUpdateListCnt(param);
	}
	

}
