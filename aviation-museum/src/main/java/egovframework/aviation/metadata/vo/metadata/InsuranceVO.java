package egovframework.aviation.metadata.vo.metadata;

public class InsuranceVO {
	private String insurance_idx;
	private String item_idx;
	private String agreed_value;
	private String price_unit_code_idx;
	private String start_date;
	private String end_date;
	private String rental_org;
	private String remark;
	private String reg_user;
	private String reg_date;
	public String getInsurance_idx() {
		return insurance_idx;
	}
	public void setInsurance_idx(String insurance_idx) {
		this.insurance_idx = insurance_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getAgreed_value() {
		return agreed_value;
	}
	public void setAgreed_value(String agreed_value) {
		this.agreed_value = agreed_value;
	}
	public String getPrice_unit_code_idx() {
		return price_unit_code_idx;
	}
	public void setPrice_unit_code_idx(String price_unit_code_idx) {
		this.price_unit_code_idx = price_unit_code_idx;
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
	public String getRental_org() {
		return rental_org;
	}
	public void setRental_org(String rental_org) {
		this.rental_org = rental_org;
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
		return "InsuranceVO [insurance_idx=" + insurance_idx + ", item_idx=" + item_idx + ", agreed_value="
				+ agreed_value + ", price_unit_code_idx=" + price_unit_code_idx + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", rental_org=" + rental_org + ", remark=" + remark + ", reg_user="
				+ reg_user + ", reg_date=" + reg_date + "]";
	}
	
	

}
