package egovframework.aviation.user.vo;

import java.util.Date;

public class UserJoinVO {
	private String rnum;
	private String member_idx;
	private String member_id;
	private int org_code_idx;
	private int group_idx;
	private String member_pw;
	private String member_nm;
	private String remark;
	private String reg_user;
	private Date reg_date;
	private String mod_user;
	private Date mod_date;
	private String enabled;
	private String group_nm;
	private String admin;
	private String result;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
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
	public int getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(int group_idx) {
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
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return pageStart;
	}
	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}
	@Override
	public String toString() {
		return "UserJoinVO [rnum=" + rnum + ", member_idx=" + member_idx + ", member_id=" + member_id
				+ ", org_code_idx=" + org_code_idx + ", group_idx=" + group_idx + ", member_pw=" + member_pw
				+ ", member_nm=" + member_nm + ", remark=" + remark + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", enabled=" + enabled
				+ ", group_nm=" + group_nm + ", admin=" + admin + ", result=" + result + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}

}
