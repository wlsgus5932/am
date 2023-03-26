package egovframework.aviation.metadata.controller.add;

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
public class ImageRegisterController {
	@Autowired
	private MetaDataService metaDataService;
	
	@Autowired
	private ImageService imageService;
	
	@GetMapping("/imageRegister.do")
	public String imageRegister(Model model) throws Exception {
		List<PosSessionVO> possession = metaDataService.getPosSession();
		List<OrgVO> org = metaDataService.getOrg();
		
		model.addAttribute("orgList", org);
		model.addAttribute("posSessionList", possession);
			return "metadata/add/imageRegister";
	}
	
	@PostMapping("/getImageRegisterList.do")
	public String getImageList(Model model, @ModelAttribute ImageParamVO param, @ModelAttribute Criteria cri) throws Exception {
		int perPageNum = imageService.getImageIUpdateListCnt(param);
		System.out.println(perPageNum);
		if(param.getPerPageNum() != 0) {
			int criPerPageNum = param.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		
	    param.setReg_state("N");
	    param.setPageStart(cri.getPageStart());
	    param.setPerPageNum(cri.getPerPageNum());
		List<ImageVO> list = imageService.getImageIUpdateList(param);
		System.out.println(pageMaker);
		model.addAttribute("imageList", list);
		model.addAttribute("perPageNum", perPageNum);
		model.addAttribute("pageMaker", pageMaker);
		
		return "metadata/add/imageRegisterList";
	}

}
