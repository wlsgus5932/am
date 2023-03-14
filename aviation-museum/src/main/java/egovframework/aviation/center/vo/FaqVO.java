package egovframework.aviation.center.vo;

import java.util.List;

public class FaqVO {
	private String rnum;
	private String faq_idx;
	private String faq_content;
	private int count;
	private String answer_contents;
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
	
	private List<String> faq_seqList = null;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	
	public String getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(String faq_idx) {
		this.faq_idx = faq_idx;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getAnswer_contents() {
		return answer_contents;
	}
	public void setAnswer_contents(String answer_contents) {
		this.answer_contents = answer_contents;
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
	public List<String> getFaq_seqList() {
		return faq_seqList;
	}
	public void setFaq_seqList(List<String> faq_seqList) {
		this.faq_seqList = faq_seqList;
	}
	
	@Override
	public String toString() {
		return "FaqVO [rnum=" + rnum + ", faq_idx=" + faq_idx + ", faq_content=" + faq_content + ", count=" + count
				+ ", answer_contents=" + answer_contents + ", reg_user=" + reg_user + ", reg_date=" + reg_date
				+ ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart
				+ ", faq_seqList=" + faq_seqList + "]";
	}
	
}
