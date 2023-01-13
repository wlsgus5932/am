package egovframework.aviation.group.vo;

import java.util.Date;
import java.util.List;

public class MenuAuthorityVO {
	private String authority_idx;
	private String group_idx;
	private String menu_code_idx;
	private Date reg_date;
	private List<String> menuAuth_List = null;
	
	public String getAuthority_idx() {
		return authority_idx;
	}
	public void setAuthority_idx(String authority_idx) {
		this.authority_idx = authority_idx;
	}
	public String getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(String group_idx) {
		this.group_idx = group_idx;
	}
	public String getMenu_code_idx() {
		return menu_code_idx;
	}
	public void setMenu_code_idx(String menu_code_idx) {
		this.menu_code_idx = menu_code_idx;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public List<String> getMenuAuth_List() {
		return menuAuth_List;
	}
	public void setMenuAuth_List(List<String> menuAuth_List) {
		this.menuAuth_List = menuAuth_List;
	}
	@Override
	public String toString() {
		return "MenuAuthorityVO [authority_idx=" + authority_idx + ", group_idx=" + group_idx + ", menu_code_idx="
				+ menu_code_idx + ", reg_date=" + reg_date + ", menuAuth_List=" + menuAuth_List + "]";
	}
	
}
