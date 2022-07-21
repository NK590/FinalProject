package com.helper.chat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.EndpointConfig;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.helper.utils.WSConfig;

@ServerEndpoint(value="/chat", configurator=WSConfig.class)
public class ChatEndpoint {
	private static Map<String, List<Session>> roomSessions = new HashMap<String, List<Session>>();
	private String nickname;
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		String nickname = (String)config.getUserProperties().get("nickname");
		System.out.println("접속한 클라이언트 닉네임 : " + nickname);
	}
}
