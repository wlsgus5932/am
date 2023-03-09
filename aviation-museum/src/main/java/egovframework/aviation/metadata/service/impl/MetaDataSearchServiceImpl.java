package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.metadata.service.MetaDataSearchService;
import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.mypage.vo.InterestVO;

@Service
public class MetaDataSearchServiceImpl implements MetaDataSearchService {
	
	@Autowired
	private MetaDataSearchMapper metaDataSearchMapper;
	
	@Override
	public int getMetaDataSearchListCnt(MetaDataSearchVO metaDataSearchVO) {
		return metaDataSearchMapper.getMetaDataSearchListCnt(metaDataSearchVO);
	}

	@Override
	public List<MetaDataSearchVO> getMetaDataSearchList(MetaDataSearchVO metaDataSearchVO) {
		return metaDataSearchMapper.getMetaDataSearchList(metaDataSearchVO);
	}

	@Override
	public int insertInterest(InterestVO interestVO) {
		return metaDataSearchMapper.insertInterest(interestVO);
	}

	@Override
	public int getMetaDataSearchImageListCnt(MetaDataSearchImageVO metaDataSearchImageVO) {
		return metaDataSearchMapper.getMetaDataSearchImageListCnt(metaDataSearchImageVO);
	}

	@Override
	public List<MetaDataSearchImageVO> getMetaDataSearchImageList(MetaDataSearchImageVO metaDataSearchImageVO) {
		return metaDataSearchMapper.getMetaDataSearchImageList(metaDataSearchImageVO);
	}

	@Override
	public List<MetaDataSearchVO> getMetaDataSearchListCurrentQty(MetaDataSearchVO metaDataSearchVO) {
		return metaDataSearchMapper.getMetaDataSearchListCurrentQty(metaDataSearchVO);
	}

	@Override
	public List<MetaDataSearchImageVO> getMetaDataSearchImageListCurrentQty(
			MetaDataSearchImageVO metaDataSearchImageVO) {
		return metaDataSearchMapper.getMetaDataSearchImageListCurrentQty(metaDataSearchImageVO);
	}

}
