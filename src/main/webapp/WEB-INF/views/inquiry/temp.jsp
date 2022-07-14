<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<title>문의하기</title>

</head>
<body>
    <div class="container">
        <div class="inquiry_banner">
            <p class="main_text">CONTACT US</p>
            <p class="message_box">스터디헬퍼를 이용하면서 궁금했던 점이 있었나요? 어떤 문의라도 환영입니다.<br>
                건의사항 및 서비스 이용 시 불편했던 점 등등 무엇이든 헬퍼에게 하고 싶은 메세지를 보내주세요!
            </p>
        </div>
        <form class="gform" method="POST"
            action="https://script.google.com/macros/s/AKfycby37mebJGD2Oc4KNsRZvb-jQiBmsVYxG-EL8HkDxQ/exec">
            <div class="form-elements">
                <label for="title">제목</label>
                <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해주세요">
                <label for="email">문의 유형</label>
                <select class="form-control" name="category" id="category" style="width: 100px">
                    <option value="select" selected>선택하세요</option>
                    <option value="member">가입 관련 문의</option>
                    <option value="group">그룹 스터디 문의</option>
                    <option value="mystudy">공부하기 문의</option>
                    <option value="comunity">커뮤니티 문의</option>
                    <option value="etc">기타 문의</option>
                </select>
                <label for="email">이메일 주소</label>
                <input type="text" class="form-control" name="email" id="email" placeholder="가입 시 등록한 이메일을 입력해주세요">
                <label for="email">문의 내용</label>
                <textarea class="form-control" name="contents" id="contents" placeholder="내용을 입력해주세요"
                    style="height:170px;"></textarea><br />
                <div style="text-align: center;">
                    <button class="btn send"><img class="send_inquiry" src="images/sned_icon.png"></button>
                </div>
            </div>
            <div class="thankyou_message" style="display: none;">
                <h2>
                    감사합니다.<br>
                    검토 후 빠른 답변 드리겠습니다.
                </h2>
            </div>
            <script data-cfasync="false" type="text/javascript"
                src="https://cdn.rawgit.com/dwyl/html-form-send-email-via-google-script-without-server/master/form-submission-handler.js">
                </script>
        </form>
    </div>
</body>
</html>