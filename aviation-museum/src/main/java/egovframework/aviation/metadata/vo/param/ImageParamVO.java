package egovframework.aviation.metadata.vo.param;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ImageParamVO {
	private String item_idx;
	private MultipartFile image_upload_file;

	
	public String getItem_idx() {
		return item_idx;
	}

	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}

	public MultipartFile getImage_upload_file() {
		return image_upload_file;
	}

	public void setImage_upload_file(MultipartFile image_upload_file) {
		this.image_upload_file = image_upload_file;
	}

	@Override
	public String toString() {
		return "ImageParamVO [item_idx=" + item_idx + ", image_upload_file=" + image_upload_file + "]";
	}
	
	
	
	
}
