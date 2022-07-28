package com.helper.chat;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/chat")
public class ChatController {
	@Autowired
	private HttpSession session;
	@Autowired
	private ChatService service;
	
	@RequestMapping(value="/")
	public String chat() throws Exception {
		return "chat/enter";
	}
	@RequestMapping(value="/chatroom")
	public String chatroom(String nickname, String room) throws Exception {
		System.out.println("입장 닉네임 : " + nickname);
		System.out.println("입장 방 번호 : " + room);
		
		session.setAttribute("nickname", nickname);
		session.setAttribute("room", room);
		
		return "chat/chatSample";
	}
}
