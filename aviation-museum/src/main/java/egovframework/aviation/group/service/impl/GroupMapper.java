package egovframework.aviation.group.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.group.vo.GroupVO;
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
}
