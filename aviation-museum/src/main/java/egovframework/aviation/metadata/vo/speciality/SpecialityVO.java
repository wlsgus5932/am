package egovframework.aviation.metadata.vo.speciality;

public class SpecialityVO {
	private String rownum;
	private String speciality_idx;
	private String item_idx;
	private String speciality_code_idx;
	private String title;
	private String file_nm;
	private String file_path;
	private String copyright;
	private String content;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String speciality_nm;
	
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
	public String getSpeciality_nm() {
		return speciality_nm;
	}
	public void setSpeciality_nm(String speciality_nm) {
		this.speciality_nm = speciality_nm;
	}
	
	@Override
	public String toString() {
		return "SpecialityVO [speciality_idx=" + speciality_idx + ", item_idx=" + item_idx + ", speciality_code_idx="
				+ speciality_code_idx + ", title=" + title + ", file_nm=" + file_nm + ", file_path=" + file_path
				+ ", copyright=" + copyright + ", content=" + content + ", reg_user=" + reg_user + ", reg_date="
				+ reg_date + ", mod_user=" + mod_user + ", mod_date=" + mod_date + ", speciality_nm=" + speciality_nm
				+ "]";
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
}
