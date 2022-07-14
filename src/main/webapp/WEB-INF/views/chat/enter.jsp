<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방 입장</title>
</head>
<body>
	<form action="/chat/chatroom" method="get">
		<div>
			<h3>채팅방 닉네임, 방번호 입력</h3>
			<input type="text" name="nickname" placeholder="닉네임">
			<input type="text" name="room" placeholder="방번호">
			<button type="submit">입장</button>
		</div>
	</form>
</body>
</html>