package egovframework.aviation.metadata.vo.metadata;

public class MeasurementVO {
	private String measurement_idx;
	private String item_idx;
	private String measurement_code_idx;
	private String measurement_unit_code_idx;
	private String item_type;
	private String measurement_value;
	private String reg_user;
	private String reg_date;
	public String getMeasurement_idx() {
		return measurement_idx;
	}
	public void setMeasurement_idx(String measurement_idx) {
		this.measurement_idx = measurement_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getMeasurement_code_idx() {
		return measurement_code_idx;
	}
	public void setMeasurement_code_idx(String measurement_code_idx) {
		this.measurement_code_idx = measurement_code_idx;
	}
	public String getMeasurement_unit_code_idx() {
		return measurement_unit_code_idx;
	}
	public void setMeasurement_unit_code_idx(String measurement_unit_code_idx) {
		this.measurement_unit_code_idx = measurement_unit_code_idx;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getMeasurement_value() {
		return measurement_value;
	}
	public void setMeasurement_value(String measurement_value) {
		this.measurement_value = measurement_value;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MeasurementVO [measurement_idx=" + measurement_idx + ", item_idx=" + item_idx
				+ ", measurement_code_idx=" + measurement_code_idx + ", measurement_unit_code_idx="
				+ measurement_unit_code_idx + ", item_type=" + item_type + ", measurement_value=" + measurement_value
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
	

}
