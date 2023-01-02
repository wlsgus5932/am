package egovframework.aviation.user.service;

import java.util.List;

import egovframework.aviation.user.vo.UserVO;

public interface UserService {
	public List<UserVO> login(UserVO search);
}
