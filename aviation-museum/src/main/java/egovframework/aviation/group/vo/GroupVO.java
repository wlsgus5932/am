package egovframework.aviation.group.vo;

import java.util.Date;
import java.util.List;

public class GroupVO {
	private String group_idx;
	private String org_code_idx;
	private String group_nm;
	private String remark;
	private String admin;
	private Date reg_date;
	private List<String> group_seqList = null;
	public String getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
	}
	public String getOrg_code_idx() {
		return org_code_idx;
	}
	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
	}
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public List<String> getGroup_seqList() {
		return group_seqList;
	}
	public void setGroup_seqList(List<String> group_seqList) {
		this.group_seqList = group_seqList;
	}
	@Override
	public String toString() {
		return "GroupVO [group_idx=" + group_idx + ", org_code_idx=" + org_code_idx + ", group_nm=" + group_nm
				+ ", remark=" + remark + ", admin=" + admin + ", reg_date=" + reg_date + ", group_seqList="
				+ group_seqList + "]";
	}

}
