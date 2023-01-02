package egovframework.aviation.user.service.impl;

import java.util.List;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.user.vo.UserVO;

@Mapper
public interface UserMapper {
	public List<UserVO> login(UserVO user);
}
