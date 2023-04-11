package egovframework.aviation.dashboard.vo;

public class CountryDataVO {
	private String country_nm;
	private String country_count;
	public String getCountry_nm() {
		return country_nm;
	}
	public void setCountry_nm(String country_nm) {
		this.country_nm = country_nm;
	}
	public String getCountry_count() {
		return country_count;
	}
	public void setCountry_count(String country_count) {
		this.country_count = country_count;
	}
	@Override
	public String toString() {
		return "CountryDataVO [country_nm=" + country_nm + ", country_count=" + country_count + "]";
	}
	
}
