package egovframework.aviation.metadata.vo;

public class QtyUnitVO {
	private String qty_unit_code_idx;
	private String qty_unit_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	
	public String getQty_unit_code_idx() {
		return qty_unit_code_idx;
	}
	public void setQty_unit_code_idx(String qty_unit_code_idx) {
		this.qty_unit_code_idx = qty_unit_code_idx;
	}
	public String getQty_unit_nm() {
		return qty_unit_nm;
	}
	public void setQty_unit_nm(String qty_unit_nm) {
		this.qty_unit_nm = qty_unit_nm;
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
		return "QtyUnitVO [qty_unit_code_idx=" + qty_unit_code_idx + ", qty_unit_nm=" + qty_unit_nm + ", seq=" + seq
				+ ", enabled=" + enabled + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user="
				+ mod_user + ", mod_date=" + mod_date + ", updateType=" + updateType + "]";
	}

}
