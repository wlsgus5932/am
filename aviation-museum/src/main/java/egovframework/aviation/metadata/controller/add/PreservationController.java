package egovframework.aviation.metadata.controller.add;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import devpia.dextuploadnj.CompressUtil;
import devpia.dextuploadnj.support.spring.DEXTUploadNJFileDownloadView;
import egovframework.aviation.metadata.service.FileRepository;
import egovframework.aviation.metadata.service.PreservationService;
import egovframework.aviation.metadata.vo.image.FileEntity;
import egovframework.aviation.metadata.vo.metadata.PreservationImageVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.param.PreservationParamVO;

@Controller
public class PreservationController {
	@Autowired
	private PreservationService service;
	
//	String result_path = "D:/uploadtest/images/preservation/result-img/";
	String result_path = "/images/preservation/result-img/";
	String db_result_path = "/images/preservation/result-img/";
	
//	String before_path = "D:/uploadtest/images/preservation/before-img/";
	String before_path = "/images/preservation/before-img/";
	String db_before_path = "/images/preservation/before-img/";
	
//	String after_path = "D:/uploadtest/images/preservation/after-img/";
	String after_path = "/images/preservation/after-img/";
	String db_after_path = "/images/preservation/after-img/";
	
	@PostMapping("/addPreservation.do")
	@ResponseBody
	public String addPreservation(@ModelAttribute PreservationParamVO param, HttpServletRequest req) throws Exception {
		System.out.println(param);
		MultipartFile uploadFile = null;
		String fileName = null;
		
		String result = "error";
		System.out.println(param.getBefore_uploadFile() +","+ param.getAfter_uploadFile() + "," + param.getResult_uploadFile());
		
		uploadFile = param.getResult_uploadFile();
		fileName = uploadFile.getOriginalFilename();
		param.setFile_nm(fileName);
		param.setFile_path(db_result_path);
			if(!uploadFile.isEmpty()) {
				uploadFile.transferTo(new File(result_path + fileName));
			}
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		param.setReg_user(userSessionId);
		int x = service.setPreservation(param);
		
			if(x > 0) {
				Map<Integer, Object> map = new HashMap<Integer, Object>();
				
				uploadFile = param.getBefore_uploadFile().get(0);
				if(!uploadFile.isEmpty()) {
					for(int i = 0; i<param.getBefore_uploadFile().size(); i++) {
						System.out.println("beforesize:::"+param.getBefore_uploadFile().size());
						List<Object> list = new ArrayList<Object>();
						uploadFile = param.getBefore_uploadFile().get(i);
						fileName = uploadFile.getOriginalFilename();
						uploadFile.transferTo(new File(before_path + fileName));
							
						list.add(param.getPreservation_idx());
						list.add(fileName);
						list.add(db_before_path);
						list.add("B");
						list.add(param.getReg_user());
						map.put(i, list);
					}
					
					int before_num = service.setPreservationImage(map);
				}
				
				uploadFile = param.getAfter_uploadFile().get(0);
				
				if(!uploadFile.isEmpty()) {
					for(int i = 0; i<param.getAfter_uploadFile().size(); i++) {
						List<Object> list = new ArrayList<Object>();
						uploadFile = param.getAfter_uploadFile().get(i);
						fileName = uploadFile.getOriginalFilename();
						if(!uploadFile.isEmpty()) {
							uploadFile.transferTo(new File(after_path + fileName));
						}
							
						list.add(param.getPreservation_idx());
						list.add(fileName);
						list.add(db_after_path);
						list.add("A");
						list.add(param.getReg_user());
						map.put(i, list);
					}
					
					int after_num = service.setPreservationImage(map);
				}
				result = "success";
			}
		return result;
	}
	
	@PostMapping("/updatePreservation.do")
	@ResponseBody
	public String updatePreservation(@ModelAttribute PreservationParamVO param,  HttpServletRequest req) throws Exception {
		System.out.println(param);
		MultipartFile uploadFile = null;
		String fileName = null;
		String result = "error";
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		param.setMod_user(userSessionId);
		uploadFile = param.getResult_uploadFile();
		fileName = uploadFile.getOriginalFilename();
		param.setFile_nm(fileName);
		param.setFile_path(db_result_path);
		int x = service.updatePreservation(param);
		
		if(!uploadFile.isEmpty()) {
			uploadFile.transferTo(new File(result_path + fileName));
		}
		
			if(x > 0) {
				Map<Integer, Object> map = new HashMap<Integer, Object>();
				uploadFile = param.getBefore_uploadFile().get(0);
				if(!uploadFile.isEmpty()) {
					for(int i = 0; i<param.getBefore_uploadFile().size(); i++) {
						List<Object> list = new ArrayList<Object>();
						uploadFile = param.getBefore_uploadFile().get(i);
						fileName = uploadFile.getOriginalFilename();
						uploadFile.transferTo(new File(before_path + fileName));
						
						list.add(param.getPreservation_idx());
						list.add(fileName);
						list.add(before_path);
						list.add("B");
						list.add(param.getReg_user());
						
						map.put(i, list);
					}
				
				int before_num = service.setPreservationImage(map);
				}
				
				uploadFile = param.getAfter_uploadFile().get(0);
				if(!uploadFile.isEmpty()) {
					for(int i = 0; i<param.getAfter_uploadFile().size(); i++) {
						List<Object> list = new ArrayList<Object>();
						uploadFile = param.getAfter_uploadFile().get(i);
						fileName = uploadFile.getOriginalFilename();
						
						if(!uploadFile.isEmpty()) {
							uploadFile.transferTo(new File(after_path + fileName));
						}
						
						list.add(param.getPreservation_idx());
						list.add(fileName);
						list.add(after_path);
						list.add("A");
						list.add(param.getReg_user());
						
						map.put(i, list);
					}
					
					int after_num = service.setPreservationImage(map);
				}
				result = "success";
			}
		return result;
	}
	
	@GetMapping("/getPreservation.do")
	public String getPreservation(Model model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<PreservationVO> list = service.getPreservationList(item_idx);
		for(int i=0; i<list.size(); i++) {
			List<PreservationImageVO> vo = service.getPreservationImageList(list.get(i).getPreservation_idx());
			list.get(i).setImage(vo);
		}
		model.addAttribute("preservationList", list);
		System.out.println(list);
		
		return "metadata/add/preservation/preservationList";
	}
	
	@PostMapping("/deletePreservationImage.do")
	@ResponseBody
	public String deletePreservationImage(Model model, @RequestParam("image_idx[]") List<String> image_idx) throws Exception {
		String result = "error";
		System.out.println(image_idx);
		int x = service.deletePreservationImage(image_idx);
		
		if(x > 0) result = "success";
		
		return result;
	}
	
	@GetMapping("/deletePreservation.do")
	@ResponseBody
	public String deletePreservationImage(Model model, @RequestParam("idx") String preservation_idx) throws Exception {
		String result = "error";
		System.out.println(preservation_idx);
		List<PreservationImageVO> vo = service.getPreservationImageList(preservation_idx);
		int x = service.deletePreservation(preservation_idx);
		int y = service.deleteImageAll(preservation_idx);
		
		for(int i=0; i<vo.size(); i++) {
			File file = new File(vo.get(i).getImage_path()+vo.get(i).getImage_nm());
			file.delete();
			System.out.println("삭제되었습니다");
		}
		
		if(x > 0) result = "success";
		
		return result;
	}

}
