package egovframework.aviation.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper dao;
	
	@Override
	public List<UserVO> login(UserVO user) {
		return dao.login(user);
	}

}
