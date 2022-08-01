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
		<!-- 그룹방 상세 -->
	    <div class="row">
	        <h3>${groupDto.group_title}</h3>
	        <h5>그룹 분류 : ${groupDto.group_std_key}</h5>
	        <h5>참가자 : ${groupDto.group_memCount} / ${groupDto.group_max}</h5>
	    </div>
	    <div class="row">
	        <div class="col-6">
	        	<!-- 그룹방 참가자 리스트 -->
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
	            <!-- 방장의 한마디 -->
	            <div class="row" style="margin: 20px">
	                <p>방장의 한마디</p>
	                <div style="background-color: #eee; height: 200px">
	                    ${groupDto.group_content}
	                </div>
	            </div>
	            <!-- 기타 버튼들 -->
	            <div class="col text-center">
	            	<c:if test="${loginSession.mem_seq eq groupDto.mem_seq}">
		            	<button class="btn btn-danger" id="deleteGroupBtn">그룹 삭제</button>
		            	<button class="btn btn-primary" id="modifyRoomContentBtn" data-bs-toggle="modal" data-bs-target="#modifyRoomContentModal">방장의 한마디 수정</button>
		            	<button class="btn btn-warning" id="kickoutBtn" data-bs-toggle="modal" data-bs-target="#kickoutModal">그룹원 추방</button>
		            	<button class="btn btn-secondary" id="goBackBtn">그룹 리스트</button>
	            	</c:if>
	            	<c:if test="${loginSession.mem_seq ne groupDto.mem_seq}">
		            	<button class="btn btn-danger" id="signoutGroupBtn">그룹 나가기</button>
		            	<button class="btn btn-secondary" id="goBackBtn">그룹 리스트</button>
	            	</c:if>
	            </div>
	        </div>
	        <!-- 채팅창 -->
	        <div class="col-6">
	            <p>실시간 채팅</p>
            	<div class="chat-grid">
		            <div class="chat-content" id='chatContent'>
		                <c:if test="${not empty chatList}">
		                	<c:forEach items="${chatList}" var="dto">
		                		<c:if test="${dto.mem_nick eq loginSession.mem_nick}">
			                		<div style="text-align: right">
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
						        			background-color : black;
						        			color : white;
						        			padding : 5px;
						        			margin : 10px;
						        			border-radius : 5px 5px 5px;
				                		">
				                			${dto.chat_content}
				                		</div>
				                		<br><br>
			                		</div>
		                		</c:if>
		                		<c:if test="${dto.mem_nick ne loginSession.mem_nick}">
			                		<div>
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
			                		</div>
		                		</c:if>
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
	        <!-- 여기까지 채팅창 -->
	    </div>
	</div>
	<!-- 여기서부터 방장 한마디 수정 모달 -->
	<div class="modal fade" id="modifyRoomContentModal" tabindex="-1" aria-labelledby="modifyRoomContentModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">방장의 한마디 수정</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
		        <div class="modal-body">
		        	<input type="text" class="form-control" id="modifyRoomContentInput">
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" id="modifyRoomContentSubmitBtn">등록</button>
		        </div>
		    </div>
	    </div>
	</div>
	<!-- 여기까지 방장 한마디 수정 모달 -->
	
	<!-- 여기서부터 회원 추방 모달 -->
	<div class="modal fade" id="kickoutModal" tabindex="-1" aria-labelledby="kickoutModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">그룹원 추방</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
		        <div class="modal-body">
		        	<p>추방할 회원의 닉네임을 입력하세요.</p>
		        	<input type="text" class="form-control" id="kickoutNicknameInput">
		        </div>
		        <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-primary" id="kickoutSubmitBtn">등록</button>
		        </div>
		    </div>
	    </div>
	</div>
	<!-- 여기까지 화원 추방 모달 -->
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
    	
    	// 채팅창 위치 제일 하단으로 세팅
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
    	
    	// 엔터버튼 입력 시 채팅 입력받기
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
    		let confirmDelete = confirm('정말로 그룹을 삭제하시겠습니까?')
    		if (confirmDelete) {
    			location.href = "/group/delete?group_seq=" + ${loginSession.group_seq}
    		}
    	})
    	
    	// 그룹 탈퇴 버튼 눌렀을 시
    	$('#signoutGroupBtn').on('click', (e) => {
    		let confirmSignout = confirm('정말로 그룹을 탈퇴하시겠습니까?')
    		if (confirmSignout) {
    			location.href = "/group/signout?group_seq=" + ${loginSession.group_seq}
    		}
    	})
    	
    	// 방장의 한마디 수정 버튼 눌렀을 시
    	$('#modifyRoomContentSubmitBtn').on('click', (e) => {
    		let group_content = $('#modifyRoomContentInput').val()
    		let group_seq = parseInt(${groupDto.group_seq})
    		
    		let modifyGroupContentConfirm = confirm('정말 변경하시겠습니까?')
    		if (modifyGroupContentConfirm) {
    			if (group_content === '') {
    				alert('변경할 내용을 입력해 주십시오.')
    				return
    			} else {
    				$.ajax({
    					url : "/group/modify",
    					type : "post",
    					data : { group_content : group_content, group_seq : group_seq },
    					success : (result) => {
    						console.log(result)
    						alert('수정이 완료되었습니다.')
    						location.href = "/group/room?group_seq=" + group_seq
    					},
    					error : (error) => {
    						console.log(error)
    					}
    				})
    			}
    		}
    	})
    	
    	// 그룹 리스트 버튼 눌렀을 시
    	$('#goBackBtn').on('click', (e) => {
    		location.href = "/group/"
    	})
    	
    	// 회원 추방 버튼을 눌렀을 시
    	$('#kickoutSubmitBtn').on('click', (e) => {
    		let kickoutNicknameInput = $('#kickoutNicknameInput').val()
    		if (kickoutNicknameInput === '') {
    			alert('추방할 닉네임을 입력해주세요.')
    			return
    		} else if (kickoutNicknameInput === "${loginSession.mem_nick}") {
    			alert('자기 자신을 추방할 수 없습니다.')
    			return
    		} else {
    			$.ajax({
    				url : "/group/kickoutCheck",
    				type : "get",
    				data : { mem_nick : kickoutNicknameInput },
    				success : (result) => {
    					if (result === 'no_data') {
    						alert('해당하는 닉네임이 존재하지 않습니다.')
    						return
    					} else if (result === 'not_same_room') {
    						alert('같은 방에 있는 회원이 아닙니다.')
    						return
    					} else if (result === 'same_room') {
    						let confirmKickout = confirm('정말로 추방시키겠습니까?')
    						if (confirmKickout) {
        						$.ajax({
        		    				url : "/group/kickout",
        		    				type : "post",
        		    				data : { mem_nick : kickoutNicknameInput },
        							success : (re_result) => {
        								console.log(re_result)
        								if (re_result === 'success') {
        									location.href = "/group/room?group_seq=" + ${loginSession.group_seq}
        								}
        							},
        		    				error : (error) => {
        		    					console.log(error)
        		    				}
        						})
    						}
    					}
    				},
    				error : (error) => {
    					console.log(error)
    				}
    			})
    		}
    	})
    </script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>