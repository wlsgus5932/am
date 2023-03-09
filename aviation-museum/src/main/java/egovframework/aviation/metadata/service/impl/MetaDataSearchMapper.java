package egovframework.aviation.metadata.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.metadata.vo.MetaDataSearchImageVO;
import egovframework.aviation.metadata.vo.MetaDataSearchVO;
import egovframework.aviation.mypage.vo.InterestVO;

@Mapper
public interface MetaDataSearchMapper {

	int getMetaDataSearchListCnt(MetaDataSearchVO metaDataSearchVO);

	List<MetaDataSearchVO> getMetaDataSearchList(MetaDataSearchVO metaDataSearchVO);
	
	int insertInterest(InterestVO interestVO);
	
	int getMetaDataSearchImageListCnt(MetaDataSearchImageVO metaDataSearchImageVO);

	List<MetaDataSearchImageVO> getMetaDataSearchImageList(MetaDataSearchImageVO metaDataSearchImageVO);
	
	List<MetaDataSearchVO> getMetaDataSearchListCurrentQty(MetaDataSearchVO metaDataSearchVO);
	
	List<MetaDataSearchImageVO> getMetaDataSearchImageListCurrentQty(MetaDataSearchImageVO metaDataSearchImageVO);
}
