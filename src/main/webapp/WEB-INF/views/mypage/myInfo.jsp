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
<title>myInfo</title>
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
.nav-link{
	font-size: 20px;
}
#changePW{
	font-size: x-small;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
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
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="/mypage/myPage">나의 그룹</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myBoard">나의 커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myPlanner">나의 플래너</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myInfo">회원정보 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myDropout">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<!-- content body -->

			<div class="col-9">
				<p>
				<h3>회원정보 수정</h3>
				</p>
				<div class="line"></div>
				<div class="col-sm-10 wrap" id="allbody">

					<div class="container d-flex justify-content-center" id="bodylist">

						<form id="updateForm" action="/mypage/updateForm" method="post">


							<div class="row p-2">
								<div class="col-5">
									<label for="id" class="form-label">아이디 (이메일)</label>
								</div>
								<div class="col-7"></div>
								<div class="col-12">
									<input type="text" class="form-control" id="mem_id"
										name="mem_id" value="${loginSession.mem_id}" readonly>
								</div>
							</div>

							

							<div class="row p-2">
								<div class="col-3">
									<label class="form-label">닉네임</label>
								</div>
								<div class="col-9" style="padding: 0px;">
									<div class="check checkFalse" id="nameFalse"
										style="display: none;">*조건에 맞게 입력해주세요.</div>
									<div class="check checkTrue" id="nameTrue"
										style="display: none;">*사용 가능한 닉네임입니다.</div>
								</div>
								<div class="col-12 mb-2">
									<input type="text" class="form-control" name="mem_nick" value="${loginSession.mem_nick}"
										required onkeyup="nameCheck();"> <span
										style="font-size: 10px;">*3~10자의 영문 대소문자와 숫자, 한글로만
										입력하세요.</span>
								</div>
							</div>

							<div class="row p-2">
								<div class="col-4">
									<label for="studySubject" class="form-label">관심있는 공부</label>
								</div>
								<div class="col-8" style="padding: 0px;">
									<div class="selectPlz">*선택 필수</div>
								</div>
								<div class="col-12 mb-2">
									<select class="form-select" aria-label="Default select example"	id="memStdkey" name="mem_std_key">
										<option selected value="${loginSession.mem_std_key}">${loginSession.mem_std_key}</option>
										<option value="초등학생">초등학생</option>
										<option value="중학생">중학생</option>
										<option value="고등학생">고등학생</option>
										<option value="수능/N수">수능/N수</option>
										<option value="자격증">자격증</option>
										<option value="취준생">취준생</option>
										<option value="기타">기타</option>
									</select>
								</div>
							</div>
							
							<div class="row p-2">
								<div id="changePW">*비밀번호 변경은 비밀번호 찾기를 통해 변경이 가능합니다.</div>
								<div id="changePW" style="margin-left:4px;">비밀번호 찾기로 이동하려면
										<a href="/member/login" style="font-size: x-small; color: #0d6efd; padding: 0px;">여기</a>
													를 클릭해주세요.</div>
								
							</div>

						</form>
					</div>
				</div>

				<div class="row justify-content-center"
					style="margin-top: 30px; margin-bottom: 30px;">
					<div class="col-4 d-flex justify-content-end"
						style="margin-right: 10px;">
						<button type="button" id="btnCancel" class="w-btn w-btn-indigo">취소하기</button>
					</div>
					<div class="col-4 d-flex justify-content-start"
						style="margin-left: 10px;">
						<button type="button" id="updateBtn" class="w-btn w-btn-skin">수정하기</button>
					</div>
				</div>
			</div>

		</div>
	</div>
	<script>
	// 취소하기 버튼 누르면 마이페이지->나의그룹 페이지로 이동
	document.getElementById("btnCancel").onclick = function(){
		location.href = "/mypage/myPage"
	}
	
	 // 수정 버튼을 눌렀을 때 유효성 검사 후 form 제출
	$("#updateBtn").on("click", function() {
		let regexName = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]{3,10}$/; // 닉네임 정규식 3~10자의 영문 대소문자와 숫자, 한글 
		// 유효성 검사
		if (!regexName.test($('input[name=mem_nick]').val())) {
			alert("형식에 맞지 않는 닉네임입니다.");
			return;
		}else if ($("#memStdkey").val() === "선택") {
			alert("직업을 선택해주세요.");
			return;
		}

		alert("회원정보가 수정되었습니다.");
		// form 제출
		document.getElementById("updateForm").submit();
	})
		
	</script>
</body>
</html>