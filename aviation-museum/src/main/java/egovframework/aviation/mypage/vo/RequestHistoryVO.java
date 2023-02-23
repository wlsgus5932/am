package egovframework.aviation.mypage.vo;

import java.util.List;

public class RequestHistoryVO {
	private String rnum;
	private String request_idx;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String org_nm;
	private String possession_nm;
	private String keyword;
	private String approval_state;
	private String refusal_reason;
	private String reg_user;
	private String reg_date;
	private String keyword_list;
	private String erasure_reason;
	
	private String result;
	private List<String> group_seqList = null;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	private String start_date;
	private String end_date;
	private String start_item_no;
	private String end_item_no;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getRequest_idx() {
		return request_idx;
	}
	public void setRequest_idx(String request_idx) {
		this.request_idx = request_idx;
	}
	public String getItem_no() {
		return item_no;
	}
	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}
	public String getItem_detail_no() {
		return item_detail_no;
	}
	public void setItem_detail_no(String item_detail_no) {
		this.item_detail_no = item_detail_no;
	}
	public String getItem_nm() {
		return item_nm;
	}
	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(String approval_state) {
		this.approval_state = approval_state;
	}
	public String getRefusal_reason() {
		return refusal_reason;
	}
	public void setRefusal_reason(String refusal_reason) {
		this.refusal_reason = refusal_reason;
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
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
	public String getKeyword_list() {
		return keyword_list;
	}
	public void setKeyword_list(String keyword_list) {
		this.keyword_list = keyword_list;
	}
	public String getErasure_reason() {
		return erasure_reason;
	}
	public void setErasure_reason(String erasure_reason) {
		this.erasure_reason = erasure_reason;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getStart_item_no() {
		return start_item_no;
	}
	public void setStart_item_no(String start_item_no) {
		this.start_item_no = start_item_no;
	}
	public String getEnd_item_no() {
		return end_item_no;
	}
	public void setEnd_item_no(String end_item_no) {
		this.end_item_no = end_item_no;
	}
	@Override
	public String toString() {
		return "RequestHistoryVO [rnum=" + rnum + ", request_idx=" + request_idx + ", item_no=" + item_no
				+ ", item_detail_no=" + item_detail_no + ", item_nm=" + item_nm + ", org_nm=" + org_nm
				+ ", possession_nm=" + possession_nm + ", keyword=" + keyword + ", approval_state=" + approval_state
				+ ", refusal_reason=" + refusal_reason + ", reg_user=" + reg_user + ", reg_date=" + reg_date
				+ ", keyword_list=" + keyword_list + ", erasure_reason=" + erasure_reason + ", result=" + result
				+ ", group_seqList=" + group_seqList + ", search_word=" + search_word + ", search_type=" + search_type
				+ ", start_date=" + start_date + ", end_date=" + end_date + ", start_item_no=" + start_item_no
				+ ", end_item_no=" + end_item_no + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}


}
