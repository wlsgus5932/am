package egovframework.aviation.metadata.vo.metadata;

import lombok.Data;

@Data
public class TaxonomyVO {
	private String taxonomy_idx;
	private String item_idx;
	private String class1_code_idx;
	private String class2_code_idx;
	private String class3_code_idx;
	private String class1_nm;
	private String class2_nm;
	private String class3_nm;
	private String reg_user;
	private String reg_date;
}
