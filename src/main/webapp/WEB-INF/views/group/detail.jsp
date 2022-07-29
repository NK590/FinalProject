<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>그룹 상세</title>
</head>
<style>
    body {
        box-sizing: border-box;
    }
    .chat-grid {
        width: 100%;
        height: 600px;
    }
    .chat-content {
        width: 100%;
        height: 500px;
        border: 1px solid black;
        overflow-y: scroll;
    }
    .chat-input {
        width: 100%;
        height: 100px;
    }
    .chat-input > * {
        float: left;
        margin: 0;
        padding: 0;
    }
    #chatTextInput {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }
    #chatSend {
        width: 20%;
        height: 100%;
        background-color: yellow;
        margin: 0;
        padding: 0;
    }
    .chat-input::after {
        clear: both;
    }
</style>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div class="container">
	    <div class="row">
	        <h3>${groupDto.group_title}</h3>
	        <h5>그룹 분류 : ${groupDto.group_std_key}</h5>
	        <h5>참가자 : ${groupDto.group_memCount} / ${groupDto.group_max}</h5>
	    </div>
	    <div class="row">
	        <div class="col-6">
	            <div class="row" style="margin: 20px">
	                <p>참가자</p>
	                <div style="background-color: #eee; height: 200px">
	                    <c:if test="${not empty memberList}">
	                    	<c:forEach items="${memberList}" var="dto">
	                    		<p>${dto.mem_nick}</p>
	                    	</c:forEach>
	                    </c:if>
	                </div>
	            </div>
	            <div class="row" style="margin: 20px">
	                <p>방장의 한마디</p>
	                <div style="background-color: #eee; height: 200px">
	                    ${groupDto.group_content}
	                </div>
	            </div>
	            <div class="col text-center">
	            	<button class="btn btn-danger" id="deleteGroupBtn">그룹 삭제</button>
	            	<button class="btn btn-primary" id="modifyRoomContentBtn">방장의 한마디 수정</button>
	            	<button class="btn btn-secondary" id="goBackBtn">그룹 리스트</button>
	            </div>
	        </div>
	        <div class="col-6">
	            <p>실시간 채팅</p>
            	<div class="chat-grid">
		            <div class="chat-content" id='chatContent'>
		                <c:if test="${not empty chatList}">
		                	<c:forEach items="${chatList}" var="dto">
		                		<div style="
		                			display : inline;
					    			padding : 5px;
					    			margin : 10px;
					    			font-size : small
		                		">
		                			${dto.mem_nick}
		                		</div>
		                		<br><br>
		                		<div style="
				        			display : inline;
				        			background-color : #eee;
				        			padding : 5px;
				        			margin : 10px;
				        			border-radius : 5px 5px 5px;
		                		">
		                			${dto.chat_content}
		                		</div>
		                		<br><br>
		                	</c:forEach>
		                	<div style="text-align: center; background-color: #eee">
		                		<span>이상 이전 메세지</span>
		                	</div>
		                </c:if>
		            </div>
		            <div class="chat-input">
		                <input type="text" id="chatTextInput" name="chatTextInput">
		                <!-- <button type="button" id="chatSend">Send</button> --> <!-- 버튼 삭제 -->
		        	</div>
		        </div>
	        </div>
	    </div>
	</div>
	
	<!-- 기존 코드 보관 -->
    <%-- <div class="container">
    	<h2>
   			${room}번 채팅방
    	</h2>
        <div class="chat-grid">
            <div class="chat-content" id='chatContent'>
                <c:if test="${not empty list}">
                	<c:forEach items="${list}" var="dto">
                		<div style="
                			display : inline;
			    			padding : 5px;
			    			margin : 10px;
			    			font-size : small
                		">
                			${dto.nickname}
                		</div>
                		<br><br>
                		<div style="
		        			display : inline;
		        			background-color : #eee;
		        			padding : 5px;
		        			margin : 10px;
		        			border-radius : 5px 5px 5px;
                		">
                			${dto.message}
                		</div>
                		<br><br>
                	</c:forEach>
                </c:if>
            </div>
            <div class="chat-input">
                <input type="text" id="chatTextInput" name="chatTextInput">
                <button type="button" id="chatSend">Send</button>
        	</div>
        </div>
    </div> --%>
    <script>
    	let ws = new WebSocket("ws://211.207.221.23:8099/group/detail")
    	
    	// 전송 버튼 삭제로 인해 없앰
    	/* document.getElementById('chatSend').addEventListener('click', (e) => {
    		let message = document.getElementById('chatTextInput').value
    		if (message !== '') { // message가 빈 값이 아닐 때만 전송
    			ws.send(message) // 서버의 endpoint에 메세지 전송
    			document.getElementById('chatTextInput').value = ''
    			
    			let chatContent = document.getElementById('chatContent')
    			chatContent.scrollTop = chatContent.scrollHeight
    		}
    	}) */
    	
    	$(document).ready((e) => {
   			let chatContent = document.getElementById('chatContent')
   			chatContent.scrollTop = chatContent.scrollHeight
    	})
    	
    	// endpoint로부터 전송된 메세지 받기
    	ws.onmessage = (message) => {
    		let messageData = JSON.parse(message.data)
    		
    		let br1 = $('<br><br>')
    		let br2 = $('<br><br>')
    		let containerDiv = $('<div>')
    		let nicknameDiv = $('<div>').append(messageData.nickname)
    		let messageDiv = $('<div>').append(messageData.message)
    		
    		if (messageData.nickname === "${nickname}") {
    			nicknameDiv.css({
    				'display' : 'inline',
        			'padding' : '5px',
        			'margin' : '10px',
        			'font-size' : 'small'
    			})
        		containerDiv.append(nicknameDiv)
        		containerDiv.append(br1)
        		
        		messageDiv.css({
        			'display' : 'inline',
        			'background-color' : 'black',
        			'color' : 'white',
        			'padding' : '5px',
        			'margin' : '10px',
        			'border-radius' : '5px 5px 5px'
        		})
        		containerDiv.append(messageDiv)
    			containerDiv.append(br2)
    			$('#chatContent').append(containerDiv)
    		} else {
    			containerDiv.css({
    				'text-align' : 'right'
    			})
    			nicknameDiv.css({
    				'display' : 'inline',
        			'padding' : '5px',
        			'margin' : '10px',
        			'font-size' : 'small'
    			})
        		containerDiv.append(nicknameDiv)
        		containerDiv.append(br1)
        		
    			messageDiv.css({
        			'display' : 'inline',
        			'background-color' : '#eee',
        			'padding' : '5px',
        			'margin' : '10px',
        			'border-radius' : '5px 5px 5px'
        		})
        		containerDiv.append(messageDiv)
        		containerDiv.append(br2)
    			$('#chatContent').append(containerDiv)
    		}
    		
   			let chatContent = document.getElementById('chatContent')
   			chatContent.scrollTop = chatContent.scrollHeight
    	}
    	
    	document.getElementsByClassName('chat-grid')[0].addEventListener('keyup', (e) => {
    		if (event.keyCode === 13) {
       			let message = document.getElementById('chatTextInput').value
           		if (message !== '') {
           			ws.send(message)
           			document.getElementById('chatTextInput').value = ''

           			let chatContent = document.getElementById('chatContent')
           			chatContent.scrollTop = chatContent.scrollHeight
           		}
   			}
    	})
    	
    	// 그룹 삭제 버튼 눌렀을 시
    	$('#deleteGroupBtn').on('click', (e) => {
    		console.log(${groupDto.mem_seq})
    	})
    	
    	// 방장의 한마디 수정 버튼 눌렀을 시
    	$('#modifyRoomContentBtn').on('click', (e) => {
    		console.log(${groupDto.mem_seq})
    	})
    	
    	// 방장의 한마디 수정 버튼 눌렀을 시
    	$('#goBackBtn').on('click', (e) => {
    		location.href = "/group/"
    	})
    </script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>