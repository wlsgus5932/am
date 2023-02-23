package egovframework.aviation.preferences.vo;

public class SpecialityVO {

	private String speciality_code_idx;
	private String speciality_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	
	public String getSpeciality_code_idx() {
		return speciality_code_idx;
	}
	public void setSpeciality_code_idx(String speciality_code_idx) {
		this.speciality_code_idx = speciality_code_idx;
	}
	public String getSpeciality_nm() {
		return speciality_nm;
	}
	public void setSpeciality_nm(String speciality_nm) {
		this.speciality_nm = speciality_nm;
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
	public String getUpdateType() {
		return updateType;
	}
	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}
	@Override
	public String toString() {
		return "SpecialityVO [speciality_code_idx=" + speciality_code_idx + ", speciality_nm=" + speciality_nm
				+ ", seq=" + seq + ", enabled=" + enabled + ", reg_user=" + reg_user + ", reg_date=" + reg_date
				+ ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", updateType=" + updateType + "]";
	}

}
