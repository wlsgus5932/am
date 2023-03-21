package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Data;

@Data
public class MovementParamVO {
	private String item_idx;
	private List<String> storage_idx;
	private int movement_idx;
	private String storage_type1_code_idx;
	private String storage_type2_code_idx;
	private List<String> storage1_code_idx;
	private List<String> storage2_code_idx;
	private String movement_date;
	private String movement_qty;
	private String current_qty;
	private String requester;
	private String remark;
	private String reg_user = "jjinhyun";
	private String reg_date;
	private int pageStart;
	private int perPageNum = 10;
	
}
