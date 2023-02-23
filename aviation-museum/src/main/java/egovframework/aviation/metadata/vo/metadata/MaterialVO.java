package egovframework.aviation.metadata.vo.metadata;

public class MaterialVO {
	private String material_idx;
	private String item_idx;
	private String material1_code_idx;
	private String material2_code_idx;
	private String material_detail;
	private String reg_user;
	private String reg_date;
	public String getMaterial_idx() {
		return material_idx;
	}
	public void setMaterial_idx(String material_idx) {
		this.material_idx = material_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getMaterial1_code_idx() {
		return material1_code_idx;
	}
	public void setMaterial1_code_idx(String material1_code_idx) {
		this.material1_code_idx = material1_code_idx;
	}
	public String getMaterial2_code_idx() {
		return material2_code_idx;
	}
	public void setMaterial2_code_idx(String material2_code_idx) {
		this.material2_code_idx = material2_code_idx;
	}
	public String getMaterial_detail() {
		return material_detail;
	}
	public void setMaterial_detail(String material_detail) {
		this.material_detail = material_detail;
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
		return "MaterialVO [material_idx=" + material_idx + ", item_idx=" + item_idx + ", material1_code_idx="
				+ material1_code_idx + ", material2_code_idx=" + material2_code_idx + ", material_detail="
				+ material_detail + ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
	

}
