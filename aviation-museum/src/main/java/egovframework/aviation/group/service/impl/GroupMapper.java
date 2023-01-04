package egovframework.aviation.group.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.group.vo.GroupVO;

@Mapper
public interface GroupMapper {
	public List<GroupVO> getGroupList(GroupVO groupVO);
	
    public int insertGroup(GroupVO groupVO);

    public int updateGroup(GroupVO groupVO);

}
