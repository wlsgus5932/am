package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TransformParamVO {
	private List<String> item_idx;
	private String[] item_idx_arr;
	private String possession_code_idx;
	private String org_code_idx;
	private String item_detail_no1;
	private String item_no1;
	private String item_detail_no2;
	private String item_no2;
	private String page_no;
	private String reg_state;
	private int pageStart;
	private int perPageNum;

}
