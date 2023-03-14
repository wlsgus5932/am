package egovframework.aviation.metadata.service;

import java.util.List;

import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.metadata.vo.metadata.KeywordVO;
import egovframework.aviation.metadata.vo.param.KeywordParamVO;
import egovframework.aviation.mypage.vo.InterestVO;

public interface MetaDataSearchService {

	int getMetaDataSearchListCnt(MetaDataSearchVO metaDataSearchVO);

	List<MetaDataSearchVO> getMetaDataSearchList(MetaDataSearchVO metaDataSearchVO);

	int insertInterest(InterestVO interestVO);

	int getMetaDataSearchImageListCnt(MetaDataSearchImageVO metaDataSearchImageVO);

	List<MetaDataSearchImageVO> getMetaDataSearchImageList(MetaDataSearchImageVO metaDataSearchImageVO);

	List<MetaDataSearchVO> getMetaDataSearchListCurrentQty(MetaDataSearchVO metaDataSearchVO);

	List<MetaDataSearchImageVO> getMetaDataSearchImageListCurrentQty(MetaDataSearchImageVO metaDataSearchImageVO);

	List<KeywordVO> getKeywordList(KeywordParamVO param);

	int addKeyword(KeywordParamVO param);

}
