package egovframework.aviation.dashboard.vo;

public class RegStateDataVO {
	private String reg_state;
	private String reg_state_count;
	public String getReg_state() {
		return reg_state;
	}
	public void setReg_state(String reg_state) {
		this.reg_state = reg_state;
	}
	public String getReg_state_count() {
		return reg_state_count;
	}
	public void setReg_state_count(String reg_state_count) {
		this.reg_state_count = reg_state_count;
	}
	@Override
	public String toString() {
		return "RegStateDataVO [reg_state=" + reg_state + ", reg_state_count=" + reg_state_count + "]";
	}

}
