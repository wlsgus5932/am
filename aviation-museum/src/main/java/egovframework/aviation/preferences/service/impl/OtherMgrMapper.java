package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.preferences.vo.ExchnRateVO;
import egovframework.aviation.preferences.vo.TagVO;

@Mapper
public interface OtherMgrMapper {
	public List<TagVO> getTagList(TagVO tagVO);
	
	public int getTagListCnt(TagVO tagVO);
	
	public List<TagVO> getTagDuplicateCheck(TagVO tagVO);
	
	public int insertTag(TagVO tagVO);

	public int updateTag(TagVO tagVO);
	
	public int deleteTag(TagVO tagVO);
	
	public List<ExchnRateVO> getExchnRateList(ExchnRateVO exchnRateVO);
	
	public int getExchnRateListCnt(ExchnRateVO exchnRateVO);
		
	public int insertExchnRate(ExchnRateVO exchnRateVO);

	public int updateExchnRate(ExchnRateVO exchnRateVO);
	
	public int setExchnRateAllEnabledMod(ExchnRateVO exchnRateVO);
	
	public int deleteExchnRate(ExchnRateVO exchnRateVO);
}
