package egovframework.aviation.metadata.vo.param;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MetaDataParamVO {
	private int item_idx;
	private String reg_user = "admin";
	
	//기본사항 html 테이블
	private String org_code_idx;
	private String possession_code_idx;
	private String item_no;
	private String item_detail_no;
	private String item_nm;
	private String item_se_nm;
	private String item_eng_nm;
	private String author;
	private String qty;
	private String qty_unit_code_idx;
	private String icao_code_idx;
	private String existence_code_idx;
	private String management_no;
	private String preservation_need;
	private String feature;
	private String condition_code_idx;
	private String ranking_code_idx;
	private String remark;
	private String reg_state;
	private String reg_date;
	private String mod_user;
	private String mod_date;
	
	//분류체계 html 테이블 - taxonomy
	private List<String> class1_code_idx;
	private List<String> class2_code_idx;
	private List<String> class3_code_idx;
	
	//국적 html 테이블 - country
	private List<String> country_code_idx;
	private List<String> era_code_idx;
	private List<String> detail_year;
	
	//재질 html 테이블 - material
	private List<String> material1_code_idx; // 재질분류1코드값
	private List<String> material2_code_idx; //재질분류2코드값
	private List<String> material_detail;//재질상세
	
	//크기 html 테이블 - measurement
	private List<String> measurement_code_idx; //실측부위코드값
	private List<String> measurement_unit_code_idx; //실측단위코드값
	private List<String> measurement_value; //실측치
	private List<String> measurement_item_type; //자료구분

	//입수정보 html 테이블 - obtainment
	private String obt_obtainment_date; //입수일자
	private String obt_obtainment_code_idx; //입수연유
	private String obt_purchase1_code_idx; //구입구분1
	private String obt_purchase2_code_idx;//구입구분2
	private String obt_obtainment_price; //가격
	private String obt_price_unit_code_idx; //가격단위
	private String obt_won_exchange; //원화환산
	private String obt_obtainment_no; //일괄구입번호
	private String obt_obtainment_place; //입수처
	private String obt_obtainment_addr; //입수주소
	private String obt_obtainment_detail;//입수내용
	private String obt_record_date;//등록일자
	private String obt_designation;//문화재지정여부
	private String obt_redemption;//문화재환수여부
	private String obt_country_code_idx;//문화재국적코드
	private String obt_qty; //문화재환수수량
	private String obt_qty_unit_code_idx; //문화재환수수량단위
	private String obt_redemption_date; //문화재환수연도
	
	//관련자료 html 테이블 - involvement
	private List<String> invol_org_code_idx; //기관코드 키값
	private List<String> invol_possession_code_idx; //소장구분 키값
	private List<String> invol_item_no; //자료번호
	private List<String> invol_remark; //비고
	
	//보험정보 html 테이블 - insurance
	private List<String> insu_agreed_value;//평가액
	private List<String> insu_price_unit_code_idx;//가격단위코드키값
	private List<String> insu_start_date; //대여시작일
	private List<String> insu_end_date; //대여종료일
	private List<String> insu_rental_org;//대여기관
	private List<String> insu_remark; //비고
	
	//저작권 html 테이블 - copyright
	private List<String> copy_copyright;//저작권여부
	private List<String> copy_owner;//저작권소유자
	private List<String> copy_expiry_date;//저작권만료일자
	private List<String> copy_usage_permission;//이용허락여부
	private List<String> copy_copyright_transfer;//저작권양도여부
	private List<String> copy_remark;//비고
	
	//대국민서비스 html 테이블 - ggnuri
	private String public_service; //대국민서비스여부
	private String reason; //서비스불가사유
	private String ggnuri_code_idx; //공공누리코드키값
	
	//키워드 html 테이블 - keyword
	private String keyword; //키워드
	
	@Override
	public String toString() {
		return "MetaDataParamVO [item_idx=" + item_idx + ", reg_user=" + reg_user + ", org_code_idx=" + org_code_idx
				+ ", possession_code_idx=" + possession_code_idx + ", item_no=" + item_no + ", item_detail_no="
				+ item_detail_no + ", item_nm=" + item_nm + ", item_se_nm=" + item_se_nm + ", item_eng_nm="
				+ item_eng_nm + ", author=" + author + ", qty=" + qty + ", qty_unit_code_idx=" + qty_unit_code_idx
				+ ", icao_code_idx=" + icao_code_idx + ", existence_code_idx=" + existence_code_idx + ", management_no="
				+ management_no + ", preservation_need=" + preservation_need + ", feature=" + feature
				+ ", condition_code_idx=" + condition_code_idx + ", ranking_code_idx=" + ranking_code_idx + ", remark="
				+ remark + ", reg_state=" + reg_state + ", reg_date=" + reg_date + ", mod_user=" + mod_user
				+ ", mod_date=" + mod_date + ", class1_code_idx=" + class1_code_idx + ", class2_code_idx="
				+ class2_code_idx + ", class3_code_idx=" + class3_code_idx + ", country_code_idx=" + country_code_idx
				+ ", era_code_idx=" + era_code_idx + ", detail_year=" + detail_year + ", material1_code_idx="
				+ material1_code_idx + ", material2_code_idx=" + material2_code_idx + ", material_detail="
				+ material_detail + ", measurement_code_idx=" + measurement_code_idx + ", measurement_unit_code_idx="
				+ measurement_unit_code_idx + ", measurement_value=" + measurement_value + ", measurement_item_type="
				+ measurement_item_type + ", obt_obtainment_date=" + obt_obtainment_date + ", obt_obtainment_code_idx="
				+ obt_obtainment_code_idx + ", obt_purchase1_code_idx=" + obt_purchase1_code_idx
				+ ", obt_purchase2_code_idx=" + obt_purchase2_code_idx + ", obt_obtainment_price="
				+ obt_obtainment_price + ", obt_price_unit_code_idx=" + obt_price_unit_code_idx + ", obt_won_exchange="
				+ obt_won_exchange + ", obt_obtainment_no=" + obt_obtainment_no + ", obt_obtainment_place="
				+ obt_obtainment_place + ", obt_obtainment_addr=" + obt_obtainment_addr + ", obt_obtainment_detail="
				+ obt_obtainment_detail + ", obt_record_date=" + obt_record_date + ", obt_designation="
				+ obt_designation + ", obt_redemption=" + obt_redemption + ", obt_country_code_idx="
				+ obt_country_code_idx + ", obt_qty=" + obt_qty + ", obt_qty_unit_code_idx=" + obt_qty_unit_code_idx
				+ ", obt_redemption_date=" + obt_redemption_date + ", invol_org_code_idx=" + invol_org_code_idx
				+ ", invol_possession_code_idx=" + invol_possession_code_idx + ", invol_item_no=" + invol_item_no
				+ ", invol_remark=" + invol_remark + ", insu_agreed_value=" + insu_agreed_value
				+ ", insu_price_unit_code_idx=" + insu_price_unit_code_idx + ", insu_start_date=" + insu_start_date
				+ ", insu_end_date=" + insu_end_date + ", insu_rental_org=" + insu_rental_org + ", insu_remark="
				+ insu_remark + ", copy_copyright=" + copy_copyright + ", copy_owner=" + copy_owner
				+ ", copy_expiry_date=" + copy_expiry_date + ", copy_usage_permission=" + copy_usage_permission
				+ ", copy_copyright_transfer=" + copy_copyright_transfer + ", copy_remark=" + copy_remark
				+ ", public_service=" + public_service + ", reason=" + reason + ", ggnuri_code_idx=" + ggnuri_code_idx
				+ ", keyword=" + keyword + "]";
	}
	
	public int getItem_idx() {
		return item_idx;
	}
	
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	
	public String getReg_user() {
		return reg_user;
	}

	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}

	public String getOrg_code_idx() {
		return org_code_idx;
	}

	public void setOrg_code_idx(String org_code_idx) {
		this.org_code_idx = org_code_idx;
	}

	public String getPossession_code_idx() {
		return possession_code_idx;
	}

	public void setPossession_code_idx(String possession_code_idx) {
		this.possession_code_idx = possession_code_idx;
	}

	public String getItem_no() {
		return item_no;
	}

	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}

	public String getItem_detail_no() {
		return item_detail_no;
	}

	public void setItem_detail_no(String item_detail_no) {
		this.item_detail_no = item_detail_no;
	}

	public String getItem_nm() {
		return item_nm;
	}

	public void setItem_nm(String item_nm) {
		this.item_nm = item_nm;
	}

	public String getItem_se_nm() {
		return item_se_nm;
	}

	public void setItem_se_nm(String item_se_nm) {
		this.item_se_nm = item_se_nm;
	}

	public String getItem_eng_nm() {
		return item_eng_nm;
	}

	public void setItem_eng_nm(String item_eng_nm) {
		this.item_eng_nm = item_eng_nm;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getQty_unit_code_idx() {
		return qty_unit_code_idx;
	}

	public void setQty_unit_code_idx(String qty_unit_code_idx) {
		this.qty_unit_code_idx = qty_unit_code_idx;
	}

	public String getIcao_code_idx() {
		return icao_code_idx;
	}

	public void setIcao_code_idx(String icao_code_idx) {
		this.icao_code_idx = icao_code_idx;
	}

	public String getExistence_code_idx() {
		return existence_code_idx;
	}

	public void setExistence_code_idx(String existence_code_idx) {
		this.existence_code_idx = existence_code_idx;
	}

	public String getManagement_no() {
		return management_no;
	}

	public void setManagement_no(String management_no) {
		this.management_no = management_no;
	}

	public String getPreservation_need() {
		return preservation_need;
	}

	public void setPreservation_need(String preservation_need) {
		this.preservation_need = preservation_need;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getCondition_code_idx() {
		return condition_code_idx;
	}

	public void setCondition_code_idx(String condition_code_idx) {
		this.condition_code_idx = condition_code_idx;
	}

	public String getRanking_code_idx() {
		return ranking_code_idx;
	}

	public void setRanking_code_idx(String ranking_code_idx) {
		this.ranking_code_idx = ranking_code_idx;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getReg_state() {
		return reg_state;
	}

	public void setReg_state(String reg_state) {
		this.reg_state = reg_state;
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

	public List<String> getClass1_code_idx() {
		return class1_code_idx;
	}

	public void setClass1_code_idx(List<String> class1_code_idx) {
		this.class1_code_idx = class1_code_idx;
	}

	public List<String> getClass2_code_idx() {
		return class2_code_idx;
	}

	public void setClass2_code_idx(List<String> class2_code_idx) {
		this.class2_code_idx = class2_code_idx;
	}

	public List<String> getClass3_code_idx() {
		return class3_code_idx;
	}

	public void setClass3_code_idx(List<String> class3_code_idx) {
		this.class3_code_idx = class3_code_idx;
	}

	public List<String> getCountry_code_idx() {
		return country_code_idx;
	}

	public void setCountry_code_idx(List<String> country_code_idx) {
		this.country_code_idx = country_code_idx;
	}

	public List<String> getEra_code_idx() {
		return era_code_idx;
	}

	public void setEra_code_idx(List<String> era_code_idx) {
		this.era_code_idx = era_code_idx;
	}

	public List<String> getDetail_year() {
		return detail_year;
	}

	public void setDetail_year(List<String> detail_year) {
		this.detail_year = detail_year;
	}

	public List<String> getMaterial1_code_idx() {
		return material1_code_idx;
	}

	public void setMaterial1_code_idx(List<String> material1_code_idx) {
		this.material1_code_idx = material1_code_idx;
	}

	public List<String> getMaterial2_code_idx() {
		return material2_code_idx;
	}

	public void setMaterial2_code_idx(List<String> material2_code_idx) {
		this.material2_code_idx = material2_code_idx;
	}

	public List<String> getMaterial_detail() {
		return material_detail;
	}

	public void setMaterial_detail(List<String> material_detail) {
		this.material_detail = material_detail;
	}

	public List<String> getMeasurement_code_idx() {
		return measurement_code_idx;
	}

	public void setMeasurement_code_idx(List<String> measurement_code_idx) {
		this.measurement_code_idx = measurement_code_idx;
	}

	public List<String> getMeasurement_unit_code_idx() {
		return measurement_unit_code_idx;
	}

	public void setMeasurement_unit_code_idx(List<String> measurement_unit_code_idx) {
		this.measurement_unit_code_idx = measurement_unit_code_idx;
	}

	public List<String> getMeasurement_value() {
		return measurement_value;
	}

	public void setMeasurement_value(List<String> measurement_value) {
		this.measurement_value = measurement_value;
	}

	public List<String> getMeasurement_item_type() {
		return measurement_item_type;
	}

	public void setMeasurement_item_type(List<String> measurement_item_type) {
		this.measurement_item_type = measurement_item_type;
	}

	public String getObt_obtainment_date() {
		return obt_obtainment_date;
	}

	public void setObt_obtainment_date(String obt_obtainment_date) {
		this.obt_obtainment_date = obt_obtainment_date;
	}

	public String getObt_obtainment_code_idx() {
		return obt_obtainment_code_idx;
	}

	public void setObt_obtainment_code_idx(String obt_obtainment_code_idx) {
		this.obt_obtainment_code_idx = obt_obtainment_code_idx;
	}

	public String getObt_purchase1_code_idx() {
		return obt_purchase1_code_idx;
	}

	public void setObt_purchase1_code_idx(String obt_purchase1_code_idx) {
		this.obt_purchase1_code_idx = obt_purchase1_code_idx;
	}

	public String getObt_purchase2_code_idx() {
		return obt_purchase2_code_idx;
	}

	public void setObt_purchase2_code_idx(String obt_purchase2_code_idx) {
		this.obt_purchase2_code_idx = obt_purchase2_code_idx;
	}

	public String getObt_obtainment_price() {
		return obt_obtainment_price;
	}

	public void setObt_obtainment_price(String obt_obtainment_price) {
		this.obt_obtainment_price = obt_obtainment_price;
	}

	public String getObt_price_unit_code_idx() {
		return obt_price_unit_code_idx;
	}

	public void setObt_price_unit_code_idx(String obt_price_unit_code_idx) {
		this.obt_price_unit_code_idx = obt_price_unit_code_idx;
	}

	public String getObt_won_exchange() {
		return obt_won_exchange;
	}

	public void setObt_won_exchange(String obt_won_exchange) {
		this.obt_won_exchange = obt_won_exchange;
	}

	public String getObt_obtainment_no() {
		return obt_obtainment_no;
	}

	public void setObt_obtainment_no(String obt_obtainment_no) {
		this.obt_obtainment_no = obt_obtainment_no;
	}

	public String getObt_obtainment_place() {
		return obt_obtainment_place;
	}

	public void setObt_obtainment_place(String obt_obtainment_place) {
		this.obt_obtainment_place = obt_obtainment_place;
	}

	public String getObt_obtainment_addr() {
		return obt_obtainment_addr;
	}

	public void setObt_obtainment_addr(String obt_obtainment_addr) {
		this.obt_obtainment_addr = obt_obtainment_addr;
	}

	public String getObt_obtainment_detail() {
		return obt_obtainment_detail;
	}

	public void setObt_obtainment_detail(String obt_obtainment_detail) {
		this.obt_obtainment_detail = obt_obtainment_detail;
	}

	public String getObt_record_date() {
		return obt_record_date;
	}

	public void setObt_record_date(String obt_record_date) {
		this.obt_record_date = obt_record_date;
	}

	public String getObt_designation() {
		return obt_designation;
	}

	public void setObt_designation(String obt_designation) {
		this.obt_designation = obt_designation;
	}

	public String getObt_redemption() {
		return obt_redemption;
	}

	public void setObt_redemption(String obt_redemption) {
		this.obt_redemption = obt_redemption;
	}

	public String getObt_country_code_idx() {
		return obt_country_code_idx;
	}

	public void setObt_country_code_idx(String obt_country_code_idx) {
		this.obt_country_code_idx = obt_country_code_idx;
	}

	public String getObt_qty() {
		return obt_qty;
	}

	public void setObt_qty(String obt_qty) {
		this.obt_qty = obt_qty;
	}

	public String getObt_qty_unit_code_idx() {
		return obt_qty_unit_code_idx;
	}

	public void setObt_qty_unit_code_idx(String obt_qty_unit_code_idx) {
		this.obt_qty_unit_code_idx = obt_qty_unit_code_idx;
	}

	public String getObt_redemption_date() {
		return obt_redemption_date;
	}

	public void setObt_redemption_date(String obt_redemption_date) {
		this.obt_redemption_date = obt_redemption_date;
	}

	public List<String> getInvol_org_code_idx() {
		return invol_org_code_idx;
	}

	public void setInvol_org_code_idx(List<String> invol_org_code_idx) {
		this.invol_org_code_idx = invol_org_code_idx;
	}

	public List<String> getInvol_possession_code_idx() {
		return invol_possession_code_idx;
	}

	public void setInvol_possession_code_idx(List<String> invol_possession_code_idx) {
		this.invol_possession_code_idx = invol_possession_code_idx;
	}

	public List<String> getInvol_item_no() {
		return invol_item_no;
	}

	public void setInvol_item_no(List<String> invol_item_no) {
		this.invol_item_no = invol_item_no;
	}

	public List<String> getInvol_remark() {
		return invol_remark;
	}

	public void setInvol_remark(List<String> invol_remark) {
		this.invol_remark = invol_remark;
	}

	public List<String> getInsu_agreed_value() {
		return insu_agreed_value;
	}

	public void setInsu_agreed_value(List<String> insu_agreed_value) {
		this.insu_agreed_value = insu_agreed_value;
	}

	public List<String> getInsu_price_unit_code_idx() {
		return insu_price_unit_code_idx;
	}

	public void setInsu_price_unit_code_idx(List<String> insu_price_unit_code_idx) {
		this.insu_price_unit_code_idx = insu_price_unit_code_idx;
	}

	public List<String> getInsu_start_date() {
		return insu_start_date;
	}

	public void setInsu_start_date(List<String> insu_start_date) {
		this.insu_start_date = insu_start_date;
	}

	public List<String> getInsu_end_date() {
		return insu_end_date;
	}

	public void setInsu_end_date(List<String> insu_end_date) {
		this.insu_end_date = insu_end_date;
	}

	public List<String> getInsu_rental_org() {
		return insu_rental_org;
	}

	public void setInsu_rental_org(List<String> insu_rental_org) {
		this.insu_rental_org = insu_rental_org;
	}

	public List<String> getInsu_remark() {
		return insu_remark;
	}

	public void setInsu_remark(List<String> insu_remark) {
		this.insu_remark = insu_remark;
	}

	public List<String> getCopy_copyright() {
		return copy_copyright;
	}

	public void setCopy_copyright(List<String> copy_copyright) {
		this.copy_copyright = copy_copyright;
	}

	public List<String> getCopy_owner() {
		return copy_owner;
	}

	public void setCopy_owner(List<String> copy_owner) {
		this.copy_owner = copy_owner;
	}

	public List<String> getCopy_expiry_date() {
		return copy_expiry_date;
	}

	public void setCopy_expiry_date(List<String> copy_expiry_date) {
		this.copy_expiry_date = copy_expiry_date;
	}

	public List<String> getCopy_usage_permission() {
		return copy_usage_permission;
	}

	public void setCopy_usage_permission(List<String> copy_usage_permission) {
		this.copy_usage_permission = copy_usage_permission;
	}

	public List<String> getCopy_copyright_transfer() {
		return copy_copyright_transfer;
	}

	public void setCopy_copyright_transfer(List<String> copy_copyright_transfer) {
		this.copy_copyright_transfer = copy_copyright_transfer;
	}

	public List<String> getCopy_remark() {
		return copy_remark;
	}

	public void setCopy_remark(List<String> copy_remark) {
		this.copy_remark = copy_remark;
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	
}
