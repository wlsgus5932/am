package egovframework.aviation.metadata.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/metadata")
public class MetaDataController {
	
	@GetMapping("/add.do")
	public String addMetaDataForm() throws Exception {
		return "metadata/add";
	}
	
	@PostMapping("/add.do")
	public String addMetaData() throws Exception {
		return "metadata/add";
	}

}
