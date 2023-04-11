package egovframework.aviation.mypage.vo;

import java.util.List;

public class InterestVO {
	private String rnum;
	private String interest_idx;
	private String item_idx;
	private String expl;
	private String reg_user;
	private String reg_date;
	
	private String image_nm;
	private String image_path;
	private String thumbnail_nm;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String qty;
	private String possession_nm;
	private String org_code_idx;
	private String reg_state;
	private String possession_code_idx;
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
	public String getInterest_idx() {
		return interest_idx;
	}
	public void setInterest_idx(String interest_idx) {
		this.interest_idx = interest_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getExpl() {
		return expl;
	}
	public void setExpl(String expl) {
		this.expl = expl;
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
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
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
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
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
	public List<String> getGroup_seqList() {
		return group_seqList;
	}
	public void setGroup_seqList(List<String> group_seqList) {
		this.group_seqList = group_seqList;
	}
	public String getOrg_code_idx() {
		return org_code_idx;
	}
	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
	}
	public String getPossession_code_idx() {
		return possession_code_idx;
	}
	public void setPossession_code_idx(String possession_code_idx) {
		this.possession_code_idx = possession_code_idx;
	}
	public String getReg_state() {
		return reg_state;
	}
	public void setReg_state(String reg_state) {
		this.reg_state = reg_state;
	}
	public String getImage_nm() {
		return image_nm;
	}
	public void setImage_nm(String image_nm) {
		this.image_nm = image_nm;
	}
	public String getThumbnail_nm() {
		return thumbnail_nm;
	}
	public void setThumbnail_nm(String thumbnail_nm) {
		this.thumbnail_nm = thumbnail_nm;
	}
	@Override
	public String toString() {
		return "InterestVO [rnum=" + rnum + ", interest_idx=" + interest_idx + ", item_idx=" + item_idx + ", expl="
				+ expl + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", image_nm=" + image_nm
				+ ", image_path=" + image_path + ", thumbnail_nm=" + thumbnail_nm + ", item_no=" + item_no
				+ ", item_detail_no=" + item_detail_no + ", item_nm=" + item_nm + ", qty=" + qty + ", possession_nm="
				+ possession_nm + ", org_code_idx=" + org_code_idx + ", reg_state=" + reg_state
				+ ", possession_code_idx=" + possession_code_idx + ", result=" + result + ", group_seqList="
				+ group_seqList + ", search_word=" + search_word + ", search_type=" + search_type + ", perPageNum="
				+ perPageNum + ", pageStart=" + pageStart + "]";
	}

}
