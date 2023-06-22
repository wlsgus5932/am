package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Data;

@Data
public class MovementExcelParamVO {
	private int movement_idx;
	private String possession_nm;
	private String item_no;
	private String item_detail_no;
	private String movement_date;
	private String storage_type1_nm;
	private String storage_type2_nm;
	private List<String> storage_in;
	private List<String> storage_out;
//	private String storage_in1;
//	private String storage_in2;
//	private String storage_in3;
//	private String storage_in4;
//	private String storage_in5;
//	private String storage_in6;
	private String movement_qty;
	private String requester;
	private String remark;
	private String reg_user;
//	private String storage_out1;
//	private String storage_out2;
//	private String storage_out3;
//	private String storage_out4;
//	private String storage_out5;
//	private String storage_out6;

}
