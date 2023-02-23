package egovframework.aviation.metadata.vo.metadata;

public class KeywordVO {
	private String keyword_idx;
	private String item_idx;
	private String keyword;
	private String reg_user;
	private String reg_date;
	public String getKeyword_idx() {
		return keyword_idx;
	}
	public void setKeyword_idx(String keyword_idx) {
		this.keyword_idx = keyword_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
		return "KeywordVO [keyword_idx=" + keyword_idx + ", item_idx=" + item_idx + ", keyword=" + keyword
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + "]";
	}
	
	

}
