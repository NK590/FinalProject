package com.helper.group;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helper.chat.ChatDTO;
import com.helper.chat.ChatService;
import com.helper.member.MemberDTO;
import com.helper.member.MemberService;

@Controller
@RequestMapping(value="/group")
public class GroupController {
	@Autowired
	private GroupService service;
	@Autowired
	private ChatService chatService;
	@Autowired
	private MemberService memberService;
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
		System.out.println("입장할 방 번호 : " + group_seq);
		GroupDTO groupDto = service.selectBySeq(group_seq);
		
		model.addAttribute("groupDto", groupDto);
		
		session.setAttribute("nickname", ((MemberDTO)session.getAttribute("loginSession")).getMem_nick());
		session.setAttribute("room", String.valueOf(group_seq));
		
		List<ChatDTO> list = chatService.selectAllByNum(group_seq);
		model.addAttribute("chatList", list);
		
		List<MemberDTO> memberList = memberService.selectByGroupSeq(group_seq);
		model.addAttribute("memberList", memberList);
		
		return "group/detail";
	}
	
	@RequestMapping(value="/makeRoom")
	public String makeRoom(String categoryInput, String roomNameInput, String roomContentInput, String memberNumberInput, Model model) throws Exception {
		MemberDTO memberDto = (MemberDTO)session.getAttribute("loginSession");
		int mem_seq = memberDto.getMem_seq();

		service.insert(new GroupDTO(0, mem_seq, roomNameInput, roomContentInput, categoryInput, Integer.parseInt(memberNumberInput), 1, "dummy", null));
		
		int currval = service.selectSeqCurrval();
		System.out.println("현재 생성한 방 번호 : " + currval);
		model.addAttribute("group_seq", currval);

		memberDto.setGroup_seq(currval);
		session.setAttribute("loginSession", memberDto);
		memberService.updateGroupSeq(memberDto);
		
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
	
	@ResponseBody
	@RequestMapping(value="/checkJoinStatus")
	public int checkJoinStatus(Model model) throws Exception {
		int group_seq = memberService.checkJoinStatus(((MemberDTO)session.getAttribute("loginSession")).getMem_seq());
		System.out.println("현재 가입중인 그룹 번호 : " + group_seq);
		return group_seq;
	}
}
