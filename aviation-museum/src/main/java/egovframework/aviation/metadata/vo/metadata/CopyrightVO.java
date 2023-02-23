package egovframework.aviation.metadata.vo.metadata;

public class CopyrightVO {
	private String copyright_idx;
	private String item_idx;
	private String copyright;
	private String owner;
	private String expiry_date;
	private String usage_permission;
	private String copyright_transfer;
	private String remark;
	private String reg_user;
	private String reg_date;
	public String getCopyright_idx() {
		return copyright_idx;
	}
	public void setCopyright_idx(String copyright_idx) {
		this.copyright_idx = copyright_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public String getExpiry_date() {
		return expiry_date;
	}
	public void setExpiry_date(String expiry_date) {
		this.expiry_date = expiry_date;
	}
	public String getUsage_permission() {
		return usage_permission;
	}
	public void setUsage_permission(String usage_permission) {
		this.usage_permission = usage_permission;
	}
	public String getCopyright_transfer() {
		return copyright_transfer;
	}
	public void setCopyright_transfer(String copyright_transfer) {
		this.copyright_transfer = copyright_transfer;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
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
		return "CopyrightVO [copyright_idx=" + copyright_idx + ", item_idx=" + item_idx + ", copyright=" + copyright
				+ ", owner=" + owner + ", expiry_date=" + expiry_date + ", usage_permission=" + usage_permission
				+ ", copyright_transfer=" + copyright_transfer + ", remark=" + remark + ", reg_user=" + reg_user
				+ ", reg_date=" + reg_date + "]";
	}
	
	

}
