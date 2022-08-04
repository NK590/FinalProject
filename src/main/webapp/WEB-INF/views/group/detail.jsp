<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/js/pop.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>그룹 상세</title>
</head>
<style>
/* pop */
@keyframes slide-in {
	 0% {
		 transform: scale(2) rotate(60deg);
		 opacity: 0;
	}
}
 @keyframes bump-in {
	 0% {
		 transform: scale(0);
		 opacity: 0;
	}
}
 particule {
	 position: absolute;
	 top: 0;
	 left: 0;
	 border-radius: 50%;
	 width: 30px;
	 height: 30px;
	 box-shadow: 1px 1px 4px #eb6383;
}
@font-face {
	src: url("/resources/fonts/GothicA1-Regular.ttf");
	font-family: "GothicA1-Regular.ttf";
}

@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoL.ttf");
	font-family: "AppleSDGothicNeoL.ttf";
}

@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB.ttf";
}

body {
	box-sizing: border-box;
	background-color: rgb(3, 0, 58);
}

.box {
	height: 630px;
}

.chat-grid {
	width: 100%;
	height: 550px;
}

.chat-content {
	width: 100%;
	height: 500px;
	overflow-y: scroll;
	background-color: rgb(231, 231, 231);
	border-radius: 15px;
}

.chat-input {
	width: 100%;
	height: 100px;
}

.chat-input>* {
	float: left;
	margin: 0;
	padding: 0;
}

#chatTextInput {
	width: 865px;
	height: 40px;
	margin: 0;
	padding: 0;
	margin-top: 17px;
	border-radius: 15px;
	border: 1px solid grey;
}

.send_msg {
	width: 93px;
	height: 37px;
	margin-top: 20px;
	padding: 0px;
}

#chatSend {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-color: transparent;
	border: none;
	margin-top: -7px;
}

.chat-input::after {
	clear: both;
}

.listBox {
	background-color: rgb(3, 0, 58);
	border-bottom-left-radius: 15px;
}

.chatBox {
	background-color: rgb(3, 0, 58);
	border-top-right-radius: 15px;
	border-bottom-right-radius: 15px;
}

.groupGoal {
	font-size: 20px;
	color: white;
	font-family: "AppleSDGothicNeoB.ttf";
	margin-bottom: -6px;
}

.groupGoal2 {
	font-size: 15px;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-bottom: 2px solid white;
	border-bottom-style: double;
}

.groupMember2 {
	font-size: 15px;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-bottom: 2px solid white;
	border-bottom-style: double;
}

.groupMember {
	font-size: 20px;
	color: white;
	font-family: "AppleSDGothicNeoB.ttf";
	margin-bottom: -6px;
}

.goaltxt {
	font-style: italic;
	font-size: 16px;
	margin-bottom: 20px;
	color: white;
	font-family: "AppleSDGothicNeoB.ttf";
}

.chatMsg {
	margin-top: 10px;
	font-size: 20px;
	color: white;
	font-family: "AppleSDGothicNeoB.ttf";
}

.title {
	background-color: rgb(68, 143, 121);
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	border-right: 5px solid white;
}

.title p {
	color: white;
	font-size: 20px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.category {
	background-color: rgb(3, 0, 58);
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	border-right: 5px solid white;
}

.category p {
	color: white;
	font-size: 17px;
	font-family: "AppleSDGothicNeoL.ttf";
}

.member {
	background-color: rgb(3, 0, 58);
	border-top-right-radius: 15px;
	border-top-left-radius: 15px;
	border-right: 5px solid white;
}

.member p {
	color: white;
	font-size: 17px;
	font-family: "AppleSDGothicNeoL.ttf";
}

.memList {
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	margin: 5px;
}

#modifyRoomContentBtn {
	border: 2px solid green;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-style: dashed;
}

#deleteGroupBtn {
	border: 2px solid orange;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-style: dashed;
}

