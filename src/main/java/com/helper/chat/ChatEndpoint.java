package com.helper.chat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONObject;

import com.helper.utils.SpringContext;
import com.helper.utils.WSConfig;

@ServerEndpoint(value="/group/detail", configurator=WSConfig.class)
public class ChatEndpoint {
	private static Map<Integer, List<Session>> roomSessions = new HashMap<Integer, List<Session>>();
	private ChatService service = SpringContext.getApplicationContext().getBean(ChatService.class);
	
	private String nickname;
	private int room;
	
	@OnOpen
	public void onOpen(Session session, EndpointConfig config) {
		String nickname = (String)config.getUserProperties().get("nickname");
		int room = Integer.parseInt((String)config.getUserProperties().get("room"));
		
		System.out.println("접속한 클라이언트 닉네임 : " + nickname);
		System.out.println("접속한 방 번호 : " + room);
		
		if (!roomSessions.containsKey(room)) {
			roomSessions.put(room, Collections.synchronizedList(new ArrayList<>()));
			System.out.println(room + "번 방 생성 후 접속");
		} else {
			System.out.println("기존 " + room + "번 방 접속");
		}
		
		this.nickname = nickname;
		this.room = room;
		
		roomSessions.get(room).add(session);
		for (Session client : roomSessions.get(room)) {
			System.out.println(room + "번 방 접속 중 클라이언트 : " + client);
		}
	}
	
	@OnMessage
	public void onMessage(Session session, String message) {
		
		try {
			service.insert(new ChatDTO(0, room, nickname, message, System.currentTimeMillis()-1658900000000L));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		JSONObject obj = new JSONObject();
		obj.put("message", message);
		obj.put("room", this.room);
		obj.put("nickname", this.nickname);
		
		try {
			synchronized(roomSessions.get(this.room)) {
				for (Session client : roomSessions.get(this.room)) {
					client.getBasicRemote().sendText(obj.toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@OnClose
	public void onClose(Session session) {
		roomSessions.get(this.room).remove(session);
		System.out.println("클라이언트 세션 종료");
		
		synchronized(roomSessions.get(this.room)) {
			if (roomSessions.get(this.room).isEmpty()) {
				roomSessions.remove(this.room);
				System.out.println(this.room + "번 방 세션 종료");
			}
		}
	}
}
