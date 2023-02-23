package egovframework.aviation.metadata.vo;

public class EraVO {
	private String era_code_idx;
	private String country_code_idx;
	private String era_nm;
	private String start_year;
	private String end_year;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	
	public String getEra_code_idx() {
		return era_code_idx;
	}
	public void setEra_code_idx(String era_code_idx) {
		this.era_code_idx = era_code_idx;
	}
	public String getCountry_code_idx() {
		return country_code_idx;
	}
	public void setCountry_code_idx(String country_code_idx) {
		this.country_code_idx = country_code_idx;
	}
	public String getEra_nm() {
		return era_nm;
	}
	public void setEra_nm(String era_nm) {
		this.era_nm = era_nm;
	}
	public String getStart_year() {
		return start_year;
	}
	public void setStart_year(String start_year) {
		this.start_year = start_year;
	}
	public String getEnd_year() {
		return end_year;
	}
	public void setEnd_year(String end_year) {
		this.end_year = end_year;
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
		return "EraVO [era_code_idx=" + era_code_idx + ", country_code_idx=" + country_code_idx + ", era_nm=" + era_nm
				+ ", start_year=" + start_year + ", end_year=" + end_year + ", seq=" + seq + ", enabled=" + enabled
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user + ", mod_date="
				+ mod_date + ", updateType=" + updateType + "]";
	}
	
}
