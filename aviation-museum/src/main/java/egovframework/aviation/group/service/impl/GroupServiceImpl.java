package egovframework.aviation.group.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.GroupVO;


@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupMapper groupMapper;
	
	public List<GroupVO> getGroupList(GroupVO groupVO) {
		return groupMapper.getGroupList(groupVO);
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
}
