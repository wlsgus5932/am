package egovframework.aviation.dashboard.vo;

public class Material1DataVO {
	private String material1_nm;
	private String material1_count;
	public String getMaterial1_nm() {
		return material1_nm;
	}
	public void setMaterial1_nm(String material1_nm) {
		this.material1_nm = material1_nm;
	}
	public String getMaterial1_count() {
		return material1_count;
	}
	public void setMaterial1_count(String material1_count) {
		this.material1_count = material1_count;
	}
	@Override
	public String toString() {
		return "Material1DataVO [material1_nm=" + material1_nm + ", material1_count=" + material1_count + "]";
	}

}
