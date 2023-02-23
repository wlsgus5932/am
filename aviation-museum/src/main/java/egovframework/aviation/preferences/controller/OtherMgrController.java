package egovframework.aviation.preferences.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.group.vo.GroupVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.OtherMgrService;
import egovframework.aviation.preferences.vo.ExchnRateVO;
import egovframework.aviation.preferences.vo.TagVO;
import egovframework.aviation.user.vo.UserJoinVO;

@Controller
public class OtherMgrController {

	@Autowired
	private OtherMgrService otherMgrService;
	
	/** 기타 관리 메인 */
	@GetMapping("/otherMgr.do")
	public String OtherMgr(HttpServletRequest req) throws Exception {

		return "preferences/otherMgr/otherMgr_Main";
	}
	
	/** 태그 관리 조회 */
	@RequestMapping("/tagListAjax.do")
	public String TagListAjaxtagListAjax(@ModelAttribute("tagVO") TagVO tagVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {

		int perPageNum = otherMgrService.getTagListCnt(tagVO);		
		if(tagVO.getPerPageNum() != 0) {
			int criPerPageNum = tagVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    tagVO.setPageStart(cri.getPageStart());
	    tagVO.setPerPageNum(cri.getPerPageNum());

		List<TagVO> tagList = otherMgrService.getTagList(tagVO);
    	model.addAttribute("tagList", tagList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
		
		return "preferences/otherMgr/otherMgr_TagList";
	}
	
	/** 태그 등록 중복체크 */
	@RequestMapping(value = "/tagDuplicateCheck.do")
    public String TagDuplicateCheck(HttpServletRequest req, @ModelAttribute("tagVO") TagVO tagVO, Model model) throws Exception {

		List<TagVO> tagListView = otherMgrService.getTagDuplicateCheck(tagVO);
		String result = "";
		
		if(tagListView.size() >0) {
			 result = "success";
			 tagVO.setResult(result);
		}
        return "jsonView";
    } 
	
	/** 태그 등록 */
	@RequestMapping(value = "/tagInsert.do")
    public String TagInsert(HttpServletRequest req, @ModelAttribute("tagVO") TagVO tagVO, Model model) throws Exception {

		tagVO.setReg_user("test");
		
		int result = otherMgrService.insertTag(tagVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    }   
	
	/** 태그 수정 팝업 */
	@RequestMapping(value = "/tagModPopupAjax.do")
    public String tagModPopupAjax(HttpServletRequest req, @ModelAttribute("tagVO") TagVO tagVO, Model model) throws Exception {
		
		tagVO.setMod_user("test");
		
		tagVO.setPerPageNum(1);
		List<TagVO> tagListView = otherMgrService.getTagList(tagVO);
		if(tagListView.size() >0) {
			tagVO.setTag_idx(tagListView.get(0).getTag_idx());	
			tagVO.setTag_nm(tagListView.get(0).getTag_nm());
			tagVO.setEnabled(tagListView.get(0).getEnabled());	
		}
    	
        return "jsonView";
    }    
	
	/** 태그 수정 */
	@RequestMapping(value = "/tagUpdate.do")
    public String TagUpdate(HttpServletRequest req, @ModelAttribute("tagVO") TagVO tagVO, Model model) throws Exception {
		
		tagVO.setReg_user("test");
		
		int result = otherMgrService.updateTag(tagVO);
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** 태그 삭제 */
	@RequestMapping(value = "/tagDelete.do")
    public String TagDelete(HttpServletRequest req, @ModelAttribute("tagVO") TagVO tagVO, Model model) throws Exception {
		int result = otherMgrService.deleteTag(tagVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
	
	/** 환률정보 관리 조회 */
	@RequestMapping("/exchnRateListAjax.do")
	public String ExchnRateListAjax(@ModelAttribute("exchnRateVO") ExchnRateVO exchnRateVO, @ModelAttribute("groupVO") GroupVO groupVO, Model model, HttpServletRequest req, @ModelAttribute("criteria") Criteria cri) throws Exception {
		
		int perPageNum = otherMgrService.getExchnRateListCnt(exchnRateVO);		
		if(exchnRateVO.getPerPageNum() != 0) {
			int criPerPageNum = exchnRateVO.getPerPageNum();
			cri.setPerPageNum(criPerPageNum);
		}
		PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(perPageNum);
		    
	    exchnRateVO.setPageStart(cri.getPageStart());
	    exchnRateVO.setPerPageNum(cri.getPerPageNum());

		List<ExchnRateVO> exchnRateList = otherMgrService.getExchnRateList(exchnRateVO);
    	model.addAttribute("exchnRateList", exchnRateList);
    	model.addAttribute("perPageNum", perPageNum);
    	model.addAttribute("pageMaker", pageMaker);
    	
		return "preferences/otherMgr/otherMgr_ExchnRate";
	}
	
	/** 환률정보 등록 */
	@RequestMapping(value = "/exchnRateInsert.do")
    public String ExchnRateInsert(HttpServletRequest req, @ModelAttribute("exchnRateVO") ExchnRateVO exchnRateVO, Model model) throws Exception {

		exchnRateVO.setReg_user("test");
		int result = 0;
		
		if(exchnRateVO.getEnabled().equals("Y")) {
			//Enabled all 'N' update
			otherMgrService.setExchnRateAllEnabledMod(exchnRateVO);			
			result = otherMgrService.insertExchnRate(exchnRateVO);
			if(result > 0) {
				exchnRateVO.setResult("success");
			}
		}else {
			result = otherMgrService.insertExchnRate(exchnRateVO);
			if(result > 0) {
				exchnRateVO.setResult("success");
			}
		}

        return "jsonView";
    }   
	
	/** 환률정보 수정 팝업 */
	@RequestMapping(value = "/exchnRateModPopupAjax.do")
    public String ExchnRateModPopupAjax(HttpServletRequest req, @ModelAttribute("exchnRateVO") ExchnRateVO exchnRateVO, Model model) throws Exception {
				
		exchnRateVO.setPerPageNum(1);
		List<ExchnRateVO> exchRateListView = otherMgrService.getExchnRateList(exchnRateVO);
		if(exchRateListView.size() >0) {
			exchnRateVO.setExchange_rate_idx(exchRateListView.get(0).getExchange_rate_idx());	
			exchnRateVO.setProvider_nm(exchRateListView.get(0).getProvider_nm());
			exchnRateVO.setService_url(exchRateListView.get(0).getService_url());
			exchnRateVO.setSeq(exchRateListView.get(0).getSeq());
			exchnRateVO.setEnabled(exchRateListView.get(0).getEnabled());	
		}
    	
        return "jsonView";
    }    
	
	/** 환률정보 수정 */
	@RequestMapping(value = "/exchnRateUpdate.do")
    public String ExchnRateUpdate(HttpServletRequest req, @ModelAttribute("exchnRateVO") ExchnRateVO exchnRateVO, Model model) throws Exception {
		
		exchnRateVO.setMod_user("test");
		int result = 0;
		
		if(exchnRateVO.getEnabled().equals("Y")) {
			//Enabled all 'N' update
			otherMgrService.setExchnRateAllEnabledMod(exchnRateVO);			
			result = otherMgrService.updateExchnRate(exchnRateVO);
			if(result > 0) {
				exchnRateVO.setResult("success");
			}
		}else {
			result = otherMgrService.updateExchnRate(exchnRateVO);
			if(result > 0) {
				exchnRateVO.setResult("success");
			}
		}

        return "jsonView";
    } 
	
	/** 환률정보 삭제 */
	@RequestMapping(value = "/exchnRateDelete.do")
    public String ExchnRateDelete(HttpServletRequest req, @ModelAttribute("exchnRateVO") ExchnRateVO exchnRateVO, Model model) throws Exception {
		int result = otherMgrService.deleteExchnRate(exchnRateVO);
		
		String success = "";
		
		if(result > 0) {
			 success = "success";
		}
        return "jsonView";
    } 
}
