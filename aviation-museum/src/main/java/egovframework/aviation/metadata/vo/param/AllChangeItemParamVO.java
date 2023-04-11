package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Data;

@Data
public class AllChangeItemParamVO {
	private String org_code_idx;
	private String possession_code_idx;
	private String changeItem;
	private String item_no;
	private String item_detail_no;
	private String item_no1;
	private String item_detail_no1;
	private String before_class1_code_idx;
	private String before_class2_code_idx;
	private String before_class3_code_idx;
	private String after_class1_code_idx;
	private String after_class2_code_idx;
	private String after_class3_code_idx;
	
	private String before_country_code_idx;
	private String before_era_code_idx;
	private String after_country_code_idx;
	private String after_era_code_idx;
	
	private String before_material1_code_idx;
	private String after_material1_code_idx;
	private String before_material2_code_idx;
	private String after_material2_code_idx;
	
	private String before_qty_unit_code_idx;
	private String after_qty_unit_code_idx;
	
	private String before_measurement_code_idx;
	private String after_measurement_code_idx;
	
	private String before_ranking_code_idx;
	private String after_ranking_code_idx;
	
	private String before_obtainment_code_idx;
	private String after_obtainment_code_idx;
	
	private String before_purchase1_code_idx;
	private String after_purchase1_code_idx;
	
	private String before_purchase2_code_idx;
	private String after_purchase2_code_idx;
	
	private String before_price_unit_code_idx;
	private String after_price_unit_code_idx;
	
	private String before_designation;
	private String after_designation;
	
	private String change_movement_date;
	private String itemChangeRadio;
	private String changeItemCheck;
}
