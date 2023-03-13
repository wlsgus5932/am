package egovframework.aviation.center.vo;

import java.util.List;

public class NoticeVO {
	private String rnum;
	private String notice_idx;
	private String notice_title;
	private String notice_content;
	private int count;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	private List<String> notice_seqList = null;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	public String getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(String notice_idx) {
		this.notice_idx = notice_idx;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
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
	public List<String> getNotice_seqList() {
		return notice_seqList;
	}
	public void setNotice_seqList(List<String> notice_seqList) {
		this.notice_seqList = notice_seqList;
	}
	@Override
	public String toString() {
		return "UserJoinVO [rnum=" + rnum + ", notice_idx=" + notice_idx + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", count=" + count + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + 
				", notice_seqList=" + notice_seqList + "]";
	}
}
