package egovframework.aviation.metadata.vo.param;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PreservationParamVO {
	private String item_idx;
	private int preservation_idx;
	private String treatment_org;
	private String processor;
	private String start_date;
	private String end_date;
	private String content;
	private String remark;
	private String file_nm;
	private MultipartFile result_uploadFile;
	private List<MultipartFile> before_uploadFile;
	private List<MultipartFile> after_uploadFile;
	private String file_path;
	private String file_local_path;
	private String reg_user;
	private String mod_user;
	
	private List<String> image_nm;
	private List<String> image_path;
	private List<String> image_state;
}
