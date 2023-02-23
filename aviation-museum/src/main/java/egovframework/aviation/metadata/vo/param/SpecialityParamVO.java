package egovframework.aviation.metadata.vo.param;

import org.springframework.web.multipart.MultipartFile;

public class SpecialityParamVO {
	private String item_idx;
	private String speciality_code_idx;
	private String speciality_idx;
	private String spc_title;
	private String spc_file_nm;
	private String spc_file_path;
	private MultipartFile spc_uploadFile;
	private String spc_copyright;
	private String spc_content;
	private String reg_user = "jinhyun";
	private String mod_user = "jinhyun2";
	
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
	public String getSpc_title() {
		return spc_title;
	}
	public void setSpc_title(String spc_title) {
		this.spc_title = spc_title;
	}
	public String getSpc_file_nm() {
		return spc_file_nm;
	}
	public void setSpc_file_nm(String spc_file_nm) {
		this.spc_file_nm = spc_file_nm;
	}
	public String getSpc_file_path() {
		return spc_file_path;
	}
	public void setSpc_file_path(String spc_file_path) {
		this.spc_file_path = spc_file_path;
	}
	public MultipartFile getSpc_uploadFile() {
		return spc_uploadFile;
	}
	public void setSpc_uploadFile(MultipartFile spc_uploadFile) {
		this.spc_uploadFile = spc_uploadFile;
	}
	public String getSpc_copyright() {
		return spc_copyright;
	}
	public void setSpc_copyright(String spc_copyright) {
		this.spc_copyright = spc_copyright;
	}
	public String getSpc_content() {
		return spc_content;
	}
	public void setSpc_content(String spc_content) {
		this.spc_content = spc_content;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getMod_user() {
		return mod_user;
	}
	public void setMod_user(String mod_user) {
		this.mod_user = mod_user;
	}
	public String getSpeciality_idx() {
		return speciality_idx;
	}
	public void setSpeciality_idx(String speciality_idx) {
		this.speciality_idx = speciality_idx;
	}
	
	@Override
	public String toString() {
		return "SpecialityParamVO [item_idx=" + item_idx + ", speciality_code_idx=" + speciality_code_idx
				+ ", speciality_idx=" + speciality_idx + ", spc_title=" + spc_title + ", spc_file_nm=" + spc_file_nm
				+ ", spc_file_path=" + spc_file_path + ", spc_uploadFile=" + spc_uploadFile + ", spc_copyright="
				+ spc_copyright + ", spc_content=" + spc_content + ", reg_user=" + reg_user + ", mod_user=" + mod_user
				+ "]";
	}
}
