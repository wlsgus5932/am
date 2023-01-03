package egovframework.aviation.group.vo;

import java.util.Date;

public class GroupVO {
	private String group_idx;
	private String group_nm;
	private String remark;
	private String admin;
	private Date reg_dt;
	
	public String getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
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
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	@Override
	public String toString() {
		return "GroupVO [group_idx=" + group_idx + ", group_nm=" + group_nm + ", remark=" + remark + ", admin=" + admin
				+ ", reg_dt=" + reg_dt + "]";
	}
	
}
