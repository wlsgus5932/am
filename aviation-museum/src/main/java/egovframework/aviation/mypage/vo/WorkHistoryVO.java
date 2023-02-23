package egovframework.aviation.mypage.vo;

public class WorkHistoryVO {
	private String rnum;
	private String work_history_idx;
	private String item_idx;
	private String org_nm;
	private String possession_nm;
	private String work_nm;
	private String item_nm;
	private String item_no;
	private String item_detail_no;
	private String reg_user;
	private String reg_date;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getWork_history_idx() {
		return work_history_idx;
	}
	public void setWork_history_idx(String work_history_idx) {
		this.work_history_idx = work_history_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
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
	public String getWork_nm() {
		return work_nm;
	}
	public void setWork_nm(String work_nm) {
		this.work_nm = work_nm;
	}
	public String getItem_nm() {
		return item_nm;
	}
	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
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
		return "WorkHistoryVO [rnum=" + rnum + ", work_history_idx=" + work_history_idx + ", item_idx=" + item_idx
				+ ", org_nm=" + org_nm + ", possession_nm=" + possession_nm + ", work_nm=" + work_nm + ", item_nm="
				+ item_nm + ", item_no=" + item_no + ", item_detail_no=" + item_detail_no + ", reg_user=" + reg_user
				+ ", reg_date=" + reg_date + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}

}
