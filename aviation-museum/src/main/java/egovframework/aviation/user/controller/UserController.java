package egovframework.aviation.user.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.user.service.UserService;
import egovframework.aviation.user.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService service;
	
	@GetMapping("/login.do")
	public String Login(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/login";
	}
	
	@PostMapping("/login.do")
	public String Login(@ModelAttribute("user") UserVO user, Model model, HttpServletRequest req) throws Exception {
		List<UserVO> list = service.login(user);
		if(list == null || list.isEmpty()) {
			return "login/login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("userSession", session.getId());
			model.addAttribute("list", list);
			model.addAttribute("session", session.getId());
			return "main/main";
		}
	}
	
	@GetMapping("/logout.do")
	public String Logout(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/login";
	}

	@GetMapping("/usermgr.do")
	public String UserMgr(HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		session.invalidate();
		return "userMgr/userMgr_main";
	}
	
	@RequestMapping("/usermgr/userListAjax.do")
	public String userAjax(@ModelAttribute("user") UserVO user, Model model, HttpServletRequest req) throws Exception {
		System.out.println("userListAjax");
		List<UserVO> list = service.login(user);

		model.addAttribute("list", list);
		
		return "userMgr/userMgr_main";
	}
}
