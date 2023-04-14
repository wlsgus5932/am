package egovframework.aviation.preferences.vo;

import java.util.Date;
import java.util.List;

public class MovementDetailLogVO {
	private String movement_detail_idx;
	private String item_idx;
	private String old_data;
	private String new_data;
	private String org_code;
	private String org_nm;
	private String possession_code;
	private String possession_nm;
	private String item_no;
	private String item_detail_no;
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
	public String getMovement_detail_idx() {
		return movement_detail_idx;
	}
	public void setMovement_detail_idx(String movement_detail_idx) {
		this.movement_detail_idx = movement_detail_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getOld_data() {
		return old_data;
	}
	public void setOld_data(String old_data) {
		this.old_data = old_data;
	}
	public String getNew_data() {
		return new_data;
	}
	public void setNew_data(String new_data) {
		this.new_data = new_data;
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
	public String getPossession_code() {
		return possession_code;
	}
	public void setPossession_code(String possession_code) {
		this.possession_code = possession_code;
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
		return "MovementDetailLogVO [movement_detail_idx=" + movement_detail_idx + ", item_idx=" + item_idx
				+ ", old_data=" + old_data + ", new_data=" + new_data + ", org_code=" + org_code + ", org_nm=" + org_nm
				+ ", possession_code=" + possession_code + ", possession_nm=" + possession_nm + ", item_no=" + item_no
				+ ", item_detail_no=" + item_detail_no + ", member_id=" + member_id + ", member_nm=" + member_nm
				+ ", access_type=" + access_type + ", access_ip=" + access_ip + ", access_date=" + access_date
				+ ", search_word=" + search_word + ", search_type=" + search_type + ", start_reg_date=" + start_reg_date
				+ ", end_reg_date=" + end_reg_date + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}
	
}
