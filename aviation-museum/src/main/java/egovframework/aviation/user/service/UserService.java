package egovframework.aviation.user.service;

import java.util.List;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.group.vo.MenuCodeVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.user.vo.UserJoinVO;
import egovframework.aviation.user.vo.UserVO;

public interface UserService {
	public List<UserVO> login(UserVO search);
	
	public List<UserJoinVO> getUserList(UserJoinVO userJoinVO);
	
	public int getUserListCnt(UserJoinVO userJoinVO);
	
	public List<UserJoinVO> getDuplicateCheck(UserJoinVO userJoinVO);
	
	public int insertUser(UserVO userVO);
	
	public int updateUser(UserVO userVO);
	
	public int updateUserPassWord(UserVO userVO);
	
	public int updateUserListEnabled(UserVO userVO);
	
//	사용자 관리권한
	public List<MenuCodeVO> getMenuCodeList(MenuCodeVO menuCodeVO);
	
	public List<MenuCodeVO> getMenuCodeListLarge(MenuCodeVO menuCodeVO);

	public List<UserVO> getGroupUserList(GroupVO groupVO);
	
	public List<MenuCodeVO> getGroupMenuList(GroupVO groupVO);
	
	public List<PosSessionVO> getGroupPossessionList(GroupVO groupVO);
	
	public List<PosSessionVO> getPosSession2(GroupVO groupVO);
}
