<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>채팅 샘플</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<style>
        body {
            box-sizing: border-box;
        }
        .chat-grid {
            width: 400px;
            height: 600px;
        }
        .chat-content {
            width: 100%;
            height: 500px;
            border: 1px solid black;
            overflow: scroll;
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
            width: 79%;
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
</head>
<body>
    <div class="container">
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
    </div>
    <script>
    	let ws = new WebSocket("ws://211.207.221.23:8099/chat/chatSample")
    	
    	
    	document.getElementById('chatSend').addEventListener('click', (e) => {
    		let message = document.getElementById('chatTextInput').value
    		if (message !== '') { // message가 빈 값이 아닐 때만 전송
    			ws.send(message) // 서버의 endpoint에 메세지 전송
    			document.getElementById('chatTextInput').value = ''
    			
    			let chatContent = document.getElementById('chatContent')
    			chatContent.scrollTop = chatContent.scrollHeight
    		}
    	})
    	
    	// endpoint로부터 전송된 메세지 받기
    	ws.onmessage = (message) => {
    		
    		let messageData = JSON.parse(message.data)
    		
    		let nicknameDiv = $('<div>').append(messageData.nickname).css({
    			'display' : 'inline',
    			'padding' : '5px',
    			'margin' : '10px',
    			'font-size' : 'small'
    		})
    		$('#chatContent').append(nicknameDiv)
    		
    		let br1 = $('<br><br>')
    		$('#chatContent').append(br1)
    		
    		let messageDiv = $('<div>').append(messageData.message)
    		if (messageData.nickname === "${nickname}") {
        		messageDiv.css({
        			'display' : 'inline',
        			'background-color' : 'black',
        			'color' : 'white',
        			'padding' : '5px',
        			'margin' : '10px',
        			'border-radius' : '5px 5px 5px'
        		})
    		} else {
    			messageDiv.css({
        			'display' : 'inline',
        			'background-color' : '#eee',
        			'padding' : '5px',
        			'margin' : '10px',
        			'border-radius' : '5px 5px 5px'
        		})
    		}
    		$('#chatContent').append(messageDiv)
    		
    		let br2 = $('<br><br>')
    		$('#chatContent').append(br2)
    		
   			let chatContent = document.getElementById('chatContent')
   			chatContent.scrollTop = chatContent.scrollHeight
    	}
    	
    	document.addEventListener('keyup', (e) => {
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
    	
    </script>
</body>
</html>
