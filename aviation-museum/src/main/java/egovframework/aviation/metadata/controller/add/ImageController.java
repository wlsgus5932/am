package egovframework.aviation.metadata.controller.add;

import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

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
import devpia.dextuploadnj.FileItem;
import devpia.dextuploadnj.FileSaveOption;
import devpia.dextuploadnj.media.ImageTool;
import devpia.dextuploadnj.support.spring.DEXTUploadNJFileDownloadView;
import egovframework.aviation.metadata.service.FileRepository;
import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.vo.DEXTUploadX5Request;
import egovframework.aviation.metadata.vo.image.FileEntity;
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
	
	@PostMapping("/uploadImage.do")
	   public void uploadImage(DEXTUploadX5Request x5, HttpServletResponse response) throws Exception {
	      FileItem item = null;
	      for (MultipartFile file : x5.getDEXTUploadX5_FileData()) {
	         item = (FileItem) file;

	         if (!item.isEmpty()) {
	            item.save("D:\\uploadtest\\images");
	         }
	      }
	   }

	   // 대용량 파일 업로드
	   @PostMapping(value = "/extension-upload.ext")
	   public void extensionupload(DEXTUploadX5Request x5, @RequestParam("item_idx") String item_idx, HttpServletResponse response) throws IOException {

	      String path = null;
	      Image image = null;
	      
	      FileItem item = (FileItem) x5.getDEXTUploadX5_FileData().get(0);
	      FileSaveOption option = new FileSaveOption();

	      if (!item.isEmpty()) {
	         option.setTargetDirectoryPath("D:\\uploadTest\\images");
	         boolean isImg = ImageTool.isImage(item);
	         path = item.save(option);

	         if (isImg) {
	            image = new ImageIcon(item.getLastSavedFilePath()).getImage();
	            ImageTool oimg = ImageTool.getInstance(new File(item.getLastSavedFilePath()));
	            ImageTool dimg = oimg.resize(64, 64, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
	            dimg.save(new File("D:\\uploadtest\\images\\thumbnails", "thumbnail_".concat(item
	                  .getFilenameWithoutExtension().concat(".").concat(oimg.getFormat().toString().toLowerCase()))),
	                  oimg.getFormat());
	         }
	         ImageVO list = new ImageVO();   
	         list.setItem_idx(item_idx);
	         list.setImage_nm(item.getLastSavedFilename());
	         list.setOrignl_nm("origin");
	         list.setThumbnail_nm("thumbnail_"+item.getFilename());
	         list.setImage_path(item.getLastSavedFilePath());
	         list.setImage_width(image.getWidth(null));
	         list.setImage_height(image.getHeight(null));
	         list.setRep_image("N");
	         list.setFile_size(item.getFileSize());
	         list.setPublic_service("N");
	         
	         System.out.println(list);

	         int x = service.setImage(list);

	         response.setCharacterEncoding("UTF-8");
	         response.setContentType("text/plain");
	         // 파일의 키를 응답 데이터에 기록한다.
	         response.getWriter().write(path);
	      } else {
	         throw new IllegalStateException("올바른 요청이 아닙니다.");
	      }
	   }
	   
	   
	   @PostMapping("/zip-download.do")
	   @ResponseBody
	   public String makeCompressedFile(@RequestParam("img_path[]") List<String> path, HttpServletResponse response, HttpServletRequest request) throws Exception {
//	      String fileRoot = request.getSession().getServletContext().getRealPath("/");
	      
	      List<File> files = new ArrayList<File>();
	      if(!path.isEmpty()) {
	         System.out.println("파일 갯수: " + path.size());
	         System.out.println("파일 리스트: " + path);
	         for(String p : path) {
	            p = URLDecoder.decode(p, "UTF-8");
	            System.out.println("파일경로: " + p);
	            files.add(new File(p));
	         }
	      }
	      
	      CompressUtil zipper = new CompressUtil();
//	      DEXTUploadNJFilesToZipDownloadView view = new DEXTUploadNJFilesToZipDownloadView();
//	      view.setEntries(files);
//	      view.setCharsetName("UTF-8");
	      File zippedFiles = zipper.zip(files, new File("D://uploadtest/images/zip"), "UTF-8", false, true);
	      
	      FileEntity target = new FileEntity();
	      target.setMime("application/x-zip-compressed");
	      target.setFilename(zippedFiles.getName());
	      target.setFile(zippedFiles);
	      target.setSize(zippedFiles.length());
	      
	      String compresskey = FileRepository.addFileEntity(target);
	      
//	      response.setContentType("text/plain");
//	      response.getWriter().write(request.getRequestURL().append("?compresskey=".concat(compresskey)).toString());
	      return compresskey;
	   }
	   
	   @GetMapping(value = "/zip-download.do")
	   public ModelAndView downloadCompressedFile(@RequestParam(value = "compresskey") String key, HttpServletResponse response) throws IOException {
	      FileEntity target = FileRepository.getFileEntity(key);
	      System.out.println("zip다운로드중");      
	      
	      if (target != null) {
	         DEXTUploadNJFileDownloadView dextnj = new DEXTUploadNJFileDownloadView();
	         dextnj.setFile(target.getFile());
	         dextnj.setFilename("항공박물관 이미지.zip");
	         dextnj.setCharsetName("UTF-8");
	         dextnj.setMime(target.getMime());
	         dextnj.setAllowingWeakRange(false);
	         dextnj.setUseClientCache(false);
	         dextnj.setRemoveAfterDownloading(true);
	         return new ModelAndView(dextnj);
	      } else {
	         response.sendError(HttpServletResponse.SC_NOT_FOUND, "주어진 키에 해당하는 파일 정보가 없습니다.");
	         return null;
	      }
	   }
	
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
