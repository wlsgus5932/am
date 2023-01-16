package egovframework.aviation.group.vo;

public class PossessionAuthorityVO {
	private String possession_authority_idx;
	private String group_idx;
	private String possession_code_idx;
	private String org_code_idx;
	private String reg_date;
	public String getPossession_authority_idx() {
		return possession_authority_idx;
	}
	public void setPossession_authority_idx(String possession_authority_idx) {
		this.possession_authority_idx = possession_authority_idx;
	}
	public String getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
	}
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
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "PossessionAuthorityVO [possession_authority_idx=" + possession_authority_idx + ", group_idx="
				+ group_idx + ", possession_code_idx=" + possession_code_idx + ", org_code_idx=" + org_code_idx
				+ ", reg_date=" + reg_date + "]";
	}
	
}
