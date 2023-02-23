package egovframework.aviation.metadata.vo.param;

import java.util.List;

public class MovementParamVO {
	private int item_idx;
	private List<String> storage_idx;
	private int movement_idx;
	private String storage_type1_code_idx;
	private String storage_type2_code_idx;
	private List<String> storage1_code_idx;
	private List<String> storage2_code_idx;
	private String movement_date;
	private String movement_qty;
	private String current_qty;
	private String requester;
	private String remark;
	private String reg_user = "jjinhyun";
	private String reg_date;
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
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
	public List<String> getStorage1_code_idx() {
		return storage1_code_idx;
	}
	public void setStorage1_code_idx(List<String> storage1_code_idx) {
		this.storage1_code_idx = storage1_code_idx;
	}
	public List<String> getStorage2_code_idx() {
		return storage2_code_idx;
	}
	public void setStorage2_code_idx(List<String> storage2_code_idx) {
		this.storage2_code_idx = storage2_code_idx;
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
	public List<String> getStorage_idx() {
		return storage_idx;
	}
	public void setStorage_idx(List<String> storage_idx) {
		this.storage_idx = storage_idx;
	}
	public int getMovement_idx() {
		return movement_idx;
	}
	public void setMovement_idx(int movement_idx) {
		this.movement_idx = movement_idx;
	}
	
	@Override
	public String toString() {
		return "MovementParamVO [item_idx=" + item_idx + ", storage_idx=" + storage_idx + ", movement_idx="
				+ movement_idx + ", storage_type1_code_idx=" + storage_type1_code_idx + ", storage_type2_code_idx="
				+ storage_type2_code_idx + ", storage1_code_idx=" + storage1_code_idx + ", storage2_code_idx="
				+ storage2_code_idx + ", movement_date=" + movement_date + ", movement_qty=" + movement_qty
				+ ", current_qty=" + current_qty + ", requester=" + requester + ", remark=" + remark + ", reg_user="
				+ reg_user + ", reg_date=" + reg_date + "]";
	}
}
