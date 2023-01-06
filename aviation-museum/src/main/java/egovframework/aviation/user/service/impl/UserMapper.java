package egovframework.aviation.user.service.impl;

import java.util.List;


import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

@Mapper
public interface UserMapper {
	public List<UserVO> login(UserVO user);
	
	public List<UserJoinVO> getUserList(UserJoinVO userJoinVO);

	public List<UserJoinVO> getDuplicateCheck(UserJoinVO userJoinVO);
	
	public int insertUser(UserVO userVO);
	
	public int updateUser(UserVO userVO);
	
	public int updateUserListEnabled(UserVO userVO);
}
