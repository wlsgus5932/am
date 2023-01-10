package egovframework.aviation.group.vo;

import java.util.Date;

public class MenuCodeVO {
	private String menu_code_idx;
	private String menu_nm;
	private String menu_pattern;
	private String parent_menu;
	private String pattern_type;
	private String seq;
	private Date reg_date;
	public String getMenu_code_idx() {
		return menu_code_idx;
	}
	public void setMenu_code_idx(String menu_code_idx) {
		this.menu_code_idx = menu_code_idx;
	}
	public String getMenu_nm() {
		return menu_nm;
	}
	public void setMenu_nm(String menu_nm) {
		this.menu_nm = menu_nm;
	}
	public String getMenu_pattern() {
		return menu_pattern;
	}
	public void setMenu_pattern(String menu_pattern) {
		this.menu_pattern = menu_pattern;
	}
	public String getParent_menu() {
		return parent_menu;
	}
	public void setParent_menu(String parent_menu) {
		this.parent_menu = parent_menu;
	}
	public String getPattern_type() {
		return pattern_type;
	}
	public void setPattern_type(String pattern_type) {
		this.pattern_type = pattern_type;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MenuCodeVO [menu_code_idx=" + menu_code_idx + ", menu_nm=" + menu_nm + ", menu_pattern=" + menu_pattern
				+ ", parent_menu=" + parent_menu + ", pattern_type=" + pattern_type + ", seq=" + seq + ", reg_date="
				+ reg_date + "]";
	}
	
}
