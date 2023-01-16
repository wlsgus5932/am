package egovframework.aviation.group.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuAuthorityVO;
import egovframework.aviation.group.vo.PossessionAuthorityVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.user.vo.UserJoinVO;

@Mapper
public interface GroupMapper {
	public List<GroupVO> getGroupList(GroupVO groupVO);
	
	public int getGroupListCnt(GroupVO groupVO);

    public int insertGroup(GroupVO groupVO);

    public int updateGroup(GroupVO groupVO);
       
    public int updateUserGroup(GroupVO groupVO);
    
    public int deleteAuthority(GroupVO groupVO);
    
    public int deleteGroup(GroupVO groupVO);
    
    public int insertMenuAuthority(MenuAuthorityVO menuAuthorityVO);
    
    public int deletePossessionAuthority(GroupVO groupVO);
    
    public int insertPossessionAuthority(PossessionAuthorityVO possessionAuthorityVO);
}
