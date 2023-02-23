package egovframework.aviation.preferences.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.preferences.service.OtherMgrService;
import egovframework.aviation.preferences.vo.ExchnRateVO;
import egovframework.aviation.preferences.vo.TagVO;

@Service
public class OtherMgrServiceImpl implements OtherMgrService {
	
	@Autowired
	private OtherMgrMapper otherMgrMapper;
	
	public List<TagVO> getTagList(TagVO tagVO) {
		return otherMgrMapper.getTagList(tagVO);
	}

	@Override
	public int getTagListCnt(TagVO tagVO) {
		return otherMgrMapper.getTagListCnt(tagVO);
	}

	@Override
	public List<TagVO> getTagDuplicateCheck(TagVO tagVO) {
		return otherMgrMapper.getTagDuplicateCheck(tagVO);
	}

	@Override
	public int insertTag(TagVO tagVO) {
		return otherMgrMapper.insertTag(tagVO);
	}

	@Override
	public int updateTag(TagVO tagVO) {
		return otherMgrMapper.updateTag(tagVO);
	}

	@Override
	public int deleteTag(TagVO tagVO) {
		return otherMgrMapper.deleteTag(tagVO);
	}

	@Override
	public List<ExchnRateVO> getExchnRateList(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.getExchnRateList(exchnRateVO);
	}

	@Override
	public int getExchnRateListCnt(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.getExchnRateListCnt(exchnRateVO);
	}

	@Override
	public int insertExchnRate(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.insertExchnRate(exchnRateVO);
	}
	
	@Override
	public int setExchnRateAllEnabledMod(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.setExchnRateAllEnabledMod(exchnRateVO);
	}
	
	@Override
	public int updateExchnRate(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.updateExchnRate(exchnRateVO);
	}

	@Override
	public int deleteExchnRate(ExchnRateVO exchnRateVO) {
		return otherMgrMapper.deleteExchnRate(exchnRateVO);
	}



}
