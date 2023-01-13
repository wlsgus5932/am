package egovframework.aviation.group.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuAuthorityVO;

public interface GroupService {
	public List<GroupVO> getGroupList(GroupVO groupVO);

	public int getGroupListCnt(GroupVO groupVO);
	
	public int insertGroup(GroupVO groupVO);

	public int updateGroup(GroupVO groupVO);
	
	public int updateUserGroup(GroupVO groupVO);
	
	public int deleteAuthority(GroupVO groupVO);
	
	public int deleteGroup(GroupVO groupVO);

	public int insertMenuAuthority(MenuAuthorityVO menuAuthorityVO);

}
