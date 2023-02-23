package egovframework.aviation.preferences.vo;

import java.util.Date;
import java.util.List;

public class TagVO {
	private String rnum;
	private String tag_idx;
	private String tag_nm;
	private String seq;
	private String enabled;
	private String reg_user;
	private Date reg_date;
	private String mod_user;
	private Date mod_date;
	private String result;
	private List<String> group_seqList = null;
	
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
	public String getTag_idx() {
		return tag_idx;
	}
	public void setTag_idx(String tag_idx) {
		this.tag_idx = tag_idx;
	}
	public String getTag_nm() {
		return tag_nm;
	}
	public void setTag_nm(String tag_nm) {
		this.tag_nm = tag_nm;
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
	public List<String> getGroup_seqList() {
		return group_seqList;
	}
	public void setGroup_seqList(List<String> group_seqList) {
		this.group_seqList = group_seqList;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "TagVO [rnum=" + rnum + ", tag_idx=" + tag_idx + ", tag_nm=" + tag_nm + ", seq=" + seq + ", enabled="
				+ enabled + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user
				+ ", mod_date=" + mod_date + ", result=" + result + ", group_seqList=" + group_seqList
				+ ", search_word=" + search_word + ", search_type=" + search_type + ", perPageNum=" + perPageNum
				+ ", pageStart=" + pageStart + "]";
	}
	
}
