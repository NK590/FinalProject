<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
<style>
body {
	box-sizing: border-box;
	margin-top: 60px;
}

</style>
</head>

<body>
	<div class="container">
		<form id="findPasswordForm">
			<div class="row">
				<div class="col-12 mb-5 d-flex justify-content-center">
					<h2 id="abcde">비밀번호 찾기</h2>     
				</div>                
			</div>
            <div id="abab">*비밀번호는 가입시 입력하신 이메일을 통해 변경 할 수 있습니다.</div>

			<div class="row p-2">
				<label for="nick" class="form-label" id="cdcd">이메일</label>
				<div class="col-7" style="margin-top:6px;">
					<input type="text" class="form-control" id="mem_id" name="mem_id" value="${mem_id}" placeholder="이메일을 입력하세요.">
				</div>
				<div class="col-5" style="margin-bottom:6px;" id="checkNumSend">
					<button type="button" id="certificationBtn">인증번호발송</button>
				</div>
			</div>
			<div class="row p-2">
				<div class="col-7">
					<input type="text" class="form-control" id="randomCode" maxlength="6"
						placeholder="인증번호를 입력하세요.">
				</div>
				<div class="col-5">
					<button type="button" id="ranNumCheck">확인</button>
				</div>
			</div>
			
			<div class="row p-2">
				<div class="col-7" style="margin-top:6px;">
					<input type="password" class="form-control" id="mem_pw" name="mem_pw" value="${mem_pw}" disabled placeholder="변경할 비밀번호를 입력하세요.">
				</div>
				<div class="col-5" style="margin-top:6px;">
					<button type="button" id="changePw">비밀번호 변경</button>
				</div>
			</div>
            <div class="row justify-content-center">
                <div class="col-3 d-flex justify-content-center">
                    <button type="button" id="loginButton" class="btn btn-primary">로그인</button>
            </div>
            </div>
		</form>
	</div>
		<script>
		// 이메일 가입확인 요청
		/*
		document.getElementById("checkIdBtn").onclick = function(){
			let checkEmail = $("#mem_id").val();
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
			$.ajax({
				url : "/member/checkEmailForm"
				,type : "post"
				,data : {mem_id:checkEmail}
				,success : function(data){
					console.log(data);
					if(!regexId.test($("#mem_id").val())){
						alert("형식에 맞지 않는 이메일입니다.");
					}else if(data == "no"){
						alert("이메일 확인!");
						document.getElementById("certificationBtn").style.display="block";
						return "/member/passwordSearch";
					}else if(data == "ok"){
						alert("등록된 이메일이 없습니다.");
						return "no";
					}
					
				}
			})
			
		}
		*/
		
		// 인증번호 발송버튼 누르면 
		/*
		document.getElementById("certificationBtn").onclick = function() {
		alert("인증코드 발송!");
		let mem_id = $("#mem_id").val();
		console.log(mem_id);

		$.ajax({
			url : "/member/certificationEmail"
			,type : "post"
			,data : { mem_id : mem_id }
			,timeout : 600000
			,success : function(data) {
				 console.log("=================data===============");
				 console.log(data);
			document.getElementById("ranNumCheck").onclick = function() {

			console.log($("#randomCode").val());
			console.log(data);
			let randomCode = /[0~9]{6}/;
			let mem_pw = document.getElementById("mem_pw");

			console.log("${rs}");
				if ($("#randomCode").val() == data) {
					alert("인증성공");
					mem_pw.disabled = false;
			    }else {
					alert("인증실패");
					mem_pw.disabled = true;
				}
			}
		},error : function(e) {
				console.log("ERROR : ", e);
				console.log("ERROR : ", e.resultMsg);
			}
		});
	}
		*/
		
	
		//인증번호 발송 버튼 누르면
		document.getElementById("certificationBtn").onclick = function() {
			let checkEmail = $("#mem_id").val();
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			let mem_id = $("#mem_id").val();
			console.log(mem_id);

			$.ajax({
				url : "/member/checkEmailForm"
				,type : "post"
				,data : {mem_id:checkEmail}
				,success : function(data){
					console.log(data);
					if(!regexId.test($("#mem_id").val())){
						alert("형식에 맞지 않는 이메일입니다.");
					}else if(data == "no"){
						alert("인증코드 발송!");
						$.ajax({
							url : "/member/certificationEmail"
							,type : "post"
							,data : { mem_id : mem_id }
							,timeout : 600000
							,success : function(data) {
								 console.log("=================data===============");
								 console.log(data);
							document.getElementById("ranNumCheck").onclick = function() {

							console.log($("#randomCode").val());
							console.log(data);
							let randomCode = /[0~9]{6}/;
							let mem_pw = document.getElementById("mem_pw");

							console.log("${rs}");
								if ($("#randomCode").val() == data) {
									alert("인증성공");
									mem_pw.disabled = false;
							    }else {
									alert("인증실패");
									mem_pw.disabled = true;
								}
							}
						},error : function(e) {
								console.log("ERROR : ", e);
								console.log("ERROR : ", e.resultMsg);
							}
						});

						
					}else if(data == "ok"){
						alert("등록된 이메일이 없습니다.");
						return "no";
					}
					
				}
			})
			
			
		}
		
		// 비밀번호 변경버튼 누르면 
		document.getElementById("changePw").onclick = function() {
		let pwForm = $("#findPasswordForm").serialize();
		let mem_pw = $("#mem_pw").val();
		let regExpPwd = /^[a-zA-Z0-9~!@#$%^&*()_+=?]{6,12}$/;
		console.log(mem_pw);
		
		$.ajax({
			url : "/member/findPassword"
			,type : "post"
			,data : pwForm
			,success: function(data){
				if(!regExpPwd.test($("#mem_pw").val())){
					alert("형식에 맞지 않는 비밀번호입니다.");
					return;
				}else if(confirm("변경하시겠습니까?")){
					alert("비밀번호가 변경되었습니다.");
					$("#mem_pw").attr("readonly",true);
					return;
				}
				
			}
		})
		
		}
		
		// 로그인 버튼 누르면
		document.getElementById("loginButton").onclick = function() {
			self.close();
		}
		

			
		

		</script>
		
		
</body>
</html>