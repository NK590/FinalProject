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
		for(ReportDTO list : dto) {
			System.out.println(list);
		}
		System.out.println("===");
		Map<String, Object> map = new HashedMap<String, Object>();
		map.put("list", dto);
		map.put("naviMap", service.getSearchPageNavi(mem_id, curPage));
		map.put("mem_id", mem_id);
		return map;
	}
	
	@RequestMapping(value = "/grouplist")
	public String grouplist() throws Exception {
		return "admin/grouplist";
	}
	
	
	
}
