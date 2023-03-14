package egovframework.aviation.metadata.vo.param;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageParamVO {
	private List<String> image_idx;
	private String item_idx;
	private MultipartFile image_upload_file;
	private int pageStart;
	private int perPageNum = 10;
	private String Image_desc;
	private String item_no1;
	private String item_no2;
	private String item_detail_no1;
	private String item_detail_no2;
	private String possession_code_idx;
	private String org_code_idx;
	private String reg_state;
	
}
