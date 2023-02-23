package egovframework.aviation.metadata.vo.metadata;

public class InvolvementVO {
	private String involvement_idx;
	private String item_idx;
	private String org_code_idx;
	private String possession_code_idx;
	private String item_no;
	private String remark;
	private String reg_user;
	private String reg_date;
	public String getInvolvement_idx() {
		return involvement_idx;
	}
	public void setInvolvement_idx(String involvement_idx) {
		this.involvement_idx = involvement_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getOrg_code_idx() {
		return org_code_idx;
	}
	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
	}
	public String getPossession_code_idx() {
		return possession_code_idx;
	}
	public void setPossession_code_idx(String possession_code_idx) {
		this.possession_code_idx = possession_code_idx;
	}
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
		return "InvolvementVO [involvement_idx=" + involvement_idx + ", item_idx=" + item_idx + ", org_code_idx="
				+ org_code_idx + ", possession_code_idx=" + possession_code_idx + ", item_no=" + item_no + ", remark="
				+ remark + ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
	

}
