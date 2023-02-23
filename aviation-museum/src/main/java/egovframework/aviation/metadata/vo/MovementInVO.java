package egovframework.aviation.metadata.vo;

public class MovementInVO {
	
	private String nmMovement_idx;
	private String nsMovement_idx;
	private String storage_idx;
	private String storage_type;
	private String storage_code_idx;
	private String storage_code_out_idx;
	private String storage_nm;
	private String storage_out_nm;
	private String reg_date;
	private String movement_date;
	private String storage_type1_code_idx;
	private String storage_type2_code_idx;
	private String movement_qty;
	private String current_qty;
	private String requester;
	private String remark;
	private String reg_user;
	private String storage_in_code;
	private String num;
	
	public String getNmMovement_idx() {
		return nmMovement_idx;
	}
	public void setNmMovement_idx(String nmMovement_idx) {
		this.nmMovement_idx = nmMovement_idx;
	}
	public String getNsMovement_idx() {
		return nsMovement_idx;
	}
	public void setNsMovement_idx(String nsMovement_idx) {
		this.nsMovement_idx = nsMovement_idx;
	}
	public String getStorage_type() {
		return storage_type;
	}
	public void setStorage_type(String storage_type) {
		this.storage_type = storage_type;
	}
	public String getStorage_code_idx() {
		return storage_code_idx;
	}
	public void setStorage_code_idx(String storage_code_idx) {
		this.storage_code_idx = storage_code_idx;
	}
	public String getStorage_nm() {
		return storage_nm;
	}
	public void setStorage_nm(String storage_nm) {
		this.storage_nm = storage_nm;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMovement_date() {
		return movement_date;
	}
	public void setMovement_date(String movement_date) {
		this.movement_date = movement_date;
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
	public String getStorage_out_nm() {
		return storage_out_nm;
	}
	public void setStorage_out_nm(String storage_out_nm) {
		this.storage_out_nm = storage_out_nm;
	}
	public String getStorage_code_out_idx() {
		return storage_code_out_idx;
	}
	public void setStorage_code_out_idx(String storage_code_out_idx) {
		this.storage_code_out_idx = storage_code_out_idx;
	}
	public String getStorage_idx() {
		return storage_idx;
	}
	public void setStorage_idx(String storage_idx) {
		this.storage_idx = storage_idx;
	}
	public String getStorage_in_code() {
		return storage_in_code;
	}
	public void setStorage_in_code(String storage_in_code) {
		this.storage_in_code = storage_in_code;
	}
	
	@Override
	public String toString() {
		return "MovementInVO [nmMovement_idx=" + nmMovement_idx + ", nsMovement_idx=" + nsMovement_idx
				+ ", storage_idx=" + storage_idx + ", storage_type=" + storage_type + ", storage_code_idx="
				+ storage_code_idx + ", storage_code_out_idx=" + storage_code_out_idx + ", storage_nm=" + storage_nm
				+ ", storage_out_nm=" + storage_out_nm + ", reg_date=" + reg_date + ", movement_date=" + movement_date
				+ ", storage_type1_code_idx=" + storage_type1_code_idx + ", storage_type2_code_idx="
				+ storage_type2_code_idx + ", movement_qty=" + movement_qty + ", current_qty=" + current_qty
				+ ", requester=" + requester + ", remark=" + remark + ", reg_user=" + reg_user + ", storage_in_code="
				+ storage_in_code + "]";
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
}
