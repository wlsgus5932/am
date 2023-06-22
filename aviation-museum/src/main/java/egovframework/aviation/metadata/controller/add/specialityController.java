package egovframework.aviation.metadata.controller.add;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.aviation.metadata.service.SpecialityService;
import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;
import egovframework.aviation.metadata.vo.param.SpecialityParamVO;
import egovframework.aviation.metadata.vo.speciality.SpecialityVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
public class specialityController {
	
	@Autowired
	private SpecialityService service;
	
	String filePath = "/files/speciality/";
	String DB_filepath = "/files/speciality/";
	//String filePath = "/files/";
	
	//전문정보 리스트
	@GetMapping("/getSpeciality.do")
	public String getSpeciality(ModelMap model, @ModelAttribute SpecialityParamVO param, @ModelAttribute Criteria cri) throws Exception {
		try {
			int perPageNum = service.getSpecialityCnt(param);
			if(param.getPerPageNum() != 0) {
				int criPerPageNum = param.getPerPageNum();
				cri.setPerPageNum(criPerPageNum);
			}
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(perPageNum);
		    param.setPageStart(cri.getPageStart());
		    param.setPerPageNum(cri.getPerPageNum());
			
			List<SpecialityVO> list = service.getSpeciality(param);
			model.addAttribute("specialityList", list);
			model.addAttribute("perPageNum", perPageNum);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			
		}
		return "metadata/add/speciality/specialityList";
	}
	
	//전문정보 검색
	@GetMapping("/getSpecialitySearch.do")
	public String getSpecialitySearch(ModelMap model, @ModelAttribute SpecialityParamVO param, @ModelAttribute Criteria cri) throws Exception {
		try {
			int perPageNum = service.getSpecialityCnt(param);
			if(param.getPerPageNum() != 0) {
				int criPerPageNum = param.getPerPageNum();
				cri.setPerPageNum(criPerPageNum);
			}
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(perPageNum);
		    param.setPageStart(cri.getPageStart());
		    param.setPerPageNum(cri.getPerPageNum());
			
			List<SpecialityVO> list = service.getSpeciality(param);
			model.addAttribute("specialityList", list);
			model.addAttribute("perPageNum", perPageNum);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			
		}
		return "metadata/add/speciality/specialitySearchList";
	}
	
	//전문정보 개별
	@GetMapping("/getSpecialityData.do")
	public String getSpecialityData(ModelMap model, @RequestParam("speciality_idx") int speciality_idx) throws Exception {
		try {
			List<SpecialityVO> list = service.getSpecialityData(speciality_idx);
			model.addAttribute("specialityList", list);
		} catch (Exception e) {
			
		}
		return "jsonView";
	}
	
	//전문정보 등록
	@PostMapping("/setSpeciality.do")
	@ResponseBody
	public String setSpecaility(@ModelAttribute SpecialityParamVO param, HttpServletRequest req) throws Exception {
		try {
			System.out.println("param::"+param);
			String fileName = null;
	        MultipartFile uploadFile = param.getSpc_uploadFile();
	        String userSessionId =  (String) req.getSession().getAttribute("userSessionId");
	        param.setReg_user(userSessionId);
	        
	        if (!uploadFile.isEmpty()) {
	            fileName = uploadFile.getOriginalFilename();
	            //String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
	            //UUID uuid = UUID.randomUUID(); // UUID 구하기
	            //fileName = uuid + "." + ext;
	            uploadFile.transferTo(new File(filePath + fileName));
	            param.setSpc_file_nm(fileName);
	            param.setSpc_file_path(DB_filepath);
	        }
	        
	        int x = service.setSpeciality(param);
	        
	        return "success";
		} catch (Exception e) {
			return "error";
		}
	}
	
	//전문정보 수정
	@PostMapping("/updateSpeciality.do")
	@ResponseBody
	public String updateSpecaility(@ModelAttribute SpecialityParamVO param) throws Exception {
		String result = "error";
		System.out.println(param);
		try {
			String fileName = null;
	        MultipartFile uploadFile = param.getSpc_uploadFile();
	        
	        if (!uploadFile.isEmpty()) {
	        	File file = new File(param.getSpc_file_path()+param.getSpc_file_nm());
				 file.delete();
				
	            fileName = uploadFile.getOriginalFilename();
	            uploadFile.transferTo(new File(filePath + fileName));
	            param.setSpc_file_nm(fileName);
	            param.setSpc_file_path(DB_filepath);
	        }
	        int x = service.updateSpeciality(param);
	        if(x != 0) {
	        	result = "success";
	        }
	        return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	//전문정보 삭제
	@PostMapping("/deleteSpeciality.do")
	@ResponseBody
	public String deleteSpecialityCode(@ModelAttribute SpecialityParamVO param) throws Exception {
		String result = "error";
		try {
			int x = service.deleteSpeciality(param);
			
			if(x > 0) {
				File file = new File(filePath+param.getSpc_file_nm());
				//서버용 File file = new File(param.getSpc_file_path()+param.getSpc_file_nm());
				file.delete();
				result = "success";
			}
			
			return result;
		} catch (Exception e) {
			return result;
		}
	}
	
	@GetMapping("/getSpecialitySc.do")
	public String getSpecialitySc(ModelMap model, @ModelAttribute SpecialityParamVO param, @ModelAttribute Criteria cri) throws Exception {
		try {
			int perPageNum = service.getSpecialityCnt(param);
			if(param.getPerPageNum() != 0) {
				int criPerPageNum = param.getPerPageNum();
				cri.setPerPageNum(criPerPageNum);
			}
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(perPageNum);
		    param.setPageStart(cri.getPageStart());
		    param.setPerPageNum(cri.getPerPageNum());
			
			List<SpecialityVO> list = service.getSpeciality(param);
			model.addAttribute("specialityList", list);
			model.addAttribute("perPageNum", perPageNum);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			
		}
		return "metadata/add/speciality/specialityListSc";
	}
	
	@GetMapping("/getSpecialitySearchSc.do")
	public String getSpecialitySearchSc(ModelMap model, @ModelAttribute SpecialityParamVO param, @ModelAttribute Criteria cri) throws Exception {
		try {
			int perPageNum = service.getSpecialityCnt(param);
			if(param.getPerPageNum() != 0) {
				int criPerPageNum = param.getPerPageNum();
				cri.setPerPageNum(criPerPageNum);
			}
			PageMaker pageMaker = new PageMaker();
		    pageMaker.setCri(cri);
		    pageMaker.setTotalCount(perPageNum);
		    param.setPageStart(cri.getPageStart());
		    param.setPerPageNum(cri.getPerPageNum());
			
			List<SpecialityVO> list = service.getSpeciality(param);
			model.addAttribute("specialityList", list);
			model.addAttribute("perPageNum", perPageNum);
			model.addAttribute("pageMaker", pageMaker);
		} catch (Exception e) {
			
		}
		return "metadata/add/speciality/specialitySearchListSc";
	}
	
	
	

}
