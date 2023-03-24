package egovframework.aviation.metadata.vo;

import java.util.List;

public class MetaDataSearchVO {
	private String rnum;
	private String item_idx;
	private String prev;
	private String next;
	private String image_idx;
	private String image_nm;
	private String image_path;
	private String org_code_idx;
	private String possession_code_idx;
	private String possession_nm;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String item_se_nm;
	private String item_eng_nm;
	private String author;
	private String qty;
	private String qty_unit_code_idx;
	private String icao_code_idx;
	private String icao_nm;
	private String existence_code_idx;
	private String management_no;
	private String preservation_need;
	private String feature;
	private String condition_code_idx;
	private String ranking_code_idx;
	private String remark;
	private String reg_state;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String country_nm;
	private String storage_nm;
	private String measurement_value;
	private String class1_nm;
	private String class2_nm;
	private String class3_nm;
	private String current_qty;
	/* 검색필드 */
	private String search_word;
	private String search_type;
	private String search_type2;
	private String search_type3;
	private String research_word;
	private String searched_word;
	private String search_range;
	private String detail_search_word1;
	private String detail_search_word2;
	private String detail_search_word3;
	private String pSrchfAndOr1;
	private String pSrchfAndOr2;
	private String start_item_no;
	private String end_item_no;
	private List<String> country;
	private List<String> material1;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getImage_idx() {
		return image_idx;
	}
	public void setImage_idx(String image_idx) {
		this.image_idx = image_idx;
	}
	public String getPrev() {
		return prev;
	}
	public void setPrev(String prev) {
		this.prev = prev;
	}
	public String getNext() {
		return next;
	}
	public void setNext(String next) {
		this.next = next;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
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
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
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
	public String getItem_se_nm() {
		return item_se_nm;
	}
	public void setItem_se_nm(String item_se_nm) {
		this.item_se_nm = item_se_nm;
	}
	public String getItem_eng_nm() {
		return item_eng_nm;
	}
	public void setItem_eng_nm(String item_eng_nm) {
		this.item_eng_nm = item_eng_nm;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getQty_unit_code_idx() {
		return qty_unit_code_idx;
	}
	public void setQty_unit_code_idx(String qty_unit_code_idx) {
		this.qty_unit_code_idx = qty_unit_code_idx;
	}
	public String getIcao_code_idx() {
		return icao_code_idx;
	}
	public void setIcao_code_idx(String icao_code_idx) {
		this.icao_code_idx = icao_code_idx;
	}
	public String getIcao_nm() {
		return icao_nm;
	}
	public void setIcao_nm(String icao_nm) {
		this.icao_nm = icao_nm;
	}
	public String getExistence_code_idx() {
		return existence_code_idx;
	}
	public void setExistence_code_idx(String existence_code_idx) {
		this.existence_code_idx = existence_code_idx;
	}
	public String getManagement_no() {
		return management_no;
	}
	public void setManagement_no(String management_no) {
		this.management_no = management_no;
	}
	public String getPreservation_need() {
		return preservation_need;
	}
	public void setPreservation_need(String preservation_need) {
		this.preservation_need = preservation_need;
	}
	public String getFeature() {
		return feature;
	}
	public void setFeature(String feature) {
		this.feature = feature;
	}
	public String getCondition_code_idx() {
		return condition_code_idx;
	}
	public void setCondition_code_idx(String condition_code_idx) {
		this.condition_code_idx = condition_code_idx;
	}
	public String getRanking_code_idx() {
		return ranking_code_idx;
	}
	public void setRanking_code_idx(String ranking_code_idx) {
		this.ranking_code_idx = ranking_code_idx;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getReg_state() {
		return reg_state;
	}
	public void setReg_state(String reg_state) {
		this.reg_state = reg_state;
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
	public String getCountry_nm() {
		return country_nm;
	}
	public void setCountry_nm(String country_nm) {
		this.country_nm = country_nm;
	}
	public String getStorage_nm() {
		return storage_nm;
	}
	public void setStorage_nm(String storage_nm) {
		this.storage_nm = storage_nm;
	}
	public String getMeasurement_value() {
		return measurement_value;
	}
	public void setMeasurement_value(String measurement_value) {
		this.measurement_value = measurement_value;
	}
	public String getClass1_nm() {
		return class1_nm;
	}
	public void setClass1_nm(String class1_nm) {
		this.class1_nm = class1_nm;
	}
	public String getClass2_nm() {
		return class2_nm;
	}
	public void setClass2_nm(String class2_nm) {
		this.class2_nm = class2_nm;
	}
	public String getClass3_nm() {
		return class3_nm;
	}
	public void setClass3_nm(String class3_nm) {
		this.class3_nm = class3_nm;
	}
	public String getResearch_word() {
		return research_word;
	}
	public void setResearch_word(String research_word) {
		this.research_word = research_word;
	}
	public String getSearched_word() {
		return searched_word;
	}
	public void setSearched_word(String searched_word) {
		this.searched_word = searched_word;
	}
	public String getSearch_type2() {
		return search_type2;
	}
	public void setSearch_type2(String search_type2) {
		this.search_type2 = search_type2;
	}
	public String getSearch_type3() {
		return search_type3;
	}
	public void setSearch_type3(String search_type3) {
		this.search_type3 = search_type3;
	}
	public String getDetail_search_word1() {
		return detail_search_word1;
	}
	public void setDetail_search_word1(String detail_search_word1) {
		this.detail_search_word1 = detail_search_word1;
	}
	public String getDetail_search_word2() {
		return detail_search_word2;
	}
	public void setDetail_search_word2(String detail_search_word2) {
		this.detail_search_word2 = detail_search_word2;
	}
	public String getDetail_search_word3() {
		return detail_search_word3;
	}
	public void setDetail_search_word3(String detail_search_word3) {
		this.detail_search_word3 = detail_search_word3;
	}
	public String getSearch_range() {
		return search_range;
	}
	public void setSearch_range(String search_range) {
		this.search_range = search_range;
	}
	public String getpSrchfAndOr1() {
		return pSrchfAndOr1;
	}
	public void setpSrchfAndOr1(String pSrchfAndOr1) {
		this.pSrchfAndOr1 = pSrchfAndOr1;
	}
	public String getpSrchfAndOr2() {
		return pSrchfAndOr2;
	}
	public void setpSrchfAndOr2(String pSrchfAndOr2) {
		this.pSrchfAndOr2 = pSrchfAndOr2;
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
	public List<String> getCountry() {
		return country;
	}
	public void setCountry(List<String> country) {
		this.country = country;
	}
	public List<String> getMaterial1() {
		return material1;
	}
	public void setMaterial1(List<String> material1) {
		this.material1 = material1;
	}
	public String getCurrent_qty() {
		return current_qty;
	}
	public void setCurrent_qty(String current_qty) {
		this.current_qty = current_qty;
	}
	public String getImage_nm() {
		return image_nm;
	}
	public void setImage_nm(String image_nm) {
		this.image_nm = image_nm;
	}
	@Override
	public String toString() {
		return "MetaDataSearchVO [rnum=" + rnum + ", item_idx=" + item_idx + ", prev=" + prev + ", next=" + next
				+ ", image_idx=" + image_idx + ", image_nm=" + image_nm + ", image_path=" + image_path
				+ ", org_code_idx=" + org_code_idx + ", possession_code_idx=" + possession_code_idx + ", possession_nm="
				+ possession_nm + ", item_no=" + item_no + ", item_detail_no=" + item_detail_no + ", item_nm=" + item_nm
				+ ", item_se_nm=" + item_se_nm + ", item_eng_nm=" + item_eng_nm + ", author=" + author + ", qty=" + qty
				+ ", qty_unit_code_idx=" + qty_unit_code_idx + ", icao_code_idx=" + icao_code_idx + ", icao_nm="
				+ icao_nm + ", existence_code_idx=" + existence_code_idx + ", management_no=" + management_no
				+ ", preservation_need=" + preservation_need + ", feature=" + feature + ", condition_code_idx="
				+ condition_code_idx + ", ranking_code_idx=" + ranking_code_idx + ", remark=" + remark + ", reg_state="
				+ reg_state + ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user
				+ ", mod_date=" + mod_date + ", country_nm=" + country_nm + ", storage_nm=" + storage_nm
				+ ", measurement_value=" + measurement_value + ", class1_nm=" + class1_nm + ", class2_nm=" + class2_nm
				+ ", class3_nm=" + class3_nm + ", current_qty=" + current_qty + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", search_type2=" + search_type2 + ", search_type3=" + search_type3
				+ ", research_word=" + research_word + ", searched_word=" + searched_word + ", search_range="
				+ search_range + ", detail_search_word1=" + detail_search_word1 + ", detail_search_word2="
				+ detail_search_word2 + ", detail_search_word3=" + detail_search_word3 + ", pSrchfAndOr1="
				+ pSrchfAndOr1 + ", pSrchfAndOr2=" + pSrchfAndOr2 + ", start_item_no=" + start_item_no
				+ ", end_item_no=" + end_item_no + ", country=" + country + ", material1=" + material1 + ", perPageNum="
				+ perPageNum + ", pageStart=" + pageStart + "]";
	}

}
