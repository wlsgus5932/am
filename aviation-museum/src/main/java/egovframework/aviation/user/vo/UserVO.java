package egovframework.aviation.user.vo;

public class UserVO {
	private String user_id;
	private String user_password;
	private String user_name;
	private String user_authority;
	private String user_enabled;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_authority() {
		return user_authority;
	}
	public void setUser_authority(String user_authority) {
		this.user_authority = user_authority;
	}
	public String getUser_enabled() {
		return user_enabled;
	}
	public void setUser_enabled(String user_enabled) {
		this.user_enabled = user_enabled;
	}
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_name=" + user_name
				+ ", user_authority=" + user_authority + ", user_enabled=" + user_enabled +  "]";
	}
	
	
}
