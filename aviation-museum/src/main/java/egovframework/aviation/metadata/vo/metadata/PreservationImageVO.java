package egovframework.aviation.metadata.vo.metadata;

public class PreservationImageVO {
	private String preservation_image_idx;
	private String preservation_idx;
	private String image_nm;
	private String image_path;
	private String image_state;
	private String reg_user;
	private String reg_date;
	
	public String getPreservation_image_idx() {
		return preservation_image_idx;
	}
	public void setPreservation_image_idx(String preservation_image_idx) {
		this.preservation_image_idx = preservation_image_idx;
	}
	public String getPreservation_idx() {
		return preservation_idx;
	}
	public void setPreservation_idx(String preservation_idx) {
		this.preservation_idx = preservation_idx;
	}
	public String getImage_nm() {
		return image_nm;
	}
	public void setImage_nm(String image_nm) {
		this.image_nm = image_nm;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getImage_state() {
		return image_state;
	}
	public void setImage_state(String image_state) {
		this.image_state = image_state;
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
		return "PreservationImageVO [preservation_image_idx=" + preservation_image_idx + ", preservation_idx="
				+ preservation_idx + ", image_nm=" + image_nm + ", image_path=" + image_path + ", image_state="
				+ image_state + ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
}
