package egovframework.aviation.metadata.vo.image;

public class ImageVO {
	private String rownum;
	private String item_idx;
	private String image_idx;
	private String image_nm;
	private String orignl_nm;
	private String thumbnail_nm;
	private String image_path;
	private int image_width;
	private int image_height;
	private String rep_image;
	private long file_size;
	private String public_service;
	private String reg_user = "jinhyun";
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getImage_idx() {
		return image_idx;
	}
	public void setImage_idx(String image_idx) {
		this.image_idx = image_idx;
	}
	public String getImage_nm() {
		return image_nm;
	}
	public void setImage_nm(String image_nm) {
		this.image_nm = image_nm;
	}
	public String getOrignl_nm() {
		return orignl_nm;
	}
	public void setOrignl_nm(String orignl_nm) {
		this.orignl_nm = orignl_nm;
	}
	public String getThumbnail_nm() {
		return thumbnail_nm;
	}
	public void setThumbnail_nm(String thumbnail_nm) {
		this.thumbnail_nm = thumbnail_nm;
	}
	public String getImage_path() {
		return image_path;
	}
	public void setImage_path(String image_path) {
		this.image_path = image_path;
	}
	public int getImage_width() {
		return image_width;
	}
	public void setImage_width(int image_width) {
		this.image_width = image_width;
	}
	public int getImage_height() {
		return image_height;
	}
	public void setImage_height(int image_height) {
		this.image_height = image_height;
	}
	public String getRep_image() {
		return rep_image;
	}
	public void setRep_image(String rep_image) {
		this.rep_image = rep_image;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size2) {
		this.file_size = file_size2;
	}
	public String getPublic_service() {
		return public_service;
	}
	public void setPublic_service(String public_service) {
		this.public_service = public_service;
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
	
	@Override
	public String toString() {
		return "ImageVO [item_idx=" + item_idx + ", image_idx=" + image_idx + ", image_nm=" + image_nm + ", orignl_nm="
				+ orignl_nm + ", thumbnail_nm=" + thumbnail_nm + ", image_path=" + image_path + ", image_width="
				+ image_width + ", image_height=" + image_height + ", rep_image=" + rep_image + ", file_size="
				+ file_size + ", public_service=" + public_service + ", reg_user=" + reg_user + ", reg_date=" + reg_date
				+ ", mod_user=" + mod_user + ", mod_date=" + mod_date + "]";
	}
	
}
