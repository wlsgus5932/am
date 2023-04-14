package egovframework.aviation.preferences.vo;

import java.util.Date;
import java.util.List;

public class AccessLogVO {
	private String access_log_idx;
	private String org_code;
	private String org_nm;
	private String member_id;
	private String member_nm;
	private String access_type;
	private String access_ip;
	private String access_date;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	private String start_reg_date;
	private String end_reg_date;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	public String getAccess_log_idx() {
		return access_log_idx;
	}
	public void setAccess_log_idx(String access_log_idx) {
		this.access_log_idx = access_log_idx;
	}
	public String getOrg_code() {
		return org_code;
	}
	public void setOrg_code(String org_code) {
		this.org_code = org_code;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getAccess_type() {
		return access_type;
	}
	public void setAccess_type(String access_type) {
		this.access_type = access_type;
	}
	public String getAccess_ip() {
		return access_ip;
	}
	public void setAccess_ip(String access_ip) {
		this.access_ip = access_ip;
	}
	public String getAccess_date() {
		return access_date;
	}
	public void setAccess_date(String access_date) {
		this.access_date = access_date;
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
	public String getStart_reg_date() {
		return start_reg_date;
	}
	public void setStart_reg_date(String start_reg_date) {
		this.start_reg_date = start_reg_date;
	}
	public String getEnd_reg_date() {
		return end_reg_date;
	}
	public void setEnd_reg_date(String end_reg_date) {
		this.end_reg_date = end_reg_date;
	}
	@Override
	public String toString() {
		return "AccessLogVO [access_log_idx=" + access_log_idx + ", org_code=" + org_code + ", org_nm=" + org_nm
				+ ", member_id=" + member_id + ", member_nm=" + member_nm + ", access_type=" + access_type
				+ ", access_ip=" + access_ip + ", access_date=" + access_date + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", start_reg_date=" + start_reg_date + ", end_reg_date="
				+ end_reg_date + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}

}
