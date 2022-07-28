package com.helper.admin;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.member.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/toBlacklist")
	public String toBlackList(int curPage, Model model) throws Exception {
		List<ReportDTO> reportList = service.reportList(curPage*10-9, curPage*10);
		
		// 페이징 Map
		Map<String, Object> map = service.getBleckPageNavi(curPage);
		model.addAttribute("reportList", reportList);
		model.addAttribute("naviMap", map);
		return "admin/blacklist";
	}
	
	@RequestMapping(value = "/addBleck")
	public String addBleck(int mem_seq) throws Exception {
		service.addBleck(mem_seq);
		return "redirect:/admin/toBlacklist?curPage=1";
	}
	
	@RequestMapping(value = "/searchMember")
	@ResponseBody
	public Map<String, Object> searchMember(String mem_id, int curPage) throws Exception {
		List<ReportDTO> dto = service.searchMember(mem_id, curPage*10-9, curPage*10);
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", dto);
		map.put("naviMap", service.getSearchPageNavi(mem_id, curPage));
		map.put("mem_id", mem_id);
		return map;
	}
	
	@RequestMapping(value = "/toGrouplist")
	public String grouplist(int curPage, Model model) throws Exception {
		List<Map<String, Object>> dto = service.groupList(curPage*10-9, curPage*10);
		Map<String, Object> map = service.getGroupPageNavi(curPage);
		model.addAttribute("list", dto);
		model.addAttribute("naviMap", map);
		
		return "admin/grouplist";
	}
	
	@RequestMapping(value = "/deleteGroup")
	public String deleteGroup(int group_seq) throws Exception {
		service.deleteGroup(group_seq);
		
		return "redirect:/admin/toGrouplist?curPage=1";
	}
	
	@RequestMapping(value = "/toAdmin")
	public String toAdmin() throws Exception {
		return "admin/adminMain";
	}
	
	@RequestMapping(value = "/toBlackManage")
	public String toBlackManage(int curPage ,Model model) throws Exception {
		List<MemberDTO> blacklist = service.selectBlacklist(curPage*10-9,curPage*10);
		Map<String, Object> map = service.getBlacklistPageNavi(curPage);
		model.addAttribute("blacklist", blacklist);
		model.addAttribute("naviMap", map);
		return "admin/blackManage";
	}
	
	@RequestMapping(value = "/unblocking")
	public String unblocking(int mem_seq) throws Exception {
		service.unblocking(mem_seq);
		
		return "redirect:/admin/toBlackManage?curPage=1";
	}
	
	
	
}
