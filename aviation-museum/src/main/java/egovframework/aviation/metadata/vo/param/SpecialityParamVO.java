package egovframework.aviation.metadata.vo.param;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SpecialityParamVO {
	private String item_idx;
	private String speciality_code_idx;
	private String speciality_idx;
	private String spc_title;
	private String spc_file_nm;
	private String spc_file_path;
	private MultipartFile spc_uploadFile;
	private String spc_copyright;
	private String spc_content;
	private String reg_user;
	private String mod_user;
	private int pageStart;
	private int perPageNum = 10;
	private String speciality_title_search;
	private String speciality_code_idx_search;
}
