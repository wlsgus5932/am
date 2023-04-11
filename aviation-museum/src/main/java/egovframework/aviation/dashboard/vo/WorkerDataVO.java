package egovframework.aviation.dashboard.vo;

public class WorkerDataVO {
	private String member_nm;
	private String year;
	private String month;
	private String week;
	private String day;
	public String getMember_nm() {
		return member_nm;
	}
	public void setMember_nm(String member_nm) {
		this.member_nm = member_nm;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Override
	public String toString() {
		return "WorkerDataVO [member_nm=" + member_nm + ", year=" + year + ", month=" + month + ", week=" + week
				+ ", day=" + day + "]";
	}

}
