package com.helper.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.support.ManagedMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.helper.member.MemberDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private HttpSession session;
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
	
	@RequestMapping(value = "/addBlack")
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

	@RequestMapping(value="/noticeWrite")
	public String noticeWrite() throws Exception {
		return "admin/noticeWrite";
	}
	@RequestMapping(value="/summernote", produces = "text/html; charset=utf-8") // 썸머노트 이미지 띄워주기 
	@ResponseBody
	public String summernote(@RequestParam("file") MultipartFile file)throws Exception{
		String realPath =  session.getServletContext().getRealPath("admin");
		String sys_name = service.summernote(file,realPath); 
		return sys_name;
		
	}
	@RequestMapping(value="/imgDelete") // summernote 글쓰기 시점에서 img를 지웠을때 
	@ResponseBody
	public String imgDelete(String path)throws Exception{
		String realPath =  session.getServletContext().getRealPath("admin");
		System.out.println(path);// 대상 문자열
		String pattern = "/images.*"; // 패턴   
		String img = path.replaceAll(".*/admin/", "");  // 대상 문자열 제거 
		service.imgDelete(img,realPath);
		
		return"a image is deleted";
	}
	@RequestMapping(value="/write") // 게시글 삽입  
	public String write(NoticeDTO dto)throws Exception{		
			int rs = service.insertNotice(dto);
      return "redirect:/admin/toNotice";
	}
	
	@RequestMapping(value = "/deleteGroup")
	public String deleteGroup(int group_seq) throws Exception {
		service.deleteGroup(group_seq);
		
		return "redirect:/admin/toGrouplist?curPage=1";
	}
	
	@RequestMapping(value = "/toAdmin")
	public String toAdmin(Model model) throws Exception {
		Map<String, Object> totalMap = new HashMap<String, Object>();
		int visitToday = service.visitToday();
		int visitTotal = service.visitTotal();
		int reportTotal = service.reportTotal();
		totalMap.put("visitToday", visitToday);
		totalMap.put("visitTotal", visitTotal);
		totalMap.put("reportTotal", reportTotal);
		// 1주일 회원가입수 가져오기
		JSONArray memberJoinCount = new JSONArray(service.memberJoinCount());
		JSONArray groupCategoryCount = new JSONArray(service.groupCategoryCount());
		model.addAttribute("totalMap", totalMap);
		model.addAttribute("memberJoinCount", memberJoinCount);
		model.addAttribute("groupCategoryCount", groupCategoryCount);
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
	
	@RequestMapping(value="/toNotice")//공지 목록
	public String toNotice(Model model)throws Exception{
		List<NoticeDTO> list = service.selectAllNotice();
		model.addAttribute("list",list);
		return "/admin/notice";
		
	}
	@RequestMapping(value="/toNoticeDetail") // 상세보기 페이지
	public String toDetail(int notice_seq,Model model)throws Exception{
		NoticeDTO dto = service.selectOneNotice(notice_seq);
		model.addAttribute("dto",dto);
		return "/admin/noticeDetail";
	}
	@RequestMapping(value="/noticeUpdate") // 게시글 수정
	public String update(@RequestParam(value="arr[]")List<String>updateFile, NoticeDTO dto)throws Exception{
		System.out.println(dto.toString());
		List<String> list= new ArrayList<>();
		for(String file:updateFile) {
			String pattern = "/images.*"; // 패턴   
			String img = file.replaceAll(".*/admin/", "");  // 대상 문자열 제거 
			list.add(img);
		}
		System.out.println(list);
		
		String realPath = session.getServletContext().getRealPath("admin");
		int rs = service.noticeUpdate(list,dto,realPath);
		return "redirect:/admin/toNoticeDetail?notice_seq="+dto.getNotice_seq();
	}

	@RequestMapping(value="/noticeDelete") // 이미지가 있는 게시글 삭제
	@ResponseBody
	public String noticeDelete(@RequestParam(value="arr[]")List<String>img_arr,@RequestParam(value="notice_seq")int notice_seq)throws Exception{
		String realPath = session.getServletContext().getRealPath("notice");
		int rs = service.noticeDelete(notice_seq, img_arr,realPath);
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@RequestMapping(value="/noticeDelete2") // 이미지가 없는 게시글 삭제
	@ResponseBody
	public String noticeDelete2(int notice_seq)throws Exception{
		int rs = service.noticeDelete2(notice_seq);
		if(rs>0) {
			return "success";
		}else {
			return "fail";
		}
	}
}
