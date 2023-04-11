package egovframework.aviation.dashboard.vo;

public class Class1DataVO {
	private String class1_nm;
	private String class1_count;
	public String getClass1_nm() {
		return class1_nm;
	}
	public void setClass1_nm(String class1_nm) {
		this.class1_nm = class1_nm;
	}
	public String getClass1_count() {
		return class1_count;
	}
	public void setClass1_count(String class1_count) {
		this.class1_count = class1_count;
	}
	@Override
	public String toString() {
		return "Class1DataVO [class1_nm=" + class1_nm + ", class1_count=" + class1_count + "]";
	}
	
}
