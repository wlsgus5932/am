package egovframework.aviation.group.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuAuthorityCodeJoinVO;
import egovframework.aviation.group.vo.MenuAuthorityVO;
import egovframework.aviation.group.vo.PossessionAuthorityVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.user.vo.UserJoinVO;


@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupMapper groupMapper;
	
	public List<GroupVO> getGroupList(GroupVO groupVO) {
		return groupMapper.getGroupList(groupVO);
	}
	
	public int getGroupListCnt(GroupVO groupVO) {
		return groupMapper.getGroupListCnt(groupVO);
	}
	
	public int insertGroup(GroupVO groupVO) {
		return groupMapper.insertGroup(groupVO);
	}
	
	public int updateGroup(GroupVO groupVO) {
		return groupMapper.updateGroup(groupVO);
	}
	
	public int updateUserGroup(GroupVO groupVO) {
		return groupMapper.updateUserGroup(groupVO);
	}
	
	public int deleteAuthority(GroupVO groupVO) {
		return groupMapper.deleteAuthority(groupVO);
	}
	
	public int deleteGroup(GroupVO groupVO) {
		return groupMapper.deleteGroup(groupVO);
	}

	public int insertMenuAuthority(MenuAuthorityVO menuAuthorityVO) {
		return groupMapper.insertMenuAuthority(menuAuthorityVO);
	}

	@Override
	public int deletePossessionAuthority(GroupVO groupVO) {
		return groupMapper.deletePossessionAuthority(groupVO);
	}

	@Override
	public int insertPossessionAuthority(PossessionAuthorityVO possessionAuthorityVO) {
		return groupMapper.insertPossessionAuthority(possessionAuthorityVO);
	}

	@Override
	public List<MenuAuthorityCodeJoinVO> getMenuAuth(MenuAuthorityCodeJoinVO menuAuthorityCodeJoinVO) {
		return groupMapper.getMenuAuth(menuAuthorityCodeJoinVO);
	}

	@Override
	public List<MenuAuthorityCodeJoinVO> getMenuAuthFunction(MenuAuthorityCodeJoinVO menuAuthorityCodeJoinVO) {
		return groupMapper.getMenuAuthFunction(menuAuthorityCodeJoinVO);
	}
	
}
