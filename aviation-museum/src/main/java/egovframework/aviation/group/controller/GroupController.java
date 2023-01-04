package egovframework.aviation.group.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.aviation.group.service.GroupService;
import egovframework.aviation.group.vo.GroupVO;

@Controller
public class GroupController {
	
	@Autowired(required=false)
	private GroupService groupService;
		/**
		 * 그룹 목록을 조회한다
		 * @return String
		 * @exception Exception
		 */
		@RequestMapping(value = "/grouplistview.do")
	    public String GroupListView(HttpServletRequest req, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {
			List<GroupVO> groupList = groupService.getGroupList(groupVO);
	    	model.addAttribute("groupList", groupList);
	        return "group/group";
	    }    

		@RequestMapping(value = "/groupinsert.do")
	    public String GroupInsert(HttpServletRequest req, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {

//			groupVO.setGroup_nm("다-4");
//			groupVO.setAdmin("Y");
			
			int result = groupService.insertGroup(groupVO);
			System.out.println("result"+result);
	        return "group/group";
	    }   
	
		@RequestMapping(value = "/groupupdate.do")
	    public String Groupupdate(HttpServletRequest req, @ModelAttribute("groupVO") GroupVO groupVO, Model model) throws Exception {

//			groupVO.setGroup_idx("3");
//			groupVO.setGroup_nm("다-44");
//			groupVO.setAdmin("N");
			
			int result = groupService.updateGroup(groupVO);
			System.out.println("result"+result);
	        return "group/group";
	    } 
}
