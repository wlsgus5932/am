package egovframework.aviation.metadata.vo.metadata;

import lombok.Data;

@Data
public class InsuranceVO {
	private String insurance_idx;
	private String item_idx;
	private String agreed_value;
	private String price_unit_code_idx;
	private String start_date;
	private String end_date;
	private String rental_org;
	private String remark;
	private String reg_user;
	private String reg_date;
	private String price_unit_nm;
}
