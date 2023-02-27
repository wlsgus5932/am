package egovframework.aviation.metadata.service;

import java.util.List;

import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.mypage.vo.InterestVO;

public interface MetaDataSearchService {

	int getMetaDataSearchListCnt(MetaDataSearchVO metaDataSearchVO);

	List<MetaDataSearchVO> getMetaDataSearchList(MetaDataSearchVO metaDataSearchVO);

	int insertInterest(InterestVO interestVO);

	int getMetaDataSearchImageListCnt(MetaDataSearchImageVO metaDataSearchImageVO);

	List<MetaDataSearchImageVO> getMetaDataSearchImageList(MetaDataSearchImageVO metaDataSearchImageVO);

}
