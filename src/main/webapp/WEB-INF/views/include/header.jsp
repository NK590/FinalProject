<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
a {
	text-decoration: none;
	padding: 20px;
	color: black;
	margin-top: -20px;
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 15px;
}
a:hover {
	color: rgb(20, 62, 177);
}
.dropdown {
	font-size: 14px;
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
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav" alink="navy"
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item"><a class="nav" href="#">About us</a></li>
						<li class="nav-item"><a class="nav"
							style="margin-right: -20px" href="#">그룹 스터디</a></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							href="#" id="navbarDropdownMenuLink" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 공부하기 </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="#">공부 시작하기</a></li>
								<li><a class="dropdown" href="#">도서관 위치</a></li>
							</ul></li>
						<li class="nav-item dropdown"><a class="dropdown-toggle"
							style="margin-left: -20px" href="#" id="navbarDropdownMenuLink"
							role="button" data-bs-toggle="dropdown" aria-expanded="false">
								Study Helper </a>
							<ul class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<li><a class="dropdown" href="#">플래너</a></li>
								<li><a class="dropdown" href="#">나의 공부시간</a></li>
							</ul></li>
						<li class="nav-item"><a class="nav" href="#">지식 커뮤니티</a></li>
						<li class="nav-item"><a class="nav" href="#">문의하기</a></li>
						<li class="nav-item"><a class="nav" href="#">마이 페이지</a></li>
						<li class="nav-item"><a class="nav" href="#">로그인</a></li>
						<li class="nav-item"><a class="nav" href="#">회원가입</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>