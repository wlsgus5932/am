package egovframework.aviation.metadata.controller.add;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.vo.param.SpecialityParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityVO;

@Controller
public class specialityController {
	
	@Autowired
	private SpecialityService service;
	
	@GetMapping("/getSpeciality.do")
	public String getSpecialityCode(ModelMap model, @RequestParam("item_idx") int item_idx) throws Exception {
		System.out.println(item_idx);
		try {
			List<SpecialityVO> list = service.getSpeciality(item_idx);
			if(list.size() == 0) {
				return "no reuslt";
			} else {
				model.addAttribute("specialityList", list);
				return "jsonView"; 
			}
		} catch (Exception e) {
			return "error";
		}
	}
	
	@PostMapping("/setSpeciality.do")
	@ResponseBody
	public String setSpecaility(@ModelAttribute SpecialityParamVO param) throws Exception {
		try {
			System.out.println(param);
			String fileName = null;
			String filePath = "D:\\uploadtest\\";
	        MultipartFile uploadFile = param.getSpc_uploadFile();
	        
	        if (!uploadFile.isEmpty()) {
	            fileName = uploadFile.getOriginalFilename();
	            System.out.println("ori:::"+fileName);
	            //String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
	            //UUID uuid = UUID.randomUUID(); // UUID 구하기
	            //fileName = uuid + "." + ext;
	            uploadFile.transferTo(new File(filePath + fileName));
	        }
	        
	        param.setSpc_file_nm(fileName);
	        param.setSpc_file_path(filePath);
	        
	        int x = service.setSpeciality(param);
	        
	        return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	
	@PostMapping("/updateSpeciality.do")
	@ResponseBody
	public String updateSpecaility(@ModelAttribute SpecialityParamVO param) throws Exception {
		String result = "error";
		System.out.println(param);
		try {
			String fileName = null;
			String filePath = "D:\\uploadtest\\";
	        MultipartFile uploadFile = param.getSpc_uploadFile();
	        
	        if (!uploadFile.isEmpty()) {
	        	File file = new File(param.getSpc_file_path()+param.getSpc_file_nm());
				boolean delete = file.delete();
				
	            fileName = uploadFile.getOriginalFilename();
	            System.out.println("ori:::"+fileName);
	            uploadFile.transferTo(new File(filePath + fileName));
	        }
	        
	        param.setSpc_file_nm(fileName);
	        param.setSpc_file_path(filePath);
	        
	        int x = service.updateSpeciality(param);
	        if(x != 0) {
	        	result = "success";
	        }
	        
	        return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@PostMapping("/deleteSpeciality.do")
	@ResponseBody
	public String deleteSpecialityCode(@ModelAttribute SpecialityParamVO param) throws Exception {
		String result = "error";
		try {
			int x = service.deleteSpeciality(param);
			
			if(x != 0) {
				File file = new File(param.getSpc_file_path()+param.getSpc_file_nm());
				boolean delete = file.delete();
				result = "success";
			}
			
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	
	

}
