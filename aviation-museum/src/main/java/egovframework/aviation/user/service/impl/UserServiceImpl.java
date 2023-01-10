package egovframework.aviation.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper dao;
	
	@Override
	public List<UserVO> login(UserVO user) {
		return dao.login(user);
	}

	@Override
	public List<UserJoinVO> getUserList(UserJoinVO userJoinVO) {
		return dao.getUserList(userJoinVO);
	}
	
	public int getUserListCnt(UserJoinVO userJoinVO) {
		return dao.getUserListCnt(userJoinVO);
	}
	
	public List<UserJoinVO> getDuplicateCheck(UserJoinVO userJoinVO) {
		return dao.getDuplicateCheck(userJoinVO);
	}
	
	public int insertUser(UserVO userVO) {
		return dao.insertUser(userVO);
	}
	
	public int updateUser(UserVO userVO) {
		return dao.updateUser(userVO);
	}
	
	public int updateUserListEnabled(UserVO userVO) {
		return dao.updateUserListEnabled(userVO);
	}


}
