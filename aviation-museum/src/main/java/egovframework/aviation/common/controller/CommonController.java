package egovframework.aviation.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class CommonController {

	@RequestMapping("/authorityOk.do")
	public String AuthorityOk(HttpServletRequest req, Model model) throws Exception {
		 	String before_address;
			before_address = req.getHeader("referer"); 
			
			if(before_address == null || before_address.equals("") || before_address.equals("/login.do") || before_address.equals("/logout.do")) {
				model.addAttribute("before_address", "/dashBoard.do");
			}else{
				model.addAttribute("before_address", before_address);
			}
			model.addAttribute("authorityOk", "권한이 없습니다.");
		return "common/authorityOk";
	}
}
