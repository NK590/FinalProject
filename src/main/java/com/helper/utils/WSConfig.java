package com.helper.utils;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WSConfig extends Configurator {
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		HttpSession session = (HttpSession)request.getHttpSession();
		// handshake 과정 중 nickname, room 값 실어 보내기
		sec.getUserProperties().put("nickname", session.getAttribute("nickname"));
		sec.getUserProperties().put("room", session.getAttribute("room"));
		super.modifyHandshake(sec, request, response);
	}
}
