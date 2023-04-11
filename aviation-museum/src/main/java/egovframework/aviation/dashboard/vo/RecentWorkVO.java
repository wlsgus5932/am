package egovframework.aviation.dashboard.vo;

public class RecentWorkVO {
	private String item_nm;
	private String item_no;
	private String work_nm;
	private String image_path;
	private String thumbnail_nm;
	private String reg_user;
	private String possession_nm;
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
	public String getWork_nm() {
		return work_nm;
	}
	public void setWork_nm(String work_nm) {
		this.work_nm = work_nm;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public String getThumbnail_nm() {
		return thumbnail_nm;
	}
	public void setThumbnail_nm(String thumbnail_nm) {
		this.thumbnail_nm = thumbnail_nm;
	}
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getPossession_nm() {
		return possession_nm;
	}
	public void setPossession_nm(String possession_nm) {
		this.possession_nm = possession_nm;
	}
	@Override
	public String toString() {
		return "RecentWorkVO [item_nm=" + item_nm + ", item_no=" + item_no + ", work_nm=" + work_nm + ", image_path="
				+ image_path + ", thumbnail_nm=" + thumbnail_nm + ", reg_user=" + reg_user + ", possession_nm="
				+ possession_nm + "]";
	}

}
