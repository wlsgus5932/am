package egovframework.aviation.statistics.vo;

public class StatisticsSpecialityVO {
	private String rnum;
	private String member_nm;
	private String reg_user;
	private String count;
	
	private String org_nm;
	private String possession_nm;
	private String start_item_no;
	private String end_item_no;
	private String start_detail_item_no;
	private String end_detail_item_no;
	private String start_reg_date;
	private String end_reg_date;
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
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
	@Override
	public String toString() {
		return "StatisticsSpecialityVO [rnum=" + rnum + ", member_nm=" + member_nm + ", reg_user=" + reg_user
				+ ", count=" + count + ", org_nm=" + org_nm + ", possession_nm=" + possession_nm + ", start_item_no="
				+ start_item_no + ", end_item_no=" + end_item_no + ", start_detail_item_no=" + start_detail_item_no
				+ ", end_detail_item_no=" + end_detail_item_no + ", start_reg_date=" + start_reg_date
				+ ", end_reg_date=" + end_reg_date + "]";
	}
	
}
