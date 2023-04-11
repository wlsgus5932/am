package egovframework.aviation.dashboard.vo;

public class RentalVO {
	private String item_idx;
	private String item_nm;
	private String month;
	private String day;
	private String qty_sum;
	private String qty_unit_nm;
	private String org_nm;
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getItem_nm() {
		return item_nm;
	}
	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getQty_sum() {
		return qty_sum;
	}
	public void setQty_sum(String qty_sum) {
		this.qty_sum = qty_sum;
	}
	public String getQty_unit_nm() {
		return qty_unit_nm;
	}
	public void setQty_unit_nm(String qty_unit_nm) {
		this.qty_unit_nm = qty_unit_nm;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
	}
	@Override
	public String toString() {
		return "RentalVO [item_idx=" + item_idx + ", item_nm=" + item_nm + ", month=" + month + ", day=" + day
				+ ", qty_sum=" + qty_sum + ", qty_unit_nm=" + qty_unit_nm + ", org_nm=" + org_nm + "]";
	}
	
}
