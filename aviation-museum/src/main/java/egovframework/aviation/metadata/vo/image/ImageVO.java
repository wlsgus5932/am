package egovframework.aviation.metadata.vo.image;

import lombok.Data;

@Data
public class ImageVO {
	private String rownum;
	private String item_idx;
	private String image_idx;
	private String image_nm;
	private String orignl_nm;
	private String thumbnail_nm;
	private String image_path;
	private int image_width;
	private int image_height;
	private String rep_image;
	private long file_size;
	private String public_service;
	private String reg_user = "jinhyun";
	private String reg_date;
	private String mod_user;
	private String mod_date;
	private String image_desc;
	private String possession_nm;
	private String org_nm;
	private String item_no;
	private String item_detail_no;
	
}
