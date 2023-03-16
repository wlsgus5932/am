package egovframework.aviation.center.vo;

import java.util.List;

public class ErrorFixVO {
	private String rnum;
	private String error_fix_idx;
	private String error_fix_title;
	private String error_fix_content;
	private String error_fix_org_nm;
	private String board_type;
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
	
	private List<String> error_fix_seqList = null;

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public String getError_fix_idx() {
		return error_fix_idx;
	}

	public void setError_fix_idx(String error_fix_idx) {
		this.error_fix_idx = error_fix_idx;
	}

	public String getError_fix_title() {
		return error_fix_title;
	}

	public void setError_fix_title(String error_fix_title) {
		this.error_fix_title = error_fix_title;
	}

	public String getError_fix_content() {
		return error_fix_content;
	}

	public void setError_fix_content(String error_fix_content) {
		this.error_fix_content = error_fix_content;
	}

	public String getError_fix_org_nm() {
		return error_fix_org_nm;
	}

	public void setError_fix_org_nm(String error_fix_org_nm) {
		this.error_fix_org_nm = error_fix_org_nm;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
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

	public List<String> getError_fix_seqList() {
		return error_fix_seqList;
	}

	public void setError_fix_seqList(List<String> error_fix_seqList) {
		this.error_fix_seqList = error_fix_seqList;
	}

	@Override
	public String toString() {
		return "ErrorFixVO [rnum=" + rnum + ", error_fix_idx=" + error_fix_idx + ", error_fix_title=" + error_fix_title
				+ ", error_fix_content=" + error_fix_content + ", error_fix_org_nm=" + error_fix_org_nm
				+ ", board_type=" + board_type + ", count=" + count + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart
				+ ", error_fix_seqList=" + error_fix_seqList + "]";
	}
	
}
