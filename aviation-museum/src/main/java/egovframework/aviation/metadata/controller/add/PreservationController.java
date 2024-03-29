package egovframework.aviation.metadata.controller.add;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.aviation.metadata.service.PreservationService;
import egovframework.aviation.metadata.service.impl.PreservationMapper;
import egovframework.aviation.metadata.vo.ItemBaseVO;
import egovframework.aviation.metadata.vo.metadata.PreservationImageVO;
import egovframework.aviation.metadata.vo.metadata.PreservationVO;
import egovframework.aviation.metadata.vo.param.PreservationParamVO;

@Controller
public class PreservationController {
	@Autowired
	private PreservationService service;
	
	@Autowired
	private PreservationMapper mapper;
	
//	String result_path = "D:/uploadtest/images/preservation/result-img/";
////	String result_path = "/images/preservation/result-img/";
//	String db_result_path = "/images/preservation/result-img/";
//	
//	String before_path = "D:/uploadtest/images/preservation/before-img/";
////	String before_path = "/images/preservation/before-img/";
//	String db_before_path = "/images/preservation/before-img/";
//	
//	String after_path = "D:/uploadtest/images/preservation/after-img/";
////	String after_path = "/images/preservation/after-img/";
//	String db_after_path = "/images/preservation/after-img/";
	
	
	//보존처리 등록
	@PostMapping("/addPreservation.do")
	@ResponseBody
	public String addPreservation(@ModelAttribute PreservationParamVO param, HttpServletRequest req) throws Exception {
		MultipartFile uploadFile = null;
		String fileName = null;
		
		List<ItemBaseVO> dsf = mapper.getPreservationItemBase(param.getItem_idx());
		String result_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/result-img/";
		String before_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/before-img/";
		String after_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/after-img/";
		
		String result = "error";
		
		uploadFile = param.getResult_uploadFile();
		fileName = uploadFile.getOriginalFilename();
		param.setFile_nm(fileName);
		
		File file = new File(result_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		file = new File(before_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		file = new File(after_path);
		if(!file.exists()) {
			file.mkdirs();
		}
		
		param.setFile_path(result_path);
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
	
	//보존처리 수정
	@PostMapping("/updatePreservation.do")
	@ResponseBody
	public String updatePreservation(@ModelAttribute PreservationParamVO param,  HttpServletRequest req) throws Exception {
		System.out.println(param);
		MultipartFile uploadFile = null;
		String fileName = null;
		String result = "error";
		
		List<ItemBaseVO> dsf = mapper.getPreservationItemBase(param.getItem_idx());
		String result_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/result-img/";
		String before_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/before-img/";
		String after_path = "/images/" + dsf.get(0).getOrg_code_idx() + "/" + dsf.get(0).getPossession_code_idx() + "/preservation/after-img/";
		
		
		String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
		param.setMod_user(userSessionId);
		uploadFile = param.getResult_uploadFile();
		fileName = uploadFile.getOriginalFilename();
		param.setFile_nm(fileName);
		param.setFile_path(result_path);
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
	
	//보존처리 리스트
	@GetMapping("/getPreservation.do")
	public String getPreservation(Model model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<PreservationVO> list = service.getPreservationList(item_idx);
		for(int i=0; i<list.size(); i++) {
			List<PreservationImageVO> vo = service.getPreservationImageList(list.get(i).getPreservation_idx());
			list.get(i).setImage(vo);
		}
		model.addAttribute("preservationList", list);
		return "metadata/add/preservation/preservationList";
	}
	
	//보존처리 리스트
	@GetMapping("/getPreservationSc.do")
	public String getPreservationSc(Model model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<PreservationVO> list = service.getPreservationList(item_idx);
		for(int i=0; i<list.size(); i++) {
			List<PreservationImageVO> vo = service.getPreservationImageList(list.get(i).getPreservation_idx());
			list.get(i).setImage(vo);
		}
		model.addAttribute("preservationList", list);
		
		return "metadata/add/preservation/preservationListSc";
	}
	
	//보존처리 이미지 삭제
	@PostMapping("/deletePreservationImage.do")
	@ResponseBody
	public String deletePreservationImage(Model model, @RequestParam("image_idx[]") List<String> image_idx) throws Exception {
		String result = "error";
		int x = service.deletePreservationImage(image_idx);
		if(x > 0) result = "success";
		
		return result;
	}
	
	//보존처리 삭제
	@GetMapping("/deletePreservation.do")
	@ResponseBody
	public String deletePreservationImage(Model model, @RequestParam("idx") String preservation_idx) throws Exception {
		String result = "error";
		List<ItemBaseVO> ibVO = mapper.getPreservationItemBase2(preservation_idx);
		List<PreservationImageVO> vo = service.getPreservationImageList(preservation_idx);
		int x = service.deletePreservation(preservation_idx);
		int y = service.deleteImageAll(preservation_idx);
		
		String result_path = "/images/" + ibVO.get(0).getOrg_code_idx() + "/" + ibVO.get(0).getPossession_code_idx() + "/preservation/result-img/";
		String before_path = "/images/" + ibVO.get(0).getOrg_code_idx() + "/" + ibVO.get(0).getPossession_code_idx() + "/preservation/before-img/";
		String after_path = "/images/" + ibVO.get(0).getOrg_code_idx() + "/" + ibVO.get(0).getPossession_code_idx() + "/preservation/after-img/";
		
		File file = null;
		for(int i=0; i<vo.size(); i++) {
			switch (vo.get(i).getImage_state()) {
				case "A": 
					file = new File(after_path+vo.get(i).getImage_nm());
					file.delete();
					break;
					
				case "B":
					file = new File(before_path+vo.get(i).getImage_nm());
					file.delete();
					break;
			}
		}
		
		if(x > 0) result = "success";
		
		return result;
	}

}
