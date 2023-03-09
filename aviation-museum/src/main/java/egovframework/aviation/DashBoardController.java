package egovframework.aviation;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DashBoardController {
	
	@RequestMapping(value = "/dashBoard.do")
	public String addMetaData(HttpServletRequest req, Model model) throws Exception {
		model.addAttribute("session", req.getSession().getId());
		return "dashBoard/dashBoard";
	}

}
