package egovframework.aviation.metadata.vo.metadata;

import java.util.List;

public class PreservationVO {
	private String preservation_idx;
	private String item_idx;
	private String treatment_org;
	private String processor;
	private String start_date;
	private String end_date;
	private String content;
	private String remark;
	private String file_nm;
	private String file_path;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private List<PreservationImageVO> image;
	
	public String getPreservation_idx() {
		return preservation_idx;
	}
	public void setPreservation_idx(String preservation_idx) {
		this.preservation_idx = preservation_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getTreatment_org() {
		return treatment_org;
	}
	public void setTreatment_org(String treatment_org) {
		this.treatment_org = treatment_org;
	}
	public String getProcessor() {
		return processor;
	}
	public void setProcessor(String processor) {
		this.processor = processor;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
	public List<PreservationImageVO> getImage() {
		return image;
	}
	public void setImage(List<PreservationImageVO> image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "PreservationVO [preservation_idx=" + preservation_idx + ", item_idx=" + item_idx + ", treatment_org="
				+ treatment_org + ", processor=" + processor + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", content=" + content + ", remark=" + remark + ", file_nm=" + file_nm + ", file_path=" + file_path
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user + ", mod_date="
				+ mod_date + ", image=" + image + "]";
	}
	/*
	 * private String preservation_image_idx; private String image_nm; private
	 * String image_path; private String image_state;
	 */
}