#goBackBtn {
	font-family: "AppleSDGothicNeoB.ttf";
	font-size: 17px;
	float: right;
}

#kickoutBtn {
	border: 2px solid orange;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-style: dashed;
}

#signoutGroupBtn {
	border: 2px solid orange;
	color: white;
	font-family: "AppleSDGothicNeoL.ttf";
	border-style: dashed;
}

.text-area {
	font-size: 13px;
	margin-bottom: 10px;
	color: rgb(137, 133, 133);
}

.title-area {
	font-size: 15px;
}

.title-area {
	margin-bottom: 20px;
}

.reason-area {
	font-size: 15px;
	margin-top: 10px;
	margin-bottom: 10px;
}

textarea {
	margin-top: 10px;
	resize: none;
	width: 100%;
	height: 150px;
}

.reason-area-head {
	margin-bottom: 10px;
}

.reason-area-head>span:first-child {
	margin-right: 20px;
}

.reason-area-head>span:nth-child(2) {
	font-size: 13px;
	color: rgb(137, 133, 133);
}

.reportArea {
	border: 1px solid rgb(200, 197, 197);
	padding: 20px;
	padding-bottom: 10px;
}

.foot-text-area {
	font-size: 13px;
	color: rgb(137, 133, 133);
}

.detail {
	margin-top: 15px;
}

