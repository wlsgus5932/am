package egovframework.aviation.metadata.controller.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;

@Controller
public class TransformController {
	
	@Autowired
	private MetaDataService service;
	
	@GetMapping("/getTransform.do")
	public String getTransform(Model model) throws Exception {
		List<PosSessionVO> possession = service.getPosSession();
		List<OrgVO> org = service.getOrg();
		
		model.addAttribute("orgList", org);
		model.addAttribute("posSessionList", possession);
		
		return "metadata/management/transform";
	}
	
	@PostMapping("/getTransform.do")
	public String getTransformList(Model model) throws Exception {
		
		
		return "metadata/management/transform";
	}
	

}
