package egovframework.aviation.metadata.vo.metadata;

import java.util.List;

import lombok.Data;

@Data
public class PreservationVO {
	private String preservation_idx;
	private String item_idx;
	private String treatment_org;
	private String processor;
	private String start_date;
	private String end_date;
	private String content;
	private String remark;
	private String file_nm;
	private String file_path;
	private String file_local_path;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private List<PreservationImageVO> image;
	
	
}
