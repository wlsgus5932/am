package egovframework.aviation.metadata.vo;

import lombok.Data;

@Data
public class MeasurementVO {
	
	private String measurement_code_idx;
	private String measurement_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	
}