#reportBtn {
	float: right;
	color: white;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.message_box {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="study_banner">
			<p class="main_text">나의 그룹방🙋🏻‍♀️🙋🏻‍♂️</p>
		</div>
		<p class="message_box">
			그룹방 내에선 그룹의 규칙을 준수해주세요.<br>
		</p>
		<br>
	</div>
	<div class="container">
		<!-- 그룹방 상세 -->
		<div class="row">
			<div class="col-4 title">
				<p titleTxt>${groupDto.group_title}</p>
			</div>
			<div class="col-2 category">
				<p categoryTxt>카테고리 | ${groupDto.group_std_key}</p>
			</div>
			<div class="col-1 member">
				<p memberTxt>인원 | ${groupDto.group_memCount} / ${groupDto.group_max}</p>
			</div>
			<div class="col groupListbtn">
				<button class="btn" id="goBackBtn">그룹 리스트 🔙</button>
			</div>
		</div>
		<div class="row box">
			<div class="col-3 listBox">
				<!-- 방장의 한마디 -->
				<div class="row" style="margin: 20px">
					<p class="groupGoal">Group's Goal 💪🏻</p>
					<p class="groupGoal2">방장이 설정한 우리 그룹의 목표입니다.</p>
					<div class="goaltxt">
						"${groupDto.group_content}"<br>
						<br>
					</div>
					<c:if test="${loginSession.mem_seq eq groupDto.mem_seq}">
						<button class="btn" id="modifyRoomContentBtn" data-bs-toggle="modal"
							data-bs-target="#modifyRoomContentModal"
						>방장의 한마디 수정</button>
					</c:if>
				</div>
				<!-- 그룹방 참가자 리스트 -->
				<div class="row" style="margin: 20px">
					<p class="groupMember">Group's Members🏃🏻</p>
					<p class="groupMember2">우리 그룹의 멤버입니다.</p>
					<div style="background-color: none; height: 200px">
						<c:if test="${not empty memberList}">
							<c:forEach items="${memberList}" var="dto">
								<p class="memList">👤${dto.mem_nick}</p>
							</c:forEach>
						</c:if>
					</div>
				</div>

				<!-- 기타 버튼들 -->
				<div class="col text-center">
					<c:if test="${loginSession.mem_seq eq groupDto.mem_seq}">
						<button class="btn" id="deleteGroupBtn">그룹 삭제</button>
						<button class="btn" id="kickoutBtn" data-bs-toggle="modal" data-bs-target="#kickoutModal">그룹원
							추방</button>
					</c:if>
					<c:if test="${loginSession.mem_seq ne groupDto.mem_seq}">
						<button class="btn" id="signoutGroupBtn">그룹 나가기</button>
					</c:if>
				</div>
			</div>
			<!-- 채팅창 -->
			<div class="col-9 chatBox">
				<span class="chatMsg">실시간 채팅 💬</span> <span><button type="button" class="btn"
						id="reportBtn"
					>신고하기🚨</button></span>
				<div class="chat-grid">
					<div class="chat-content" id='chatContent'>
						<c:if test="${not empty chatList}">
							<c:forEach items="${chatList}" var="dto">
								<c:if test="${dto.mem_nick eq loginSession.mem_nick}">
									<div style="text-align: right">
										<div style="display: inline; padding: 5px; margin: 10px; font-size: small">
											${dto.mem_nick}</div>
										<br> <br>
										<div
											style="display: inline; background-color: rgb(112, 112, 112); color: white; padding: 5px; margin: 10px; border-radius: 5px 5px 5px;"
										>${dto.chat_content}</div>
										<br> <br>
									</div>
								</c:if>
								<c:if test="${dto.mem_nick ne loginSession.mem_nick}">
									<div>
										<div style="display: inline; padding: 5px; margin: 10px; font-size: small">
											${dto.mem_nick}</div>
										<br> <br>
										<div
											style="display: inline; background-color: rgb(255, 255, 255); padding: 5px; margin: 10px; border-radius: 5px 5px 5px;"
										>${dto.chat_content}</div>
										<br> <br>
									</div>
								</c:if>
							</c:forEach>
							<div style="text-align: center; background-color: rgb(255, 255, 255)">
								<span>이상 이전 메세지</span>
							</div>
						</c:if>
					</div>
					<div class="chat-input">
						<input type="text" id="chatTextInput" name="chatTextInput" placeholder="  이곳에 메세지를 입력해주세요.">
						<button type="button" id="chatSend">
							<img class="send_msg" src="/resources/images/send_msg.png">
						</button>
						<!-- 버튼 삭제 -->
					</div>
				</div>
			</div>
			<!-- 여기까지 채팅창 -->
		</div>
	</div>
	<!-- 여기서부터 방장 한마디 수정 모달 -->
	<div class="modal fade" id="modifyRoomContentModal" tabindex="-1"
		aria-labelledby="modifyRoomContentModalLabel" aria-hidden="true"
	>
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
	<div class="modal fade" id="kickoutModal" tabindex="-1" aria-labelledby="kickoutModalLabel"
		aria-hidden="true"
	>
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

	<!-- 이하 신고 처리 모달 -->
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">그룹 유저 신고</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="text-area">
                        <span> 유저 신고는 study hepler 이용수칙에 맞지 않는 유저를 신고하는 기능이며
                            반대 의견을 표시하는 것이 아닙니다. 사용자님의 관심과 신고가 건전하고 올바른 study helper
                            문화를 만듭니다. 허위신고의 경우 신고자가 제재받을 수 있음을 유념해주세요.<br>
                            또한, 보안상의 이유로 현재 그룹 내에 존재하는 유저만 신고가 가능합니다.
                        </span>
                    </div>
                    <div class="reportArea">
                        <div class="title-area">
                            <label class="label" for="title"><span>신고할 유저 닉네임</span></label>
                            <input type="text" class="form-control" id="title" name="title">
                        </div>
                        <div class="reason-area">
                            <div class="reason-area-head">
                                <span><b>신고사유</b></span><span>여러 사유에 해당하는 경우 대표적인 사유 1개만 선택해 주세요.</span>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio1" value="영리목적/홍보성" checked>
                                        <label class="form-check-label" for="inlineRadio1">영리목적/홍보성</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio2" value="개인정보노출">
                                        <label class="form-check-label" for="inlineRadio2">개인정보노출</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio3" value="음란성/선정성">
                                        <label class="form-check-label" for="inlineRadio3">음란성/선정성</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio4" value="욕설/인신공격">
                                        <label class="form-check-label" for="inlineRadio4">욕설/인신공격</label>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio5" value="같은 내용 반복(도배)">
                                        <label class="form-check-label" for="inlineRadio5">같은 내용 반복(도배)</label>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="report_reason"
                                            id="inlineRadio6" value="기타">
                                        <label class="form-check-label" for="inlineRadio6">기타</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row detail">
                                <div class="col">
                                    <label class="form-check-label" for="textArea">상세내용(선택)</label>
                                    <textarea id="detail-textarea"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="text-area">
                            <span> 권리침해/저작권위반 등은 권리침해 신고센터를 통해 문의해주세요.
                            </span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="reportCancelBtn">취소</button>
                    <button type="button" class="btn btn-danger" id="reportSubmitBtn">신고하기</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 이상 신고 처리 모달 -->
    <script>
    	
        let ws = new WebSocket("ws://192.168.20.12/group/detail")
        
        // 전송 버튼 삭제로 인해 없앰
         document.getElementById('chatSend').addEventListener('click', (e) => {
            let message = document.getElementById('chatTextInput').value
            if (message !== '') { // message가 빈 값이 아닐 때만 전송
                ws.send(message) // 서버의 endpoint에 메세지 전송
                document.getElementById('chatTextInput').value = ''
                
                let chatContent = document.getElementById('chatContent')
                chatContent.scrollTop = chatContent.scrollHeight
            }
        })
        
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
                    'background-color' : 'rgb(0, 17, 84)',
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
            
            let chatContent = document.getElementById('chatContent');
            if(messageData.message === "축하" || messageData.message === "추카" || messageData.message === "축하해" || messageData.message === "축하해요" || messageData.message === "ㅊㅋㅊㅋ"){
        		pop();
        		window.setTimeout(render, 700);
        		messageDiv.attr({onclick : "pop()"});
           	}
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
    
    // 신고 모달 객체 전역변수로 선언
    let reportModal = new bootstrap.Modal(document.getElementById('reportModal'))
        
    // 신고 모달 버튼 눌렀을 시
    $('#reportBtn').on('click', (e) => {
    	reportModal.show()
    })
    
    // 신고 제출 버튼 눌렀을 시
    $('#reportSubmitBtn').on('click', (e) => {
    	let mem_nick = $('#title').val()
    	let report_nick = "${loginSession.mem_nick}"
        let report_reason = $(".form-check-input:checked").val();
        let report_reason_detail = $("#detail-textarea").val();
        
       	if (mem_nick === "") {
       		alert('신고할 유저 닉네임을 입력해주세요.')
       	} else {
       		$.ajax({
       			url : "/group/kickoutCheck",
       			type : "get",
       			data : { mem_nick : mem_nick },
       			success : (result) => {
       				if (result === 'no_data') {
       					alert('해당 유저가 존재하지 않습니다.')
       				} else if (result === 'not_same_room') {
       					alert('현재 그룹 내에 존재하는 유저를 신고해주세요.')
       				} else if (result === 'same_room') {
       					if (mem_nick === report_nick) {
       						alert('자기 자신을 신고할 수 없습니다.')
       					} else {
       						let reportConfirm = confirm('정말 해당 유저를 신고하시겠습니까?')
       						if (reportConfirm) {
       							$.ajax({
       								url : "/group/report",
       								type : "post",
       								data : { mem_nick : mem_nick, report_nick : report_nick, report_reason : report_reason, report_reason_detail : report_reason_detail },
       								success : (re_result) => {
       									if (re_result === 'success') {
       										alert('신고가 완료되었습니다.')
           							    	reportModal.hide()
       									}
       								},
       								error : (er_error) => {
       									console.log(er_error)
       								}
       							})
       						}
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
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>