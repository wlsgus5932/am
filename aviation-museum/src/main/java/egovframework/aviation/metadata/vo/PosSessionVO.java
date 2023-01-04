package egovframework.aviation.metadata.vo;

public class PosSessionVO {
	private String possession_code_idx;
	private String org_code_idx;
	private String possession_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	public String getPossession_code_idx() {
		return possession_code_idx;
	}
	public void setPossession_code_idx(String possession_code_idx) {
		this.possession_code_idx = possession_code_idx;
	}
	public String getOrg_code_idx() {
		return org_code_idx;
	}
	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
	}
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
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
		return "PosSessionVO [possession_code_idx=" + possession_code_idx + ", org_code_idx=" + org_code_idx
				+ ", possession_nm=" + possession_nm + ", seq=" + seq + ", enabled=" + enabled + ", reg_user="
				+ reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + "]";
	}
	
	

}
