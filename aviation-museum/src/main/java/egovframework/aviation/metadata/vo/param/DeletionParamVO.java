package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Data;

@Data
public class DeletionParamVO {
	private List<String> item_idx;
	private String possession_code_idx;
	private String org_code_idx;
	private String item_no1;
	private String item_no2;
	private String item_detail_no1;
	private String item_detail_no2;
	private String erasure_reason;
	private int pageStart;
	private int perPageNum;
	private List<String> item_no;
	private List<String> item_detail_no;
	private List<String> item_nm;
	private String org_nm;
	private String possession_nm;
	private String aproval_state;
	private String reg_user = "jinhyun";
	
	

}
