<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<title>회원탈퇴</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

#bodylist {
	width: 515px;
	padding: 30px;
	background-color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
#allbody {
	background-color: white;
	width: 100%;
	height: 650px;
	position: relative;
}
.line {
	border-bottom: 2px solid black;
}
.navItem {
	font-size: 20px;
	margin: 8px;
	text-decoration-line: none;
	color: black;
}

#txtSt {
	color: black;
	font-size: 20px;
	text-decoration-line: none;
	font-family: "AppleSDGothicNeoL.ttf";
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
.btn-area{
padding-top:20px;
}
.nav-link{
	font-size: 20px;
}
.nickDeco{
font-family: "AppleSDGothicNeoB.ttf";
font-size: 30px;

}
.outMsg{
font-family: "AppleSDGothicNeoL.ttf";
font-size: 14pt;
text-align:center;
text-decoration: underline;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		  <div class="row justify-content-center">
			<!-- 사이드 내비바 -->
			<div class="col-3 menubar">
					<p class="nickDeco">
						<span>${loginSession.mem_nick}</span><span> 님,</span>
		<br>
						<span>오늘도 화이팅!💪🏻</span>
						<br>
						<br>
					</p>
					<ul class="nav flex-column">
						<li class="nav-item navItem"><a class="nav-link active" id="txtSt" aria-current="page"
							href="/mypage/myPage"
						>나의 그룹👨‍👩‍👧‍👦</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myBoard">나의 활동내역✍🏻</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myInfo">회원정보 수정✏️</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myDropout">회원탈퇴👋</a></li>
					</ul>
				</div>
			<!-- content body -->

			<div class="col-9">
				<p>
				<h3>회원탈퇴</h3>
				</p>
				<div class="line"></div>
				<div class="col-sm-10 wrap" id="allbody">

					<div class="container d-flex justify-content-center" id="bodylist">
				
				<div class="row p-2">		
					<div class="row withdrawal-input">
						<div class="row withdrawal-info">
						    <div class="col-12 d-flex justify-content-center">
						    <p class="outMsg">지금 떠나면 공부했던 기록이 모두 사라져요!😢
						   <br>
						   <br>
						    	<p>
						    
						    </div>
						<div class="col-12 term-box">
						
							<div class="row p-2">
							<div class="col-1">1.</div>
							 <div class="col-11">탈퇴시 고객님의 정보는 소비자 보호에 관한 법률에 의거한 고객정보 보호 정책에 따라 청약철회에 관한
								기록, 대금결제 및 재화 등의 기록은 법정 기간에 따라 관리됩니다.</div>
							</div>	
							
							<div class="row p-2">
							<div class="col-1">2.</div>
							 <div class="col-11">탈퇴 후 나의 커뮤니티 등의 게시물은 관리가 불가 하오니, 저장을 원하시는 경우
								탈퇴 전 관리해 주시기 바랍니다.</div>
							</div>	
							
							<div class="row p-2">	
							<div class="col-1">3.</div>
							 <div class="col-11">탈퇴 후 기록관련 서비스는 삭제됩니다.</div>
							 </div>
						</div>
						<div class="row p-2 d-flex justify-content-end" style="margin-left:0px;">
							<div class="col-1"><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></div>
							<div class="col-11"><label class="form-check-label"	for="flexCheckDefault"> 위 내용을 모두 숙지하였습니다. </label></div>
						</div>
						<br>
						<div class ="row p-2" style="margin-left:0px">
							<div class="col-3" style="padding-right:0px; padding-top:5px;">
								<span style="vertical-align:middle;">* 비밀번호</span>
							</div>
							<div class="col-9">
								<input type="password" class="form-control withdrawPw" placeholder="비밀번호를 입력해주세요." id="dropoutPw" name="mem_pw">
							</div>
						</div>
						
						
						</div>
							
							<div class="btn-area d-flex justify-content-center">
								<button type="button" class="btn btn-light btnCancle" id="btnCancel">취소하기</button>
								<button type="button" class="btn btn-danger btnWithdraw" id="dropoutBtn">탈퇴하기</button>
							</div>
					</div>
				</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp" />
	<script>
	// 취소하기 버튼 누르면 마이페이지->나의그룹 페이지로 이동
	document.getElementById("btnCancel").onclick = function(){
		location.href = "/mypage/myPage"
	}
	
	// 탈퇴하기 버튼을 눌렀을 때  --> 체크박스 체크여부 확인 / 비밀번호 동일한지 확인하기!  --> confirm창으로 탈퇴여부 재차 물어보기

		$("#dropoutBtn").on("click", function() {
			// 체크박스
			if (!$("#flexCheckDefault").prop('checked')) {
				alert("회원탈퇴 안내를 숙지해주세요.");
				return;
			}
	
		let dropoutPw = $("#dropoutPw").val();
		if($("#dropoutPw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}else{
			
		}	
		
		$.ajax({
			url : "/mypage/dropoutForm"
			,type : "post"
			,data : { mem_pw : dropoutPw}
			,success : function(data) {
				console.log(data);
				if (data == "success") {
					
					let result = confirm("정말 탈퇴하시겠습니까?");
					console.log(result);
					if (!result) { // confirm 창에서 확인버튼을 눌렀을 때 아이디 삭제 후 메인페이지로 이동

						location.href="/mypage/myPage"

					} else { // confirm 창에서 취소버튼 눌렀을때 마이페이지의 구독화면으로 이동
						$.ajax({
							url : "/mypage/dropoutConfirm"
							,type : "get"
							,success : function(confirm) {
								console.log(confirm);
								if(confirm=="success"){
								alert("이용해주셔서 감사합니다.");
								location.href = "/"; // 회원 탈퇴완료 후 메인페이지로 이동
								}else{
									alert("회원탈퇴에 실패했습니다. 고객센터에 문의하세요");
									location.href="/mypage/myPage";
								}
							},
							error : function(e) {
								console.log(e);
							}
						});
						
					}
					
				} else {
					alert("올바른 비밀번호를 입력해주세요.");
					return;
				}

			},
			error : function(e) {
				console.log(e);
			}
		});
	</script>
	

</body>
</html>