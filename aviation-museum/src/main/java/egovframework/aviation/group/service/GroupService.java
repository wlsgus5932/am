package egovframework.aviation.group.service;

import java.util.List;

import egovframework.aviation.group.vo.GroupVO;

public interface GroupService {
	public List<GroupVO> getGroupList(GroupVO groupVO);

	public int insertGroup(GroupVO groupVO);

	public int updateGroup(GroupVO groupVO);
	
	public int updateUserGroup(GroupVO groupVO);
	
	public int deleteAuthority(GroupVO groupVO);
	
	public int deleteGroup(GroupVO groupVO);

}
