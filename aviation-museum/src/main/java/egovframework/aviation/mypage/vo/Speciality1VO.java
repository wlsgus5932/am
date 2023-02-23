package egovframework.aviation.mypage.vo;

public class Speciality1VO {
	private String rnum;
	private String speciality_idx;
	private String item_idx;
	private String speciality_code_idx;
	private String title;
	private String file_nm;
	private String file_path;
	private String copyright;
	private String content;
	private String possession_nm;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String qty;
	private String speciality_nm;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	
	/* 페이징   */
	private int perPageNum;
	private int pageStart;
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getSpeciality_idx() {
		return speciality_idx;
	}
	public void setSpeciality_idx(String speciality_idx) {
		this.speciality_idx = speciality_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getSpeciality_code_idx() {
		return speciality_code_idx;
	}
	public void setSpeciality_code_idx(String speciality_code_idx) {
		this.speciality_code_idx = speciality_code_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFile_nm() {
		return file_nm;
	}
	public void setFile_nm(String file_nm) {
		this.file_nm = file_nm;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
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
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getSpeciality_nm() {
		return speciality_nm;
	}
	public void setSpeciality_nm(String speciality_nm) {
		this.speciality_nm = speciality_nm;
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
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
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
		return "Speciality1VO [rnum=" + rnum + ", speciality_idx=" + speciality_idx + ", item_idx=" + item_idx
				+ ", speciality_code_idx=" + speciality_code_idx + ", title=" + title + ", file_nm=" + file_nm
				+ ", file_path=" + file_path + ", copyright=" + copyright + ", content=" + content + ", possession_nm="
				+ possession_nm + ", item_no=" + item_no + ", item_detail_no=" + item_detail_no + ", item_nm=" + item_nm
				+ ", qty=" + qty + ", speciality_nm=" + speciality_nm + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", search_word=" + search_word
				+ ", search_type=" + search_type + ", perPageNum=" + perPageNum + ", pageStart=" + pageStart + "]";
	}
	
}
