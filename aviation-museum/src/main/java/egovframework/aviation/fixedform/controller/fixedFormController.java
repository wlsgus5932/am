package egovframework.aviation.fixedform.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.aviation.fixedform.service.FixedFormService;
import egovframework.aviation.fixedform.vo.DataCardBackVO;
import egovframework.aviation.fixedform.vo.FixedFormVO;
import egovframework.aviation.metadata.service.MetaDataService;
import egovframework.aviation.metadata.vo.CountryVO;
import egovframework.aviation.metadata.vo.OrgVO;
import egovframework.aviation.metadata.vo.PosSessionVO;
import egovframework.aviation.mypage.vo.RequestHistoryVO;
import egovframework.aviation.paging.Criteria;
import egovframework.aviation.paging.PageMaker;
import egovframework.aviation.preferences.service.ApprovalMgrService;

@Controller
public class fixedFormController {
	
	@Autowired
	private FixedFormService fixedFormService;
	@Autowired
	private MetaDataService metaDataService;
	
	@RequestMapping(value = "/fixedForm.do")
	public String addMetaData(HttpServletRequest req, Model model) throws Exception {
		model.addAttribute("session", req.getSession().getId());
		return "fixedForm/fixedForm_Main";
	}
	
	/** 자료카드(앞) 조회 */
	@RequestMapping("/dataCardFrontListAjax.do")
	public String DataCardFrontListAjax(@ModelAttribute("fixedFormVO") FixedFormVO fixedFormVO, Model model, HttpServletRequest req) throws Exception {
		
		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<FixedFormVO> dataCardFrontList = fixedFormService.getDataCardFrontList(fixedFormVO);

		model.addAttribute("getOrgList", getOrgList);
    	model.addAttribute("dataCardFrontList", dataCardFrontList);
    	model.addAttribute("dataCardFrontListTotal", dataCardFrontList.size());
    	if(dataCardFrontList.size() > 0) {
    		model.addAttribute("firstItemNo", dataCardFrontList.get(0).getItem_no());
    		model.addAttribute("firstDetailItemNo", dataCardFrontList.get(0).getItem_detail_no());
    	}
		return "fixedForm/fixedForm_DataCardFront";
	}
	
	/** 자료카드(뒤) 조회 */
	@RequestMapping("/dataCardBackListAjax.do")
	public String DataCardBackListAjax(@ModelAttribute("dataCardBackVO") DataCardBackVO dataCardBackVO, Model model, HttpServletRequest req) throws Exception {

		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<FixedFormVO> dataCardBackPList = fixedFormService.getDataCardBackPList(dataCardBackVO);
		List<FixedFormVO> dataCardBackList = fixedFormService.getDataCardBackList(dataCardBackVO);

		model.addAttribute("getOrgList", getOrgList);
		model.addAttribute("dataCardBackPList", dataCardBackPList);
    	model.addAttribute("dataCardBacktList", dataCardBackList);
    	model.addAttribute("dataCardBackListTotal", dataCardBackPList.size());
//    	if(dataCardBackPList.size() > 0) {
//    		model.addAttribute("firstItemNo", dataCardBackPList.get(0).getItem_no());
//    		model.addAttribute("firstDetailItemNo", dataCardBackPList.get(0).getItem_detail_no());
//    	}
		return "fixedForm/fixedForm_DataCardBack";
	}
	
	/** 자료카드(앞) 조회 */
	@RequestMapping("/dataLedgerListAjax.do")
	public String DataLedgerListAjax(@ModelAttribute("fixedFormVO") FixedFormVO fixedFormVO, Model model, HttpServletRequest req) throws Exception {

		List<OrgVO> getOrgList = metaDataService.getOrg();
		List<FixedFormVO> dataLedgerList = fixedFormService.getDataCardFrontList(fixedFormVO);
 	
		int cnt =  dataLedgerList.size();
 		int pageSize = 5;
 		int pageCount = cnt/pageSize +(cnt%pageSize==0?0:1);

 		model.addAttribute("getOrgList", getOrgList);
    	model.addAttribute("dataLedgerList", dataLedgerList);
    	model.addAttribute("dataLedgerListTotal", dataLedgerList.size());
    	model.addAttribute("pageCount", pageCount);
		return "fixedForm/fixedForm_DataLedger";
	}
}
