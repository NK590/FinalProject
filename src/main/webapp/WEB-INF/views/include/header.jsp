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
<style>
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
.banner {
	position: relative;
	height: 15vh;
	background: url("/resources/images/4.jpg") no-repeat center;
	background-size: cover;
	border-top-left-radius: 35px;
	border-top-right-radius: 35px;
}
.logo {
	margin-top: 25px;
	position: relative;
	width: 280px;
	height: 50px;
	z-index: 1;
}
.navbar-toggler {
	border: none;
}
.navbar-nav {
	margin: 0 auto;
	background-color: none;
}

.nav, .dropdown{
	color: black;
	text-decoration-line: none;
	text-decoration: none;
	color: black;
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 15px;
}
.nav:hover {
	color: black;
}

li>a:hover {
	color: rgb(20, 62, 177);
}
.dropdown {
	font-size: 14px;
	color: black;
	text-decoration-line: none;
	margin-left: 10px;
	border: none;
}

.dropdown-menu{
	border: none;
	-webkit-animation: scale-in-ver-top 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: scale-in-ver-top 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}

#underbar {
	position: absolute;
	width: 0;
	background-color: rgb(66, 112, 252);
	top: 30px;
	left: 0;
	height: 4px;
	border-radius: 3px;
	transition: 0.5s;
}

.dropdown-toggle{
color: black;
text-decoration-line: none;

}
.nav-item{
color: black;
text-decoration-line: none;
margin: 1em;
justify-content: center;
vertical-align: top;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<header>
		<!--메인 배너-->
		<div class="container-fluid banner">
			<div class="col" style="text-align: center;">
				<img src="/resources/images/SH_logo2.png" class="logo">
			</div>
		</div>
		<!--메뉴-->
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
					aria-controls="navbarNavDropdown" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				
		<c:choose>
			<c:when test="${not empty loginSession}">				
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<div id="underbar"></div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav" alink="navy"
							aria-current="page" href="/">홈</a></li>
						<li class="nav-item"><a class="nav" href="#">About us</a></li>
						<li class="nav-item"><a class="nav" href="/group/">그룹 스터디</a></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							href="#" id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 공부하기 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="/study/toStudy">공부 시작하기</a></li>
							<!-- 	<li><a class="dropdown" href="/librarymap/librarymap">도서관 위치</a></li> -->
							</ul></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle" href="#" id="navbarDropdownMenuLink"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Study Helper </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="/planner/toPlanner?mem_seq=${loginSession.mem_seq}">플래너</a></li>
								<li><a class="dropdown" href="/study/toRecord">나의 공부시간</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav" href="/board/toBoard">질문 커뮤니티</a></li>
						<li class="nav-item"><a class="nav" href="/inquiry/inquiry">문의하기</a></li>
						<li class="nav-item"><a class="nav" href="/mypage/myPage">마이 페이지</a></li>
						<li class="nav-item"><a class="nav" href="/member/logout" onClick="alert('로그아웃 되었습니다.')">로그아웃</a></li>
					</ul>
				</div>
			</c:when>	
			<c:otherwise>	
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<div id="underbar"></div>
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav" alink="navy"
							aria-current="page" href="/">홈</a></li>
						<li class="nav-item"><a class="nav" href="#">About us</a></li>
						<li class="nav-item"><a class="nav" onclick="loginAlert()">그룹 스터디</a></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							href="#" id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 공부하기 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="/study/toStudy">공부 시작하기</a></li>
								<li><a class="dropdown" href="/librarymap/librarymap">도서관 위치</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle" href="#" id="navbarDropdownMenuLink"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Study Helper </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="#" onclick="loginAlert()">플래너</a></li>
								<li><a class="dropdown" href="#" onclick="loginAlert()">나의 공부시간</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav" href="#" onclick="loginAlert()">지식 커뮤니티</a></li>
						<li class="nav-item"><a class="nav" href="#" onclick="loginAlert()">문의하기</a></li>
						<li class="nav-item"><a class="nav" href="#" onclick="loginAlert()">마이 페이지</a></li>
						<li class="nav-item"><a class="nav" href="/member/login">로그인</a></li>
						<li class="nav-item"><a class="nav" href="/member/signup">회원가입</a></li>
					</ul>
				</div>
				</c:otherwise>
				</c:choose>
			</div>
		</nav>
	</header>
	
	<script>
		function loginAlert(){
			alert("로그인후 이용가능합니다.");
			return;
		}
	
		let underbar = document.getElementById("underbar");
		let homeNav = document.querySelectorAll("li[class='nav-item']");
		function indicator(e){
			underbar.style.left = e.offsetLeft+"px";
			underbar.style.width = e.offsetWidth+"px";
			underbar.style.top = e.offsetTop + e.offsetHeight + "px";
		}
		
		homeNav.forEach((menu)=>
			menu.addEventListener("mouseover",(e)=>indicator(e.currentTarget)));
	
		
	
	</script>
	
</body>
</html>