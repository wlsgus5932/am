
package egovframework.aviation.metadata.controller.add;

import java.awt.Image;
import java.awt.RenderingHints;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import devpia.dextuploadnj.CompressUtil;
import devpia.dextuploadnj.FileItem;
import devpia.dextuploadnj.FileSaveOption;
import devpia.dextuploadnj.media.ImageTool;
import devpia.dextuploadnj.support.spring.DEXTUploadNJFileDownloadView;
import egovframework.aviation.metadata.service.FileRepository;
import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.service.impl.ImageMapper;
import egovframework.aviation.metadata.vo.DEXTUploadX5Request;
import egovframework.aviation.metadata.vo.image.FileEntity;
import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
public class ImageController {
	@Autowired
	private ImageService service;
	
	@Autowired
	private ImageMapper mapper;
	
//	String imagePath = "D:\\uploadtest\\images\\";
// String thumbnailPath = "D:\\uploadtest\\images\\thumbnails\\";
	String imagePath = "/images/";
    String thumbnailPath = "/images/thumbnails/";
    String DBimagepath = "/images/";
    
	@PostMapping("/getImage.do")
	public String getImage(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getImageListCnt(param.getItem_idx());		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = service.getImage(param);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/imageThumb";
	}
	
	@PostMapping("/getImageList.do")
	public String getImageList(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getImageListCnt(param.getItem_idx());		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = service.getImage(param);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/imageList";
	}
	
	@PostMapping("/getMainImageList.do")
	public String getMainImageList(Model model, @ModelAttribute ImageParamVO param) throws Exception {
		List<ImageVO> list = service.getImageAll(param);
		model.addAttribute("mainImageList", list);
		System.out.println("main:::"+list);
		
		return "metadata/add/mainImageList";
	}
	
	@PostMapping("/getImageListJson.do")
	public String getImageListJson(Model model, @ModelAttribute ImageParamVO param) throws Exception {
		List<ImageVO> list = service.getImageAll(param);
		model.addAttribute("imageList", list);
		
		return "jsonView";
	}
	
	@PostMapping("/getImageListExcel.do")
	public String getImageListExcel(Model model, @ModelAttribute ImageParamVO param) throws Exception {
		List<ImageVO> list = service.getImageExcel(param);
		model.addAttribute("imageList", list);
		
		return "metadata/add/imageListExcel";
	}
	
	@GetMapping("/setPublicrep.do")
	@ResponseBody
	public String setPublicrep(Model model, @RequestParam("image_idx") int image_idx, 
			@RequestParam("colunm") String colunm, @RequestParam("val") String val) throws Exception {
		System.out.println(image_idx + val + colunm);
		String result = "error";
		int x = service.setPublicrep(image_idx, colunm, val);
		
		if(x != 0) {
			result = "success";
			return result;
		}
		
		return result;
	}
	
	@GetMapping("/updateRep.do")
	@ResponseBody
	public String updateRep(Model model, @RequestParam("image_idx") int image_idx, @RequestParam("idx") int item_idx, @RequestParam("val") String val) throws Exception {
		System.out.println("dddd"+image_idx+","+item_idx);
		String result = "error";
		if(val.equals("Y")) {
			int y = mapper.updateNoRep(item_idx);			
		}
		int x = service.updateRep(image_idx, val);
		
		if(x != 0) {
			result = "success";
			return result;
		}
		
		return result;
	}
	   
