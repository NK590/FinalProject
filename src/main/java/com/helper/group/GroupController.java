package com.helper.group;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.chat.ChatDTO;
import com.helper.chat.ChatService;

@Controller
@RequestMapping(value="/group")
public class GroupController {
	@Autowired
	private GroupService service;
	@Autowired
	private ChatService chatService;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value="/")
	public String home(Model model) throws Exception {
		List<GroupDTO> groupList = service.selectAll();
		model.addAttribute("groupList", groupList);
		return "group/home";
	}
	
	@RequestMapping(value="/room")
	public String room(int group_seq, Model model) throws Exception {
		GroupDTO groupDto = service.selectBySeq(group_seq);
		
		model.addAttribute("groupDto", groupDto);
		
		// 임시 테스트
		session.setAttribute("nickname", "11111");
		session.setAttribute("room", String.valueOf(group_seq));
		
		List<ChatDTO> list = chatService.selectAllByNum(group_seq);
		model.addAttribute("chatList", list);
		
		return "group/detail";
	}
	
	@RequestMapping(value="/makeRoom")
	public String makeRoom(String categoryInput, String roomNameInput, String roomContentInput, String memberNumberInput, Model model) throws Exception {
		
		// 임시 테스트
		GroupDTO dto = new GroupDTO(1, 1, roomNameInput, roomContentInput, categoryInput, Integer.parseInt(memberNumberInput), 1, "aaa", null);
		service.insert(dto);
		model.addAttribute("group_seq", 1); // 여기 버그임 수정필요
		
		return "redirect:/group/room";
	}
	
	@ResponseBody
	@RequestMapping(value="/getGroupByName")
	public List<GroupDTO> getGroupByName(String group_title, String group_std_key, Model model) throws Exception {
		System.out.println("입력한 그룹 검색명 : " + group_title);
		System.out.println("입력한 그룹 카테고리 : " + group_std_key);
		List<GroupDTO> searchGroupResult = service.selectByName(group_title, group_std_key);
		return searchGroupResult;
	}
}
