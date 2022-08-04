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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>login</title>
<style>
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
	background-color: white;
}

#id {
	width: 350px;
	margin-bottom: 20px;
}

#password {
	width: 350px;
	margin-bottom: 20px;
}

.loginTxt {
	font-family: "AppleSDGothicNeoB.ttf";
}

.emailSave {
	padding-bottom: 30px;
	text-align: center;
	margin-right: 140px;
}

.search {
	margin: 0 auto;
	font-size: 15px;
	text-align: center;
	font-weight: bold;
}

#idSearch {
	text-decoration-line: none;
	color: black;
}

#passwordSearch {
	text-decoration-line: none;
	color: black;
}

span {
	color: black;
}

.main_text {
	font-family: "AppleSDGothicNeoB.ttf";
	font-size: 25px;
}

.message_box {
	margin: 0 auto;
	margin-bottom: 20px;
}

.login_banner {
	margin: 0 auto;
	text-align: center;
}

#loginBtn {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 10px;
	font-size: 16px;
	margin-bottom: 20px;
}

#memberBtn {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 10px;
	font-size: 16px;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="login_banner">
			<p class="main_text">로그인📚</p>
			<p class="message_box">로그인을 통해 더 많은 기능을 이용해보세요!</p>
		</div>
	</div>
	<form id="loginForm">
		<div class="row justify-content-center">
			<input type="text" id="id" name="mem_id" value="${mem_id}" required placeholder="이메일을 입력해주세요.">
		</div>
		<div class="row justify-content-center">
			<input type="password" id="password" name="mem_pw" required placeholder="비밀번호를 입력해주세요.">
		</div>
		<div class="row justify-content-center text-center">
			<div class="col-6 text-end">
				<button type="button" id="loginBtn">로그인</button>
			</div>
			<div class="col-6 text-start">
				<button type="button" id="memberBtn">회원가입</button>
			</div>
		</div>


		<div class="row justify-content-center emailSave">
			<div class="col-lg-2">
				<input type="checkbox" id="emailSave" name="emailSave">이메일 저장하기
			</div>
		</div>

		<p id="token-result"></p>

		<div class="btnBox d-flex justify-content-center">
			<a href="javascript:kakaoLogin()"> <img src="/resources/images/kakao_login_medium_narrow.png"
				alt="카카오 로그인 버튼"
			/>
			</a>
		</div>

		<br>
		<div class="row justify-content-center search">
			<div class="col-lg-3">
				<a class="link" href="#" id="idSearch">이메일 찾기</a> <span>|</span> <a class="link" href="#"
					id="passwordSearch"
				>비밀번호 찾기</a>

			</div>
		</div>

	</form>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<!-- 캐시를 이용하여 이메일 저장하기 checkbox 활용 -->
	<script type="text/javascript">

	    	$('#main-logo').on('click', () => {
	    		location.href = "/home";
	    	})
	    	$('#main-logo').on('click', () => {
	    		location.href = "/home";
	    	})
            $(function () {
                fnInit();
            });

            function fnInit() {
                var cookieid = getCookie("emailSave");
                console.log(cookieid);
                if (cookieid != "") {
                    $("input:checkbox[id='emailSave']").prop("checked", true);
                    $('#id').val(cookieid);
                }

            }

            function setCookie(name, value, expiredays) {
                if (expiredays == 0) {
                    document.cookie = name + "=" + escape(value) + "; path=/; max-age=0;";
                } else {
                    document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
                }
                console.log(document.cookie);
            }
            
            function saveid() {
                var expdate = new Date();
                if ($("#emailSave").is(":checked")) {
                    expdate.setTime(expdate.getTime() + 1);
                    setCookie("emailSave", $("#id").val(), expdate);
                } else {
                    expdate.setTime(expdate.getTime() - 1);
                    setCookie("emailSave", $("#id").val(), 0);
                }
            } 

            function getCookie(Name) {
                var search = Name + "=";
                console.log("search : " + search);

                if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
                    offset = document.cookie.indexOf(search);
                    console.log("offset : " + offset);
                    if (offset != -1) { // 쿠키가 존재하면 
                        offset += search.length;
                        // set index of beginning of value
                        end = document.cookie.indexOf(";", offset);
                        console.log("end : " + end);
                        // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                        if (end == -1)
                            end = document.cookie.length;
                        console.log("end위치  : " + end);

                        return unescape(document.cookie.substring(offset, end));
                    }
                }
                return "";
            }

           
        </script>

	<script>
	
	// 카카오
	window.Kakao.init('1d93d50b4296c95206af1d69936465bf'); // SDK를 초기화 합니다 발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'account_email'
			, success: function(authObj){
				console.log(authObj);
				window.Kakao.API.request({
					url : '/v2/user/me'
					, success : res => {
						const kakao_account = res.kakao_account;
						const mem_id = kakao_account.email;
						
						console.log(kakao_account);
						console.log(mem_id);
						location.href = '/member/kakaoSignUp?mem_id=' + mem_id;
										/*
										$.ajax({
                        				type: "post",
                       					 url: '/member/kakaoLogin', // 로그인
                      					  data: { "mem_id" : mem_id },
                      					  dataType: "text",
                        				success: function (data) {
                            					console.log(data);
                            					if (data === "fail") {// 회원가입
                               					console.log("왔어!");
                               					//location.href = "/member/kakaoSignUp"
                              					 location.href = '/member/kakaoSignUp?mem_id=' + mem_id;
                          					  } else if (data === "success") {
								console.log("success");
								location.href="/"
                           					 }
                        }, error: function (request, status, error) {
                            console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
                        }
                    })*/
                    // ajax끝
                }
				, fail: function (error) {
					alert(error);
				}
            })
        }
    })
};


	// 아이디, 비밀번호 입력후 엔터키 치면~
	$('#id, #password').on('keypress', function(e){ 
	    if(e.keyCode == '13'){ 
	        $('#loginBtn').click(); 
	    }
	});
	
	
	// 회원가입 버튼 누르면 회원가입 페이지로 이동
	
	document.getElementById("memberBtn").onclick = function(){
		location.href = "/member/signup"
	}	
	
	 
	document.getElementById("loginBtn").onclick = function(){
		let login = $("#loginForm").serialize();
		console.log(login);
		if( $('#id').val() == "" || $('#password').val() == "" ){
			alert("아이디 혹은 비밀번호를 입력해주세요.");
		}else if($('#id').val() == "admin" || $('#password').val() == "admin"){
			alert("관리자 페이지로 이동합니다.");
			location.href = "/admin/toAdmin";
		}else{
			// 아이디, 비밀번호 입력 시 ajax실행
			$.ajax({
				url : "/member/loginForm"
				,type : "post"
				,data :login
				, success: function(data){
					console.log(data);
					if(data === "success"){
						alert("로그인 되었습니다.");
						saveid();
						location.href = "/member/toLogin";
					}else if(data === "fail"){
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
						$('#password').val("");
						return;
					}else if(data === "blackMem"){
						alert("블랙회원입니다. 관리자에게 문의해주세요. \n대표번호 : 031-533-8282");
						return;
					}
				}, error : function(e){
					console.log(e);
				}
			})
			
		}
	}
	// 이메일 찾기 버튼 누르면 팝업창 띄우기
    document.getElementById("idSearch").onclick = function () {
        let url = "/member/searchId"; 
        let name = "이메일 찾기"; // 팝업창 이름값
        let option = "width=600, height=400, left=500, top=300"; // 팝업창 크기, 위치
        window.open(url, name, option);
    }
	
	// 비밀번호 찾기 버튼 누르면 팝업창 띄우기
    document.getElementById("passwordSearch").onclick = function () {
        let url = "/member/searchPw"; 
        let name = "비밀번호 찾기"; // 팝업창 이름값
        let option = "width=650, height=420, left=500, top=300"; // 팝업창 크기, 위치
        window.open(url, name, option);
    }

	</script>
</body>
</html>