	// 대용량 파일 업로드 로컬용
	   @PostMapping(value = "/extension-upload.ext")
	   public void extensionupload(DEXTUploadX5Request x5, @RequestParam("item_idx") String item_idx, @RequestParam("possession_code_idx") String possession_code_idx, @RequestParam("org_code_idx") String org_code_idx, HttpServletResponse response) throws IOException {
		      String path = null;
		      Image image = null;
		      File dir = new File(imagePath);
		      File dir2 = new File(thumbnailPath);
		      //File dir_thum = new File(thumbnailPath2);
		      
		      FileItem item = (FileItem) x5.getDEXTUploadX5_FileData().get(0);
		      FileSaveOption option = new FileSaveOption();

		      if (!item.isEmpty()) {
		    	  if(!dir.exists()) {
		    		  try {
		    			  boolean result = dir.mkdir();
					} catch (Exception e) {
						System.out.println(e);
					}
		    	  }
			    	  if(!dir2.exists()) {
			    		  try {
			    			  boolean result = dir2.mkdir();
						} catch (Exception e) {
							System.out.println(e);
						}
			    	  }
	         option.setTargetDirectoryPath(imagePath);
	         boolean isImg = ImageTool.isImage(item);
	         path = item.save(option);
	         if (isImg) {
	            image = new ImageIcon(item.getLastSavedFilePath()).getImage();
	            ImageTool oimg = ImageTool.getInstance(new File(item.getLastSavedFilePath()));
	            int final_width = image.getWidth(null);
	            int final_height = image.getHeight(null);
	            if(final_width > 800 && final_height > 600) {
	            	final_height = 600;
	            	final_width = 800;
	            }
	            if(final_width > 800) {
	            	double per = 800.0/(double)final_width;
	            	final_width = 800;
	            	final_height = (int)(per * final_height);
	            } else if (final_height > 600) {
	            	double per = 600/(double)final_height;
	            	final_height = 600;
	            	final_width = (int)(per * final_width);
	            };
	            
	            ImageTool dimg = oimg.resize(final_width, final_height, RenderingHints.VALUE_INTERPOLATION_BILINEAR, true);
	            dimg.save(new File(thumbnailPath, "thumbnail_".concat(item.getLastSavedFilename())),
	            oimg.getFormat());
	         }
	         System.out.println("image::::"+image.getWidth(null));
	         ImageVO list = new ImageVO();
	         list.setItem_idx(item_idx);
	         list.setImage_nm(item.getLastSavedFilename());
	         list.setOrignl_nm("origin");
	         list.setThumbnail_nm("thumbnail_"+item.getLastSavedFilename());
	         list.setImage_path(DBimagepath);
	         list.setImage_width(image.getWidth(null));
	         list.setImage_height(image.getHeight(null));
	         list.setRep_image("N");
	         list.setFile_size(item.getFileSize());
	         list.setPublic_service("N");
	         
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
	      File zippedFiles = zipper.zip(files, new File("/images/zip"), "UTF-8", false, true);
	      
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
	public String deleteImage(@ModelAttribute ImageParamVO param) throws Exception {
		System.out.println(param);
		String result = "error";
		List<ImageVO> list = mapper.getImageData(param);
		System.out.println(list);
		
	     
	     for(int i=0; i<list.size(); i++) {
	    	 System.out.println("진입");
	    	 File deleteFile = new File(imagePath+list.get(i).getImage_nm());
	    	 File deleteThumb = new File(thumbnailPath+list.get(i).getThumbnail_nm());
	    	 // 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
	    	 
	    	 boolean delete1 = deleteFile.delete();
	    	 boolean delete2 = deleteThumb.delete();
	    	 System.out.println(delete1+","+delete2);
	    	 
	     }
		try {
			int x = service.deleteImage(param);
			if(x > 0) {
				result = "success";
			}
			return result;
		}  catch (Exception e) {
			 System.out.println(e);
			 return result;
		}
	}
	
	@PostMapping("/updateImageDesc.do")
	@ResponseBody
	public String updateImageDesc(@ModelAttribute ImageParamVO param) throws Exception {
		String result = "error";
		System.out.println(param);
		try {
			int x = service.updateImageDesc(param);
			if(x > 0) {
				result = "success";
			}
			return result;
		}  catch (Exception e) {
			 System.out.println(e);
			 return result;
		}
	}
	
	@PostMapping("/getImageSc.do")
	public String getImageSc(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getImageListCnt(param.getItem_idx());		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = service.getImage(param);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/imageThumbSc";
	}
	
	@PostMapping("/getImageListSc.do")
	public String getImageListSc(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = service.getImageListCnt(param.getItem_idx());		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = service.getImage(param);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/imageListSc";
	}

}
