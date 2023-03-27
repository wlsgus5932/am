package egovframework.aviation.metadata.vo.param;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class KeywordParamVO {
	private String item_idx;
	private String keyword;
	private List<String> keywordList;
	private String reg_user;
	private String addKeyword;
}
