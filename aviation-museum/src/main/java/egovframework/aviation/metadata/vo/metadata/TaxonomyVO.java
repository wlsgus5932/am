package egovframework.aviation.metadata.vo.metadata;

public class TaxonomyVO {
	private String taxonomy_idx;
	private String item_idx;
	private String class1_code_idx;
	private String class2_code_idx;
	private String class3_code_idx;
	private String reg_user;
	private String reg_date;
	
	public String getTaxonomy_idx() {
		return taxonomy_idx;
	}
	public void setTaxonomy_idx(String taxonomy_idx) {
		this.taxonomy_idx = taxonomy_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getClass1_code_idx() {
		return class1_code_idx;
	}
	public void setClass1_code_idx(String class1_code_idx) {
		this.class1_code_idx = class1_code_idx;
	}
	public String getClass2_code_idx() {
		return class2_code_idx;
	}
	public void setClass2_code_idx(String class2_code_idx) {
		this.class2_code_idx = class2_code_idx;
	}
	public String getClass3_code_idx() {
		return class3_code_idx;
	}
	public void setClass3_code_idx(String class3_code_idx) {
		this.class3_code_idx = class3_code_idx;
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
		return "TaxonomyVO [taxonomy_idx=" + taxonomy_idx + ", item_idx=" + item_idx + ", class1_code_idx="
				+ class1_code_idx + ", class2_code_idx=" + class2_code_idx + ", class3_code_idx=" + class3_code_idx
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
}
