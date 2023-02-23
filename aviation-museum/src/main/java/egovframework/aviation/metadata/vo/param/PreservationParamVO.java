package egovframework.aviation.metadata.vo.param;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class PreservationParamVO {
	private String item_idx;
	private int preservation_idx;
	private String treatment_org;
	private String processor;
	private String start_date;
	private String end_date;
	private String content;
	private String remark;
	private String file_nm;
	private MultipartFile result_uploadFile;
	private List<MultipartFile> before_uploadFile;
	private List<MultipartFile> after_uploadFile;
	private String file_path;
	private String reg_user = "jinhyun";
	
	private List<String> image_nm;
	private List<String> image_path;
	private List<String> image_state;
	
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
	public MultipartFile getResult_uploadFile() {
		return result_uploadFile;
	}
	public void setResult_uploadFile(MultipartFile result_uploadFile) {
		this.result_uploadFile = result_uploadFile;
	}
	public List<MultipartFile> getBefore_uploadFile() {
		return before_uploadFile;
	}
	public void setBefore_uploadFile(List<MultipartFile> before_uploadFile) {
		this.before_uploadFile = before_uploadFile;
	}
	public List<MultipartFile> getAfter_uploadFile() {
		return after_uploadFile;
	}
	public void setAfter_uploadFile(List<MultipartFile> after_uploadFile) {
		this.after_uploadFile = after_uploadFile;
	}
	public int getPreservation_idx() {
		return preservation_idx;
	}
	public void setPreservation_idx(int preservation_idx) {
		this.preservation_idx = preservation_idx;
	}
	public List<String> getImage_nm() {
		return image_nm;
	}
	public void setImage_nm(List<String> image_nm) {
		this.image_nm = image_nm;
	}
	public List<String> getImage_path() {
		return image_path;
	}
	public void setImage_path(List<String> image_path) {
		this.image_path = image_path;
	}
	public List<String> getImage_state() {
		return image_state;
	}
	public void setImage_state(List<String> image_state) {
		this.image_state = image_state;
	}
	
	@Override
	public String toString() {
		return "PreservationParamVO [item_idx=" + item_idx + ", preservation_idx=" + preservation_idx
				+ ", treatment_org=" + treatment_org + ", processor=" + processor + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", content=" + content + ", remark=" + remark + ", file_nm=" + file_nm
				+ ", result_uploadFile=" + result_uploadFile + ", before_uploadFile=" + before_uploadFile
				+ ", after_uploadFile=" + after_uploadFile + ", file_path=" + file_path + ", reg_user=" + reg_user
				+ ", image_nm=" + image_nm + ", image_path=" + image_path + ", image_state=" + image_state + "]";
	}
}
