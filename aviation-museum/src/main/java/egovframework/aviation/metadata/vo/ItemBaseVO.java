package egovframework.aviation.metadata.vo;

public class ItemBaseVO {
	private String item_idx;
	private String org_code_idx;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String item_se_nm;
	private String item_eng_nm;
	private String author;
	private String qty;
	private String qty_unit_code_idx;
	private String icao_code_idx;
	private String Existence_code_idx;
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
	
	public String getItem_idx() {
		return item_idx;
	}



	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}



	public String getOrg_code_idx() {
		return org_code_idx;
	}



	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
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



	public String getExistence_code_idx() {
		return Existence_code_idx;
	}



	public void setExistence_code_idx(String existence_code_idx) {
		Existence_code_idx = existence_code_idx;
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

	@Override
	public String toString() {
		return "ItemBaseVO [item_idx=" + item_idx + ", org_code_idx=" + org_code_idx + ", item_no=" + item_no
				+ ", item_detail_no=" + item_detail_no + ", item_nm=" + item_nm + ", item_se_nm=" + item_se_nm
				+ ", item_eng_nm=" + item_eng_nm + ", author=" + author + ", qty=" + qty + ", qty_unit_code_idx="
				+ qty_unit_code_idx + ", icao_code_idx=" + icao_code_idx + ", Existence_code_idx=" + Existence_code_idx
				+ ", management_no=" + management_no + ", preservation_need=" + preservation_need + ", feature="
				+ feature + ", condition_code_idx=" + condition_code_idx + ", ranking_code_idx=" + ranking_code_idx
				+ ", remark=" + remark + ", reg_state=" + reg_state + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
