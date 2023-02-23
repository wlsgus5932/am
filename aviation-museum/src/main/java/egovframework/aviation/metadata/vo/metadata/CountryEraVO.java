package egovframework.aviation.metadata.vo.metadata;

public class CountryEraVO {
	private String country_era_idx;
	private String item_idx;
	private String country_code_idx;
	private String era_code_idx;
	private String detail_year;
	private String reg_user;
	private String reg_date;
	
	public String getCountry_era_idx() {
		return country_era_idx;
	}
	public void setCountry_era_idx(String country_era_idx) {
		this.country_era_idx = country_era_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getCountry_code_idx() {
		return country_code_idx;
	}
	public void setCountry_code_idx(String country_code_idx) {
		this.country_code_idx = country_code_idx;
	}
	public String getEra_code_idx() {
		return era_code_idx;
	}
	public void setEra_code_idx(String era_code_idx) {
		this.era_code_idx = era_code_idx;
	}
	public String getDetail_year() {
		return detail_year;
	}
	public void setDetail_year(String detail_year) {
		this.detail_year = detail_year;
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
		return "CountryEraVO [country_era_idx=" + country_era_idx + ", item_idx=" + item_idx + ", country_code_idx="
				+ country_code_idx + ", era_code_idx=" + era_code_idx + ", detail_year=" + detail_year + ", reg_user="
				+ reg_user + ", reg_date=" + reg_date + "]";
	}
	
}
