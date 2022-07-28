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
						<li class="nav-item"><a class="nav" href="#">관리자 홈</a></li>
						<li class="nav-item"><a class="nav" href="/admin/toBlacklist?curPage=1">신고 목록 관리</a></li>
						<li class="nav-item"><a class="nav" href="/admin/toBlackManage?curPage=1">차단 유저 관리</a></li>
						<li class="nav-item"><a class="nav" href="/admin/toGrouplist?curPage=1">그룹 관리</a></li>
						<li class="nav-item"><a class="nav" href="/admin/toNotice">공지사항 목록</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>