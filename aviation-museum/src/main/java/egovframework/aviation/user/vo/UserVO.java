package egovframework.aviation.user.vo;

import java.util.Date;
import java.util.List;

public class UserVO {
	private String member_idx;
	private String member_id;
	private int org_code_idx;
	private String group_idx;
	private String member_pw;
	private String member_nm;
	private String remark;
	private String reg_user;
	private Date reg_date;
	private String mod_user;
	private Date mod_date;
	private String enabled;
	private List<String> user_seqList = null;
	private List<UserVO> user_infor = null;
	public String getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(String member_idx) {
		this.member_idx = member_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getOrg_code_idx() {
		return org_code_idx;
	}
	public void setOrg_code_idx(int org_code_idx) {
		this.org_code_idx = org_code_idx;
	}
	public String getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_user() {
		return mod_user;
	}
	public void setMod_user(String mod_user) {
		this.mod_user = mod_user;
	}
	public Date getMod_date() {
		return mod_date;
	}
	public void setMod_date(Date mod_date) {
		this.mod_date = mod_date;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	public List<String> getUser_seqList() {
		return user_seqList;
	}
	public void setUser_seqList(List<String> user_seqList) {
		this.user_seqList = user_seqList;
	}
	
	public List<UserVO> getUser_infor() {
		return user_infor;
	}
	public void setUser_infor(List<UserVO> userInfor) {
		this.user_infor = userInfor;
	}
	@Override
	public String toString() {
		return "UserVO [member_idx=" + member_idx + ", member_id=" + member_id + ", org_code_idx=" + org_code_idx
				+ ", group_idx=" + group_idx + ", member_pw=" + member_pw + ", member_nm=" + member_nm + ", remark="
				+ remark + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user
				+ ", mod_date=" + mod_date + ", enabled=" + enabled + ", user_seqList=" + user_seqList + ", user_infor="
				+ user_infor + "]";
	}
	
}
