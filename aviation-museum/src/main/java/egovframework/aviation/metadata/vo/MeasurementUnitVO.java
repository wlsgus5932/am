package egovframework.aviation.metadata.vo;

public class MeasurementUnitVO {
	private String measurement_unit_code_idx;
	private String measurement_unit_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	public String getMeasurement_unit_code_idx() {
		return measurement_unit_code_idx;
	}
	public void setMeasurement_unit_code_idx(String measurement_unit_code_idx) {
		this.measurement_unit_code_idx = measurement_unit_code_idx;
	}
	public String getMeasurement_unit_nm() {
		return measurement_unit_nm;
	}
	public void setMeasurement_unit_nm(String measurement_unit_nm) {
		this.measurement_unit_nm = measurement_unit_nm;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
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
	public String getMod_user() {
		return mod_user;
	}
	public void setMod_user(String mod_user) {
		this.mod_user = mod_user;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	
	@Override
	public String toString() {
		return "MeasurementUnitVO [measurement_unit_code_idx=" + measurement_unit_code_idx + ", measurement_unit_nm="
				+ measurement_unit_nm + ", seq=" + seq + ", enabled=" + enabled + ", reg_user=" + reg_user
				+ ", reg_date=" + reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + "]";
	}
}
