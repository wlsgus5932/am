package egovframework.aviation.fixedform.vo;

public class DataCardBackVO {
	private String rnum;
	private String item_idx;
	private String movement_year;
	private String movement_month;
	private String movement_day;
	private String qty;
	private String storage_type2_nm;
	private String storage_type1_nm;
	private String storage_nm;
	private String current_qty;
	private String item_no;
	private String item_detail_no;
	
	private String org_nm;
	private String possession_nm;
	private String start_item_no;
	private String end_item_no;
	private String start_detail_item_no;
	private String end_detail_item_no;
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
	public String getMovement_year() {
		return movement_year;
	}
	public void setMovement_year(String movement_year) {
		this.movement_year = movement_year;
	}
	public String getMovement_month() {
		return movement_month;
	}
	public void setMovement_month(String movement_month) {
		this.movement_month = movement_month;
	}
	public String getMovement_day() {
		return movement_day;
	}
	public void setMovement_day(String movement_day) {
		this.movement_day = movement_day;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getStorage_type2_nm() {
		return storage_type2_nm;
	}
	public void setStorage_type2_nm(String storage_type2_nm) {
		this.storage_type2_nm = storage_type2_nm;
	}
	public String getStorage_type1_nm() {
		return storage_type1_nm;
	}
	public void setStorage_type1_nm(String storage_type1_nm) {
		this.storage_type1_nm = storage_type1_nm;
	}
	public String getStorage_nm() {
		return storage_nm;
	}
	public void setStorage_nm(String storage_nm) {
		this.storage_nm = storage_nm;
	}
	public String getCurrent_qty() {
		return current_qty;
	}
	public void setCurrent_qty(String current_qty) {
		this.current_qty = current_qty;
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
	public String getStart_detail_item_no() {
		return start_detail_item_no;
	}
	public void setStart_detail_item_no(String start_detail_item_no) {
		this.start_detail_item_no = start_detail_item_no;
	}
	public String getEnd_detail_item_no() {
		return end_detail_item_no;
	}
	public void setEnd_detail_item_no(String end_detail_item_no) {
		this.end_detail_item_no = end_detail_item_no;
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
	@Override
	public String toString() {
		return "DataCardBackVO [rnum=" + rnum + ", item_idx=" + item_idx + ", movement_year=" + movement_year
				+ ", movement_month=" + movement_month + ", movement_day=" + movement_day + ", qty=" + qty
				+ ", storage_type2_nm=" + storage_type2_nm + ", storage_type1_nm=" + storage_type1_nm + ", storage_nm="
				+ storage_nm + ", current_qty=" + current_qty + ", item_no=" + item_no + ", item_detail_no="
				+ item_detail_no + ", org_nm=" + org_nm + ", possession_nm=" + possession_nm + ", start_item_no="
				+ start_item_no + ", end_item_no=" + end_item_no + ", start_detail_item_no=" + start_detail_item_no
				+ ", end_detail_item_no=" + end_detail_item_no + "]";
	}

}
