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
<title>myDropout</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

#bodylist {
	width: 450px;
	padding: 30px;
	background-color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.sidebar {
	margin-top: 100px;
}

.line {
	border-bottom: 2px solid black;
}

#allbody {
	background-color: aliceblue;
	width: 100%;
	height: 650px;
	position: relative;
}
</style>
</head>
<body>
	<div class="container sidelist">
		<div class="row p-2">
			<!-- 사이드 내비바 -->
			<div class="col-3">
				<div class="sidebar">
					<h2>
						<span>${loginSession.mem_nick}</span><span>님</span>
					</h2>
					<h3>
						<span>안녕하세요.</span>
					</h3>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="/mypage/myGroup">나의 그룹</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myBoard">내가 쓴 문의</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myInfo">회원정보 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myDropout">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<!-- content body -->

			<div class="col-9">
				<p>
				<h3>내가 쓴 문의</h3>
				</p>
				<div class="line"></div>
				<div class="col-sm-10 wrap" id="allbody">

					<div class="container d-flex justify-content-center" id="bodylist">
				
				<div class="row p-2">		
					<div class="row withdrawal-input">
						<div class="col-4">
							<span>* 비밀번호</span>
						</div>
							<div class="col-8">
								<input type="password" class="form-control withdrawPw"
									placeholder="비밀번호를 입력해주세요." id="dropoutPw" name="mem_pw">
							</div>
							<div class="btn-area">
								<button type="button" class="btn btn-light btnCancle">취소하기</button>
								<button type="button" class="btn btn-danger btnWithdraw" id="dropoutBtn">탈퇴하기</button>
							</div>
					</div>
					</div>
					</div>
				</div>

			</div>

		</div>
	</div>
	<script>
	// 탈퇴하기 버튼을 눌렀을 때  --> 체크박스 체크여부 확인 / 비밀번호 동일한지 확인하기!  --> confirm창으로 탈퇴여부 재차 물어보기
	$("#dropoutBtn").on("click", function() {
		let dropoutPw = $("#dropoutPw").val();
		if($("#dropoutPw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			return;
		}
		$.ajax({
			url : "/mypage/dropoutForm"
			,type : "post"
			,data : { mem_pw : dropoutPw}
			,success : function(data) {
				console.log(data);
				if (data === "success") {
					
//					let result = confirm("정말 탈퇴하시겠습니까?");
//					console.log(result);
//					if (result) { // confirm 창에서 확인버튼을 눌렀을 때 아이디 삭제 후 메인페이지로 이동

//						$.ajax({
//							url : "/mypage/dropoutConfirm"
//							,type : "get"
//							,success : function(confirm) {
//								console.log(confirm);
//							},
//							error : function(e) {
//								console.log(e);
//							}
//						});
						alert("이용해주셔서 감사합니다.");
						location.href = "/"; // 회원 탈퇴완료 후 메인페이지로 이동 

//					} else { // confirm 창에서 취소버튼 눌렀을때 마이페이지의 구독화면으로 이동
//						location.href = "/mypage/myGroup";
//					}
				} else {
					alert("올바른 비밀번호를 입력해주세요.");
					return;
				}

			},
			error : function(e) {
				console.log(e);
			}
		});
		
	});
	</script>
</body>
</html>