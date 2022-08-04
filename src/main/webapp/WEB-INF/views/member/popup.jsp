<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"
></script>
<title>이메일 인증</title>
<style>
body {
	margin: 30px;
}

#checkIdBtn {
	border: 1px solid white;
	background-color: white;
	color: solid rgb(8, 0, 83);
}

#certificationBtn {
	border-radius: 10px;
	border: 1px solid black;
}

#ranNumCheck {
	border-radius: 10px;
	border: 1px solid black;
	margin-left: 23px;
	background-color: white;
	width: 50px;
}

#cancelBtn {
	height: 20px;
	width: 100px;
	background-color: white;
	color: black;
	border: 1px solid rgb(8, 0, 83);
	border-radius: 15px;
	font-size: 15px;
	margin-top: 20px;
}

#useBtn {
	height: 20px;
	width: 100px;
	background-color: white;
	color: black;
	border: 1px solid red;
	border-radius: 15px;
	font-size: 15px;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container" style="border-radius: 30px; width: 550px; height: 200px;">
		<form id="checkIdForm">
			<div class='container'>
				<div class="row m-2 justify-content-start">
					<div class="col-8" style="padding-left: 0px;">
						<input type="text" class="form-control" id="mem_id" name="mem_id" value="${mem_id}"
							placeholder="이메일을 입력하세요."
						>
					</div>
					<div class="col-4" style="margin-top: 6px;">
						<button type="button" id="checkIdBtn">중복확인✔️️</button>
					</div>
				</div>

				<br>
				<div class="row m-3 justify-content-start">
					<div class="col-3" style="margin-top: 3px;">
						<span class="abcd">확인결과 :</span>
					</div>

					<div class="col-5" style="margin-top: 3px; padding: 0px;" id="okId"></div>
					<div class="col-4" style="margin-bottom: 6px;" id="checkNumSend">
						<button type="button" id="certificationBtn" style="display: none;">인증번호발송</button>
					</div>
					<script>
						//이메일인증 > 인증버튼 누르자  
						document.getElementById("certificationBtn").onclick = function() {
							alert("인증코드 발송!");
							let mem_id = $("#mem_id").val();
							console.log(mem_id);

							$
									.ajax({
										url : "/member/certificationEmail",
										type : "post",
										data : {
											mem_id : mem_id
										},
										timeout : 600000,
										success : function(data) {
											console
													.log("=================data===============");
											console.log(data);
											document
													.getElementById("ranNumCheck").onclick = function() {

												console.log($("#randomCode")
														.val());
												console.log(data);
												let randomCode = /[0~9]{6}/;
												let useBtn = document
														.getElementById("useBtn");
												let certificationBtn = document
														.getElementById("certificationBtn");

												console.log("${rs}");
												if ($("#randomCode").val() == data) {
													alert("인증성공");
													useBtn.disabled = false;
													document
															.getElementById("certificationBtn").style.display = "none";
												} else {
													alert("인증실패");
													useBtn.disabled = true;
												}
											}
										},
										error : function(e) {
											console.log("ERROR : ", e);
											console
													.log("ERROR : ",
															e.resultMsg);
										}
									});
						}
					</script>

				</div>

			</div>

			<div class="row m-2 justify-content-start">
				<div class="col-3">
					<span class="abcd">이메일 인증 : </span>
				</div>
				<div class="col-5">
					<input type="text" id="randomCode" maxlength="6" placeholder="인증번호를 입력하세요.">
				</div>
				<div class="col-4">
					<button type="button" id="ranNumCheck">확인</button>
				</div>
			</div>



			<div class="row m-2 justify-content-center">
				<div class="col-4 d-flex justify-content-end">
					<button type="button" class="w-btn w-btn-indigo" id="cancelBtn" style="height: 50px;">취소</button>
				</div>
				<div class="col-4 d-flex justify-content-start">
					<button type="button" class="w-btn w-btn-skin" style="height: 50px;" id="useBtn" disabled>사용</button>
				</div>
			</div>

		</form>
	</div>



	<script>
		// 이메일 중복확인 요청
		document.getElementById("checkIdBtn").onclick = function() {
			let checkEmail = $("#mem_id").val();
			console.log($("#mem_id").val());
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			console.log("이메일 중복확인 버튼 눌렀음");
			//if(!regexId.test($("#mem_id").val())){
			//alert("형식에 맞지 않는 아이디입니다.");
			//}

			$
					.ajax({
						url : "/member/checkEmailForm",
						type : "post",
						data : {
							mem_id : checkEmail
						},
						success : function(data) {
							console.log(data);
							if (!regexId.test($("#mem_id").val())) {
								alert("형식에 맞지 않는 아이디입니다.");
							} else if (data == "no") {
								document.getElementById("okId").innerHTML = "<span>중복된 이메일입니다.</span>";
								return "no";
							} else if (data == "ok") {
								document.getElementById("okId").innerHTML = "<span>사용가능한 이메일입니다.</span>";
								document.getElementById("certificationBtn").style.display = "block";
								return "/member/popup";
							}

						}
					})

		}

		/*
		$("#checkIdBtn").on("click", function() {
							let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
							if (!regexId.test($("#mem_id").val())) {
								alert("형식에 맞지 않는 아이디입니다.");
								return;
							}
							$("#checkIdForm").submit();

						})*/
		document.getElementById("useBtn").onclick = function() { // 사용가능 이메일 사용한다 했을때
			let regexId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (!regexId.test($('#mem_id').val())) {
				alert("형식에 맞지 않는 아이디입니다.");
				useBtn.disabled = true;
				return;
			}

			opener.document.getElementById("mem_id").value = document
					.getElementById("mem_id").value;
			self.close();
		}

		document.getElementById("cancelBtn").onclick = function() {
			self.close();
		}
	</script>

</body>
</html>