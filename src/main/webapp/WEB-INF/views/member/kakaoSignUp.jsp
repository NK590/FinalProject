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
<title>카카오 로그인</title>
<style>
body {
	box-sizing: border-box;
}

#checkIdBtn {
	border-radius: 10px;
	border: 1px solid black;
}

#btnCancel {
	background-color: rgb(164, 166, 248);
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 25px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: bold;
	margin-right: 25px;
	height:50px;
}

#submitBtn {
	background-color: #6cb6f7;
	position: relative;
	border: none;
	display: inline-block;
	padding: 15px 25px;
	border-radius: 15px;
	text-decoration: none;
	font-weight: bold;
	margin-left: 25px;
	height:50px;
}

.checkFalse {
	color: rgb(248, 26, 26);
	font-size: xx-small;
	margin-top: 7px;
}

.checkTrue {
	color: rgb(26, 188, 156);
	font-size: xx-small;
	margin-top: 7px;
}

.selectPlz {
	font-size: xx-small;
	margin-top: 7px;
}

</style>
</head>
<body>
	<div class="container"
		style="border-radius: 30px; width: 450px; border: 3px solid #1e8ae972">
		<form id="memberForm" action="/member/signupForm" method="post">
			<div class="row m-3" >
				<div class="col d-flex justify-content-center">
					<h2>카카오 회원가입</h2>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-12">
					<label for="id" class="form-label">아이디 (이메일)</label>
				</div>
				<div class="col-8">
					<input type="text" class="form-control" id="mem_id" name="mem_id" value="${mem_id}" readonly>
				</div>
				<!--
				<div class="col-4">
					  <button type="button" id="checkIdBtn">이메일 확인</button>
				</div>
				-->
			</div>


			<div class="row p-2">
				<div class="col-3">
					<label class="form-label">닉네임</label>
				</div>
				<div class="col-9" style="padding: 0px;">
					<div class="check checkFalse" id="nameFalse" style="display: none;">*조건에
						맞게 입력해주세요.</div>
					<div class="check checkTrue" id="nameTrue" style="display: none;">*사용
						가능한 닉네임입니다.</div>
					<div class="check checkNick" id="nameNick" style="display: none;">*중복된
						닉네임 입니다.</div>
				</div>
				<div class="col-12 mb-2">
					<input type="text" class="form-control" id="mem_nick" name="mem_nick" required
						onkeyup="nameCheck();"> <span style="font-size: 10px;">*3~10자의
						영문 대소문자와 숫자, 한글로만 입력하세요.</span>
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
					<select class="form-select" aria-label="Default select example"
						id="memStdkey" name="mem_std_key">
						<option selected value="선택">선택</option>
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
		</form>

	</div>

	<div class="row justify-content-center"
		style="margin-top: 30px; margin-bottom: 30px;">
		<div class="col-4 d-flex justify-content-end"
			style="margin-right: 10px;">
			<button type="button" id="btnCancel" class="w-btn w-btn-indigo">취소하기</button>
		</div>
		<div class="col-4 d-flex justify-content-start"
			style="margin-left: 10px;">
			<button type="button" id="submitBtn" class="w-btn w-btn-skin">가입하기</button>
		</div>
		<input type="text" id="checkinput" class="d-none">
	</div>


	<script>
		// 취소하기 버튼 누르면 로그인 페이지로 이동
		document.getElementById("btnCancel").onclick = function(){
			location.href = "/member/login"
		}
		
		// 이메일 확인 버튼 누르면 팝업창 띄우기
//		document.getElementById("checkIdBtn").onclick = function() {
//			let url = "/member/popup"; 
//			let name = "이메일 중복검사"; 
//			let option = "width=600, height=300, left=500, top=300"; 
//			window.open(url, name, option);
//		}


		 // 닉네임
        function nameCheck(){
			 let regExpName = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]{3,10}$/;
			 let mem_nick = $('#mem_nick').val();
			 
			 if(!regExpName.test($('#mem_nick').val())){// 이름을 잘못 입력한 경우
		            $("#nameFalse").attr('style',"display:block");
		            $("#nameTrue").attr('style',"display:none");
		            $("#nameNick").attr('style',"display:none");
		     } else {// 사용 가능 이름
		            
		        	 $.ajax({
		 				url : "/member/nickForm"
		 				,type : "post"
		 				,data : {mem_nick : mem_nick}
		 				, success: function(data){
		 					if(data === "ok"){
		 						$("#nameTrue").attr('style',"display:block");
		 						$("#nameNick").attr('style',"display:none");
		 						$("#nameFalse").attr('style',"display:none");
		 						$("#checkinput").val(data);
		 						return;
		 					}else if(data === "no"){
		 						$("#nameNick").attr('style',"display:block");
		 						$("#nameTrue").attr('style',"display:none");
		 						$("#nameFalse").attr('style',"display:none");
		 						$("#checkinput").val(data);
		 						return;
		 					}
		 				}, error : function(e){
		 					console.log(e);
		 				}
		 			})
		        	 
		         }
		         if(mem_nick == ""){
		            $("#nameFalse").attr('style',"display:none");
		         }
}	 
		 
      

		
		 // 가입 버튼을 눌렀을 때 유효성 검사 후 form 제출
		$("#submitBtn").on("click", function() {
			//let regExpPwd = /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?=[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{6,12}$/; // 비밀번호 정규식 (영문자, 숫자,~!@#$%^&* 6~10자리)
			let regexName = /^(?=.*[a-zA-Z0-9가-힣])[a-zA-Z0-9가-힣]{3,10}$/; // 닉네임 정규식 3~10자의 영문 대소문자와 숫자, 한글 
			let regExpPwd = /^[a-zA-Z0-9~!@#$%^&*()_+=?]{6,12}$/;
			// 유효성 검사
			if ($('input[name=mem_id]').val() === "") {
				alert("이메일을 입력해 주세요.");
				return;
			} else if (!regExpPwd.test($('input[name=mem_pw]').val())) {
				alert("형식에 맞지 않는 비밀번호입니다.");
				return;
			} else if ($("#pwCheck").val() !== $("#mem_pw").val()) {
				alert("비밀번호와 비밀번호 확인창의 값이 일치하지 않습니다.");
				return;
			} else if (!regexName.test($('input[name=mem_nick]').val())) {
				alert("형식에 맞지 않는 닉네임입니다.");
				return;
			}else if ($("#memStdkey").val() === "선택") {
				alert("관심분야를 선택해주세요.");
				return;
			}else if ($("#checkinput").val() === "no"){
				alert("중복된 닉네임입니다.");
				return;
			}

			alert("환영합니다");
			// form 제출
			document.getElementById("memberForm").submit();
		})
		
	</script>
</body>
</html>