package egovframework.aviation.statistics.vo;

public class StatisticsMuseumVO {
	private String cnt;
	private String total;
	private String p_cnt;
	private String p_total;
	private String i_cnt;
	
	private String org_nm;
	private String possession_code_idx;
	private String possession_nm;
	private String chk_info;
	private String start_reg_date;
	private String end_reg_date;
	private String start_reg_date2;
	private String end_reg_date2;
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getP_cnt() {
		return p_cnt;
	}
	public void setP_cnt(String p_cnt) {
		this.p_cnt = p_cnt;
	}
	public String getP_total() {
		return p_total;
	}
	public void setP_total(String p_total) {
		this.p_total = p_total;
	}
	public String getI_cnt() {
		return i_cnt;
	}
	public void setI_cnt(String i_cnt) {
		this.i_cnt = i_cnt;
	}
	public String getOrg_nm() {
		return org_nm;
	}
	public void setOrg_nm(String org_nm) {
		this.org_nm = org_nm;
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
	public String getChk_info() {
		return chk_info;
	}
	public void setChk_info(String chk_info) {
		this.chk_info = chk_info;
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
	public String getStart_reg_date2() {
		return start_reg_date2;
	}
	public void setStart_reg_date2(String start_reg_date2) {
		this.start_reg_date2 = start_reg_date2;
	}
	public String getEnd_reg_date2() {
		return end_reg_date2;
	}
	public void setEnd_reg_date2(String end_reg_date2) {
		this.end_reg_date2 = end_reg_date2;
	}
	@Override
	public String toString() {
		return "StatisticsMuseumVO [cnt=" + cnt + ", total=" + total + ", p_cnt=" + p_cnt + ", p_total=" + p_total
				+ ", i_cnt=" + i_cnt + ", org_nm=" + org_nm + ", possession_code_idx=" + possession_code_idx
				+ ", possession_nm=" + possession_nm + ", chk_info=" + chk_info + ", start_reg_date=" + start_reg_date
				+ ", end_reg_date=" + end_reg_date + ", start_reg_date2=" + start_reg_date2 + ", end_reg_date2="
				+ end_reg_date2 + "]";
	}
	
}
