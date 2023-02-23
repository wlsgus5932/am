package egovframework.aviation.metadata.vo;

public class Purchase1VO {
	private String purchase1_code_idx;
	private String purchase1_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	
	public String getPurchase1_code_idx() {
		return purchase1_code_idx;
	}
	public void setPurchase1_code_idx(String purchase1_code_idx) {
		this.purchase1_code_idx = purchase1_code_idx;
	}
	public String getPurchase1_nm() {
		return purchase1_nm;
	}
	public void setPurchase1_nm(String purchase1_nm) {
		this.purchase1_nm = purchase1_nm;
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
		return "Purchase1VO [purchase1_code_idx=" + purchase1_code_idx + ", purchase1_nm=" + purchase1_nm + ", seq="
				+ seq + ", enabled=" + enabled + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user="
				+ mod_user + ", mod_date=" + mod_date + ", updateType=" + updateType + "]";
	}
	
}
