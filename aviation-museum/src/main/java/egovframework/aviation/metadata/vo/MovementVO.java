package egovframework.aviation.metadata.vo;

public class MovementVO {
	private String rownum;
	private String movement_idx;
	private String item_idx;
	private String storage_in;
	private String storage_out;
	private String storage_in_code_idx;
	private String storage_out_code_idx;
	private String storage_type1_code_idx;
	private String storage_type2_code_idx;
	private String movement_date;
	private String movement_qty;
	private String current_qty;
	private String requester;
	private String remark;
	private String reg_user;
	private String reg_date;
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getMovement_idx() {
		return movement_idx;
	}
	public void setMovement_idx(String movement_idx) {
		this.movement_idx = movement_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getStorage_in() {
		return storage_in;
	}
	public void setStorage_in(String storage_in) {
		this.storage_in = storage_in;
	}
	public String getStorage_out() {
		return storage_out;
	}
	public void setStorage_out(String storage_out) {
		this.storage_out = storage_out;
	}
	public String getStorage_in_code_idx() {
		return storage_in_code_idx;
	}
	public void setStorage_in_code_idx(String storage_in_code_idx) {
		this.storage_in_code_idx = storage_in_code_idx;
	}
	public String getStorage_out_code_idx() {
		return storage_out_code_idx;
	}
	public void setStorage_out_code_idx(String storage_out_code_idx) {
		this.storage_out_code_idx = storage_out_code_idx;
	}
	public String getStorage_type1_code_idx() {
		return storage_type1_code_idx;
	}
	public void setStorage_type1_code_idx(String storage_type1_code_idx) {
		this.storage_type1_code_idx = storage_type1_code_idx;
	}
	public String getStorage_type2_code_idx() {
		return storage_type2_code_idx;
	}
	public void setStorage_type2_code_idx(String storage_type2_code_idx) {
		this.storage_type2_code_idx = storage_type2_code_idx;
	}
	public String getMovement_date() {
		return movement_date;
	}
	public void setMovement_date(String movement_date) {
		this.movement_date = movement_date;
	}
	public String getMovement_qty() {
		return movement_qty;
	}
	public void setMovement_qty(String movement_qty) {
		this.movement_qty = movement_qty;
	}
	public String getCurrent_qty() {
		return current_qty;
	}
	public void setCurrent_qty(String current_qty) {
		this.current_qty = current_qty;
	}
	public String getRequester() {
		return requester;
	}
	public void setRequester(String requester) {
		this.requester = requester;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	
	@Override
	public String toString() {
		return "MovementVO [rownum=" + rownum + ", movement_idx=" + movement_idx + ", item_idx=" + item_idx
				+ ", storage_in=" + storage_in + ", storage_out=" + storage_out + ", storage_in_code_idx="
				+ storage_in_code_idx + ", storage_out_code_idx=" + storage_out_code_idx + ", storage_type1_code_idx="
				+ storage_type1_code_idx + ", storage_type2_code_idx=" + storage_type2_code_idx + ", movement_date="
				+ movement_date + ", movement_qty=" + movement_qty + ", current_qty=" + current_qty + ", requester="
				+ requester + ", remark=" + remark + ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
}
