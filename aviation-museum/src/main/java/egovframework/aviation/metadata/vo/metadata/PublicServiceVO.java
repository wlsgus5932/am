package egovframework.aviation.metadata.vo.metadata;

public class PublicServiceVO {
	private String public_service_idx;
	private String item_idx;
	private String public_service;
	private String reason;
	private String ggnuri_code_idx;
	public String getPublic_service_idx() {
		return public_service_idx;
	}
	public void setPublic_service_idx(String public_service_idx) {
		this.public_service_idx = public_service_idx;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getPublic_service() {
		return public_service;
	}
	public void setPublic_service(String public_service) {
		this.public_service = public_service;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getGgnuri_code_idx() {
		return ggnuri_code_idx;
	}
	public void setGgnuri_code_idx(String ggnuri_code_idx) {
		this.ggnuri_code_idx = ggnuri_code_idx;
	}
	@Override
	public String toString() {
		return "PublicServiceVO [public_service_idx=" + public_service_idx + ", item_idx=" + item_idx
				+ ", public_service=" + public_service + ", reason=" + reason + ", ggnuri_code_idx=" + ggnuri_code_idx
				+ "]";
	}
	
	

}
