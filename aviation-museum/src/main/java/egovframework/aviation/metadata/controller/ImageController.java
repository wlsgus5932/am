package egovframework.aviation.metadata.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
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

import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;

@Controller
public class ImageController {
	@Autowired
	private ImageService service;
	
	@GetMapping("/getImage.do")
	public String getImage(Model model, @RequestParam("item_idx") int item_idx) throws Exception {
		List<ImageVO> list = service.getImage(item_idx);
		model.addAttribute("imageList", list);
		
		return "jsonView";
	}
	
	@GetMapping("/setPublicrep.do")
	@ResponseBody
	public String setPublicrep(Model model, @RequestParam("image_idx") int image_idx, 
			@RequestParam("colunm") String colunm, @RequestParam("val") String val) throws Exception {
		String result = "error";
		int x = service.setPublicrep(image_idx, colunm, val);
		
		if(x != 0) {
			result = "success";
			return result;
		}
		
		return result;
	}
	
	@PostMapping("/addImage.do")
	@ResponseBody
	public String addImage(@ModelAttribute ImageParamVO param, HttpServletRequest request) throws Exception {
//		List<ImageVO> list = new ArrayList<ImageVO>();
		ImageVO list = new ImageVO();
		
		System.out.println(param);
		MultipartFile uploadFile = param.getImage_upload_file();
		
        BufferedImage image = ImageIO.read(uploadFile.getInputStream());
        int width = image.getWidth();
        int height = image.getHeight();
        long file_size = uploadFile.getSize();
        System.out.println(file_size);
        Random random = new Random();
        int ran = random.nextInt(10000);
        
        String fileNm = "test.png";
        String thum_nm = "thum_test.png";
        String originFileNm = "origin";
        
        String image_path = "http://localhost:8080/images/";
        String thum_path = "http://localhost:8080/images/images/thumbnails/";
        
        String addImage = "D:\\uploadtest\\images\\";
        String addThumImage = "D:\\uploadtest\\images\\thumbnails";
        
        list.setItem_idx(param.getItem_idx());
        list.setImage_nm(ran+fileNm);
        list.setOrignl_nm(originFileNm);
        list.setImage_path(image_path);
        list.setThumbnail_nm(thum_nm);
        list.setImage_path(image_path);
        list.setImage_width(width);
        list.setImage_height(height);
        list.setRep_image("N");
        list.setFile_size(file_size);
        list.setPublic_service("N");
        //list.get(0).setReg_user(thum_nm);
        System.out.println(list);
        
        int x = service.setImage(list);
        
//        uploadFile.transferTo(new File(image_path + ran + fileNm));
        uploadFile.transferTo(new File(addImage + ran + fileNm));
        uploadFile.transferTo(new File(addThumImage + ran + thum_nm));
		try {
			
			
			return "success";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "error";
		}
	}
	
//	@PostMapping("/addImage.do")
//	@ResponseBody
//	public String addImage(HttpServletRequest request) throws Exception {
//		System.out.println(request);
//		FileUpload dextnj = null;
//		  String path = null;
//
//		  dextnj = new FileUpload(request);
//		  dextnj.prepare();
//		  System.out.println(dextnj);
//
////		Environment env = new Environment();
////		env.setLicenseAuthKey("L8yzkuoGnxL2dLIGWVoK4/17Q5lPVj3Yv39u7eflwENdpNmrRiFx/i1LkDSMFNij/LLwZ56dusfG/x9Aw/VhpKiVRDYCoMNvZa5VIQ1dk7Hj13o8GdPlbT5scryBV3iq");
////		env.setTempRepository("D:\\uploadtest\\images\\");
////		FileUpload dextnj = new FileUpload(request, env);
////		dextnj.prepare();
////		List<FileItem> items = dextnj.getFileItems();
//		
//		
//		return "success";
//	}
	
	@PostMapping("/deleteImage.do")
	@ResponseBody
	public String deleteImage(@RequestParam("image_idx") List<String> values) throws Exception {
//		List<ImageVO> list = new ArrayList<ImageVO>();
		System.out.println(values);
		try {
			int x = service.deleteImage(values);
			
			return "success";
		}  catch (Exception e) {
			 System.out.println(e);
			 return "error";
		}
	}

}
