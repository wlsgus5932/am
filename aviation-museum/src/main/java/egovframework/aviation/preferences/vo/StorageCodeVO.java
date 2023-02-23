package egovframework.aviation.preferences.vo;

import java.util.List;

public class StorageCodeVO {
	private String storage_code_idx;
	private String parent_code;
	private String storage_nm;
	private String seq;
	private String enabled;
	private String path;
	private String lvl;
	private String reg_user;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String updateType;
	private List<StorageCodeVO> storageCodeViewList = null;
	
	/* 검색필드 */
	private String search_word;
	private String search_type;
	
	public String getStorage_code_idx() {
		return storage_code_idx;
	}
	public void setStorage_code_idx(String storage_code_idx) {
		this.storage_code_idx = storage_code_idx;
	}
	public String getParent_code() {
		return parent_code;
	}
	public void setParent_code(String parent_code) {
		this.parent_code = parent_code;
	}
	public String getStorage_nm() {
		return storage_nm;
	}
	public void setStorage_nm(String storage_nm) {
		this.storage_nm = storage_nm;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getEnabled() {
		return enabled;
	}
	public void setEnabled(String enabled) {
		this.enabled = enabled;
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
	public String getMod_user() {
		return mod_user;
	}
	public void setMod_user(String mod_user) {
		this.mod_user = mod_user;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	
	public List<StorageCodeVO> getStorageCodeViewList() {
		return storageCodeViewList;
	}
	public void setStorageCodeViewList(List<StorageCodeVO> storageCodeViewList) {
		this.storageCodeViewList = storageCodeViewList;
	}
	
	public String getSearch_word() {
		return search_word;
	}
	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getUpdateType() {
		return updateType;
	}
	public void setUpdateType(String updateType) {
		this.updateType = updateType;
	}
	@Override
	public String toString() {
		return "StorageCodeVO [storage_code_idx=" + storage_code_idx + ", parent_code=" + parent_code + ", storage_nm="
				+ storage_nm + ", seq=" + seq + ", enabled=" + enabled + ", path=" + path + ", lvl=" + lvl
				+ ", reg_user=" + reg_user + ", reg_date=" + reg_date + ", mod_user=" + mod_user + ", mod_date="
				+ mod_date + ", updateType=" + updateType + ", storageCodeViewList=" + storageCodeViewList
				+ ", search_word=" + search_word + ", search_type=" + search_type + "]";
	}

}
