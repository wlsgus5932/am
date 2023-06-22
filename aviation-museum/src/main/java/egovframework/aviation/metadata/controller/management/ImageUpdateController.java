package egovframework.aviation.metadata.controller.management;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.aviation.metadata.service.ImageService;
import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.metadata.vo.image.ImageVO;
import egovframework.aviation.metadata.vo.param.ImageParamVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;

@Controller
public class ImageUpdateController {
	
	@Autowired
	private MetaDataService metaDataService;
	
	@Autowired
	private ImageService imageService;
	
	//이미지수정 페이지 진입
	@GetMapping("/imageUpdate.do")
	public String imageUpdate(Model model) throws Exception {
		List<PosSessionVO> possession = metaDataService.getPosSession();
		List<OrgVO> org = metaDataService.getOrg();
		
		model.addAttribute("orgList", org);
		model.addAttribute("posSessionList", possession);
		return "metadata/management/imageUpdate/imageUpdate";
	}
	
	//이미지 리스트
	@PostMapping("/getImageUpdateList.do")
	public String getImageList(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		System.out.println(param);
		int perPageNum = imageService.getImageIUpdateListCnt(param);		
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		param.setReg_state("Y");
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = imageService.getImageIUpdateList(param);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/management/imageUpdate/imageUpdateList";
	}
	
	

}
