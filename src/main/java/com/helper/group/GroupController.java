package com.helper.group;

import java.util.Arrays;
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
	
	// 그룹 방 이미지 리스트 출력을 위한 인덱스 리스트
	private final List<Integer> imageList = Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
	
	// 그룹 홈 페이지 매핑
	@RequestMapping(value="/")
	public String home(Model model) throws Exception {
		List<GroupDTO> groupList = service.selectAll();
		String mem_nick = ((MemberDTO)session.getAttribute("loginSession")).getMem_nick();
		int cur_group_seq = (memberService.findNickname(mem_nick)).getGroup_seq();
		
		model.addAttribute("groupList", groupList);
		model.addAttribute("imageList", imageList);
		model.addAttribute("cur_group_seq", cur_group_seq);
		
		return "group/home";
	}
	
	// 그룹 방 입장
	@RequestMapping(value="/room")
	public String room(int group_seq, Model model) throws Exception {
		System.out.println("입장할 방 번호 : " + group_seq);
		GroupDTO groupDto = service.selectBySeq(group_seq);
		
		int sessionGroupSeq = ((MemberDTO)session.getAttribute("loginSession")).getGroup_seq();
		
		if (sessionGroupSeq == group_seq) {
			model.addAttribute("groupDto", groupDto);
			
			session.setAttribute("nickname", ((MemberDTO)session.getAttribute("loginSession")).getMem_nick());
			session.setAttribute("room", String.valueOf(group_seq));
			
			List<ChatDTO> list = chatService.selectAllByNum(group_seq);
			model.addAttribute("chatList", list);
			
			List<MemberDTO> memberList = memberService.selectByGroupSeq(group_seq);
			model.addAttribute("memberList", memberList);
			
			return "group/detail";
		} else {
			// 현재 가입한 방 번호 != 들어가려는 방 번호 시 매핑 : 추후 수정 필요
			return "redirect:/group/";
		}
	}
	
	// 그룹 방 작성
	@RequestMapping(value="/makeRoom")
	public String makeRoom(String categoryInput, String roomNameInput, String roomContentInput, String memberNumberInput, String selectedImageNum, Model model) throws Exception {
		MemberDTO memberDto = (MemberDTO)session.getAttribute("loginSession");
		int mem_seq = memberDto.getMem_seq();

		service.insert(new GroupDTO(0, mem_seq, roomNameInput, roomContentInput, categoryInput, Integer.parseInt(memberNumberInput), 1, selectedImageNum, null));
		
		int currval = service.selectSeqCurrval();
		System.out.println("현재 생성한 방 번호 : " + currval);
		System.out.println("현재 입력받은 이미지 번호 : " + selectedImageNum);
		model.addAttribute("group_seq", currval);

		memberDto.setGroup_seq(currval);
		session.setAttribute("loginSession", memberDto);
		memberService.updateGroupSeq(memberDto);
		
		return "redirect:/group/room";
	}
	
	// 그룹 검색 매핑 ajax
	@ResponseBody
	@RequestMapping(value="/getGroupByName")
	public List<GroupDTO> getGroupByName(String group_title, String group_std_key, Model model) throws Exception {
		System.out.println("입력한 그룹 검색명 : " + group_title);
		System.out.println("입력한 그룹 카테고리 : " + group_std_key);
		List<GroupDTO> searchGroupResult = service.selectByName(group_title, group_std_key);
		return searchGroupResult;
	}
	
	// 그룹 번호로 그룹 정보 가져오기 ajax
	@ResponseBody
	@RequestMapping(value="/getGroupBySeq")
	public GroupDTO getGroupBySeq(int group_seq) throws Exception {
		return service.selectBySeq(group_seq);
	}
	
	// 그룹 가입 번호 ajax
	@ResponseBody
	@RequestMapping(value="/checkJoinStatus")
	public int checkJoinStatus(int mem_seq, Model model) throws Exception {
		int group_seq = memberService.checkJoinStatus(mem_seq);
		System.out.println("현재 가입중인 그룹 번호 : " + group_seq);
		return group_seq;
	}
	
	// 그룹 가입 ajax
	@ResponseBody
	@RequestMapping(value="/groupSignin")
	public String groupSignin(int group_seq, int mem_seq, Model model) throws Exception {
		MemberDTO memberDto = (MemberDTO)session.getAttribute("loginSession");
		memberDto.setGroup_seq(group_seq);
		memberService.updateGroupSeq(memberDto);
		
		GroupDTO groupDto = service.selectBySeq(group_seq);
		groupDto.setGroup_memCount(groupDto.getGroup_memCount() + 1);
		service.updateMemCount(groupDto);
		
		return "success";
	}
	
	// 방장의 한마디 수정 ajax
	@ResponseBody
	@RequestMapping(value="/modify")
	public String modifyRoomContent(int group_seq, String group_content) throws Exception {
		System.out.println("입력된 그룹 번호 : " + group_seq);
		System.out.println("입력된 방장의 한마디 : " + group_content);
		GroupDTO dto = service.selectBySeq(group_seq);
		dto.setGroup_content(group_content);
		service.modify(dto);
		return "success";
	}
	
	// 그룹 삭제
	@RequestMapping(value="/delete")
	public String delete(int group_seq) throws Exception {
		MemberDTO memberDto = (MemberDTO)session.getAttribute("loginSession");
		memberDto.setGroup_seq(0);
		memberService.updateGroupSeq(memberDto);
		service.delete(group_seq);
		
		List<MemberDTO> memberList = memberService.selectByGroupSeq(group_seq);
		
		for (MemberDTO member : memberList) {
			member.setGroup_seq(0);
			memberService.updateGroupSeq(member);
		}
		return "redirect:/group/";
	}
	
	// 그룹 탈퇴
	@RequestMapping(value="/signout")
	public String signout(int group_seq) throws Exception {
		MemberDTO memberDto = (MemberDTO)session.getAttribute("loginSession");
		memberDto.setGroup_seq(0);
		memberService.updateGroupSeq(memberDto);
		
		GroupDTO groupDto = service.selectBySeq(group_seq);
		groupDto.setGroup_memCount(groupDto.getGroup_memCount() - 1);
		service.updateMemCount(groupDto);
		
		return "redirect:/group/";
	}
	
	// 그룹 멤버 추방 ajax
	@ResponseBody
	@RequestMapping(value="/kickout")
	public String kickout(String mem_nick) throws Exception {
		MemberDTO memberDto = memberService.findNickname(mem_nick);
		memberDto.setGroup_seq(0);
		memberService.updateGroupSeq(memberDto);
		
		int group_seq = ((MemberDTO)session.getAttribute("loginSession")).getGroup_seq();
		GroupDTO groupDto = service.selectBySeq(group_seq);
		groupDto.setGroup_memCount(groupDto.getGroup_memCount() - 1);
		service.updateMemCount(groupDto);
		
		return "success";
	}
	
	// 그룹 멤버 추방 체크 ajax
	@ResponseBody
	@RequestMapping(value="/kickoutCheck")
	public String kickoutCheck(String mem_nick) throws Exception {
		System.out.println("추방 체크 닉네임 : " + mem_nick);
		int group_seq = ((MemberDTO)session.getAttribute("loginSession")).getGroup_seq();
		MemberDTO resultMemberDTO = memberService.findNickname(mem_nick);
		
		if (resultMemberDTO == null) {
			return "no_data";
		} else if (resultMemberDTO.getGroup_seq() != group_seq) {
			return "not_same_room";
		} else {
			return "same_room";
		}
	}
}
