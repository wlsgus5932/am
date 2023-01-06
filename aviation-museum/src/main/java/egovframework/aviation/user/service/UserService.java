package egovframework.aviation.user.service;

import java.util.List;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

public interface UserService {
	public List<UserVO> login(UserVO search);
	
	public List<UserJoinVO> getUserList(UserJoinVO userJoinVO);

	public List<UserJoinVO> getDuplicateCheck(UserJoinVO userJoinVO);
	
	public int insertUser(UserVO userVO);
	
	public int updateUser(UserVO userVO);
	
	public int updateUserListEnabled(UserVO userVO);
}
