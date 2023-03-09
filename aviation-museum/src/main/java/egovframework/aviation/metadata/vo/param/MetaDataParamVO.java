package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
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
   
   private List<String> update_class1_code_idx;
   private List<String> update_class2_code_idx;
   private List<String> update_class3_code_idx;
   
   private List<String> taxonomy_idx;
   
   //국적 html 테이블 - country
   private List<String> country_code_idx;
   private List<String> era_code_idx;
   private List<String> detail_year;
   
   private List<String> update_country_code_idx;
   private List<String> update_era_code_idx;
   private List<String> update_detail_year;
   
   private List<String> country_idx;
   
   //재질 html 테이블 - material
   private List<String> material1_code_idx; // 재질분류1코드값
   private List<String> material2_code_idx; //재질분류2코드값
   private List<String> material_detail;//재질상세
   
   private List<String> update_material1_code_idx;
   private List<String> update_material2_code_idx;
   private List<String> update_material_detail;
   
   private List<String> material_idx;
   
   //크기 html 테이블 - measurement
   private List<String> measurement_code_idx; //실측부위코드값
   private List<String> measurement_unit_code_idx; //실측단위코드값
   private List<String> measurement_value; //실측치
   private List<String> measurement_item_type; //자료구분
   
   private List<String> update_measurement_code_idx;
   private List<String> update_measurement_unit_code_idx;
   private List<String> update_measurement_value;
   private List<String> update_measurement_item_type;
   
   private List<String> measurement_idx;

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
   
   private List<String> update_invol_org_code_idx;
   private List<String> update_invol_possession_code_idx;
   private List<String> update_invol_item_no;
   private List<String> update_invol_remark;
   
   private List<String> involvement_idx;
   
   //보험정보 html 테이블 - insurance
   private List<String> insu_agreed_value;//평가액
   private List<String> insu_price_unit_code_idx;//가격단위코드키값
   private List<String> insu_start_date; //대여시작일
   private List<String> insu_end_date; //대여종료일
   private List<String> insu_rental_org;//대여기관
   private List<String> insu_remark; //비고
   
   private List<String> update_insu_agreed_value;
   private List<String> update_insu_price_unit_code_idx;
   private List<String> update_insu_start_date;
   private List<String> update_insu_end_date;
   private List<String> update_insu_rental_org;
   private List<String> update_insu_remark;
   
   private List<String> insurance_idx;
   
   //저작권 html 테이블 - copyright
   private List<String> copy_copyright;//저작권여부
   private List<String> copy_owner;//저작권소유자
   private List<String> copy_expiry_date;//저작권만료일자
   private List<String> copy_usage_permission;//이용허락여부
   private List<String> copy_copyright_transfer;//저작권양도여부
   private List<String> copy_remark;//비고
   
   private List<String> update_copy_copyright;
   private List<String> update_copy_owner;
   private List<String> update_copy_expiry_date;
   private List<String> update_copy_usage_permission;
   private List<String> update_copy_copyright_transfer;
   private List<String> update_copy_remark;
   
   private List<String> copyright_idx;
   
   //대국민서비스 html 테이블 - ggnuri
   private String public_service; //대국민서비스여부
   private String reason; //서비스불가사유
   private String ggnuri_code_idx; //공공누리코드키값
   
   //키워드 html 테이블 - keyword
   private String keyword; //키워드
}