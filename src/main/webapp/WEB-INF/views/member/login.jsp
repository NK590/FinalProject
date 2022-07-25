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
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>login</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

.login {
	width: 200px;
	font-size: 35px;
	font-family: "MinSans-bold.otf";
	color: rgb(68, 129, 71);
	margin-top: 70px;
	text-align: center;
	margin: 0 auto;
}

.logininput {
	margin: 0 auto;
	width: 330px;
	padding: 20px;
	padding-bottom: 10px;
}

#loginBtn {
	width: 120px;
	margin: 0 auto;
	margin-left: 85px;
	background-color: #1e8ae9;
	border: 1px solid white;
	height: 40px;
	border-radius: 40px;
	font-size: 15px;
	color: white;
	font-weight: bold;
}

#memberBtn {
	width: 120px;
	margin: 0 auto;
	margin-right: 85px;
	background-color: rgba(84, 89, 224, 0.741);
	border: 1px solid rgb(255, 255, 255);
	height: 40px;
	border-radius: 40px;
	font-size: 15px;
	color: white;
	font-weight: bold;
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
}

#passwordSearch {
	text-decoration-line: none;
}

#id {
	border-radius: 10px;
}

#password {
	border-radius: 10px;
}

.nothing {
	margin-top: 10px;
}

span {
	color: #0d6efd;
}
</style>
</head>
<body>
<form id="loginForm">
	<div class="row m-3">
		<div class="col d-flex justify-content-center">
			<h2>로그인</h2>
		</div>
	</div>

	<div class="row justify-content-around logininput">
		<input type="text" id="id" name="mem_id" required placeholder="이메일을 입력해주세요.">
			<div class="nothing"></div>
		<input type="password" id="password" name="mem_pw" required placeholder="비밀번호를 입력해주세요.">
	</div>
	
	<div class="row justify-content-center emailSave">
		<div class="col-lg-3">
			<input type="checkbox" id="emailSave" name="emailSave">이메일	저장하기
		</div>
	</div>

	<div class="row justify-content-center text-center">
		<div class="col-6 text-end">
			<button type="button" id="loginBtn">로그인</button>
		</div>
		<div class="col-6 text-start">
			<button type="button" id="memberBtn">회원가입</button>
		</div>
	</div>
	<!-- 
	<div class="row justify-content-around logininput">
		<a href="https://kauth.kakao.com//oauth/logout?client_id=1d93d50b4296c95206af1d69936465bf&logout_redirect_uri=http://localhost/member/login">로그아웃</a>
		<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=a988e7d46e170a65e7bfc2447c3f1d09&redirect_uri=http://localhost/member/kakaoLogin&response_type=code">
						<img src="/resources/images/kakao_login_medium_narrow.png" style="width: 260px; height:50px;">
		</a>
	</div>
	 -->
	 <button class="api-btn" onclick="kakaoLogout()">로그아웃</button>

<p id="token-result"></p>

	 <div class="btnBox d-flex justify-content-center">
			<a href="javascript:kakaoLogin()"> 
				<img src="/resources/images/kakao_login_medium_narrow.png" alt="카카오 로그인 버튼" />
			</a>
	</div>
	
	<br>
	<div class="row justify-content-center search">
		<div class="col-lg-3">
			<a class="link" href="#" id="idSearch">이메일 찾기</a> 
				<span>/</span> 
			<a class="link" href="#" id="passwordSearch">비밀번호 찾기</a>
		</div>
	</div>
</form>
	 
	<script>	
	function kakaoLogout() {
	    if (!Kakao.Auth.getAccessToken()) {
	      alert('Not logged in.')
	      return
	    }
	    Kakao.Auth.logout(function() {
	      alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken())
	      location.href="/member/logout"
	    })
	  }
	/* 성민 카카오
	
	// 카카오로그인 버튼 눌렀을때 무조건 카카오 로그인창 띄워주기 
	function kakaoLogin(){
		Kakao.init('1d93d50b4296c95206af1d69936465bf'); // 본인의 자바스크립트 키로 카카오 기능 활성화
		console.log(Kakao.isInitialized());
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
		Kakao.Auth.login({ // 로그인하면서 인증정보 얻어오는 코드
			scope: 'account_email',
			success:function(auth){
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response){ // response의 kakao_account 안에 로그인된 사용자 정보값이 담겨있음
						console.log(response);
						// 사용자 정보를 가져와서 폼에 추가.
						var account = response.kakao_account;
						console.log(account);
						// -> 여기서부터는 얻어온 값을 이용해 서버랑 통신하며 카카오 로그인 진행
						
					},
					error: function(error){
						console.log(error);
					}
				}); // api request
			}, // success 결과.
			error:function(error){
				console.log(error);
			}
		})
	}
	
		
	
	 //카카오 로그인
	Kakao.init('1d93d50b4296c95206af1d69936465bf');
Kakao.isInitialized();
  function loginWithKakao() {
    Kakao.Auth.authorize({
      redirectUri: 'http://localhost/member/login'
    })
  }
  // 아래는 데모를 위한 UI 코드입니다.
  displayToken()
  function displayToken() {
    const token = getCookie('authorize-access-token')
    if(token) {
      Kakao.Auth.setAccessToken(token)
      Kakao.Auth.getStatusInfo(({ status }) => {
        if(status === 'connected') {
          document.getElementById('token-result').innerText = 'login success. token: ' + Kakao.Auth.getAccessToken()

        } else {
          Kakao.Auth.setAccessToken(null)
        }
      })
    }
  }
  function getCookie(name) {
    const value = "; " + document.cookie;
    const parts = value.split("; " + name + "=");
    if (parts.length === 2) return parts.pop().split(";").shift();
  }
 */
	
	// 예지 카카오
	window.Kakao.init('1d93d50b4296c95206af1d69936465bf'); // 발급받은 키 중 javascript키를 사용해준다.
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
					const email = kakao_account.email;
					
					console.log(kakao_account);
					console.log(email);
					
					$.ajax({
                        				type: "post",
                       					 url: '/member/kakaoLogin', // 로그인
                      					  data: { "email" : email },
                      					  dataType: "text",
                        				success: function (data) {
                            					console.log(data);
                            					if (data === "fail") {// 회원가입
                               					console.log("성공!");
                              					 location.href = '/member/toKakaoSignUp?email=' + email;
                          					  } else if (data === "success") {
								console.log("success");
								location.href="/member/login"
                           					 }
                        }, error: function (request, status, error) {
                            console.log("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
                        }
                    })
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
		} else{
			// 아이디, 비밀번호 입력 시 ajax실행
			$.ajax({
				url : "/member/loginForm"
				,type : "post"
				,data :login
				, success: function(data){
					console.log(data);
					if(data == "success"){
						location.href = "/member/toLogin";
					}else if(data == "fail"){
						
						alert("아이디 혹은 비밀번호가 일치하지 않습니다.");
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

	</script>
</body>
</html>