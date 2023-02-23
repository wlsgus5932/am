package egovframework.aviation.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.MenuAuthorityCodeJoinVO;

public class AuthInterceptor implements HandlerInterceptor {
	@Autowired(required=false)
	private GroupService groupService;
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
        HttpSession session = request.getSession(false);
        
        
        if(session.getAttribute("userSession") != null) {    
//        	String userGroupIdx = (String) session.getAttribute("userSessionGroupIdx");
//        	String request_URI = request.getRequestURI();
//        	System.out.println(request_URI);
//        	
//        	MenuAuthorityCodeJoinVO menuAuthorityCodeJoinVO = new MenuAuthorityCodeJoinVO();
//        	menuAuthorityCodeJoinVO.setGroup_idx(userGroupIdx);
//        	menuAuthorityCodeJoinVO.setMenu_pattern(request_URI);
//        	List<MenuAuthorityCodeJoinVO> getMenuAuth = groupService.getMenuAuth(menuAuthorityCodeJoinVO);
//
//        	System.out.println("getMenuAuth"+getMenuAuth.size());
//        	if(getMenuAuth.size() == 0) {
//    			return false;
//        	}
        	return true; 
		} else {
			response.sendRedirect("/login.do");
			return false;
		}
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
}
