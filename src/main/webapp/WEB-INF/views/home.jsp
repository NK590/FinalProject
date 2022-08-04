<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>Study Helper</title>
<style>
/* 드롭다운 열릴때 모션 */
@-webkit-keyframes scale-in-ver-top {
  0% {
    -webkit-transform: scaleY(0);
            transform: scaleY(0);
    -webkit-transform-origin: 100% 0%;
            transform-origin: 100% 0%;
    opacity: 1;
  }
  100% {
    -webkit-transform: scaleY(1);
            transform: scaleY(1);
    -webkit-transform-origin: 100% 0%;
            transform-origin: 100% 0%;
    opacity: 1;
  }
}
@keyframes scale-in-ver-top {
  0% {
    -webkit-transform: scaleY(0);
            transform: scaleY(0);
    -webkit-transform-origin: 100% 0%;
            transform-origin: 100% 0%;
    opacity: 1;
  }
  100% {
    -webkit-transform: scaleY(1);
            transform: scaleY(1);
    -webkit-transform-origin: 100% 0%;
            transform-origin: 100% 0%;
    opacity: 1;
  }
}
/* 네비바 헤더 */
@-webkit-keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
@keyframes tracking-in-expand {
  0% {
    letter-spacing: -0.5em;
    opacity: 0;
  }
  40% {
    opacity: 0.6;
  }
  100% {
    opacity: 1;
  }
}
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
	margin-top: -20px;
	position: relative;
	height: 110vh;
	opacity: 0.85;
	background: url("/resources/images/4.jpg") no-repeat center;
	background-size: cover;
	background: linear-gradient(to bottom, white);
}

.logo {
	margin-top: 320px;
	width: 630px;
	z-index: 1;
}

#toStudy{
	text-decoration: none;
}

/* navbar style */
.navbar-nav {
	align-items: center;
}

.navbar-nav li {
	margin: 0.5em;
}

.dropdown-toggle {
	background-color: none;
	font-family: "GothicA1-Regular.ttf";
	font-size: 17px;
}

.offcanvas {
	width: 300px;
}

#underbar {
	position: absolute;
	width: 0;
	background-color: rgb(66, 112, 252);
	top: 0;
	left: 0;
	height: 4px;
	border-radius: 3px;
	transition: 0.5s;
}

.dropdown {
	font-size: 14px;
}
.dropdown-menu {
	border: none;
	-webkit-animation: scale-in-ver-top 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
	        animation: scale-in-ver-top 0.4s cubic-bezier(0.250, 0.460, 0.450, 0.940) both;
}

.footer>* {
	background-color: none;
	padding: 20px;
}

.ft-ul {
	list-style: none;
	text-align: center;
	height: 100%;
	padding-top: 28px;
	color: black;
	font-size: 12px;
	z-index: 1;
}

.top_text {
	background-color: none;
	position: relative;
	z-index: 100000000000;
	font-size: 25px;
	color: rgb(44, 44, 44);
	text-align: center;
	font-family: "AppleSDGothicNeoL.ttf";
	margin: 10px;
}

.image_left {
	margin-top: 100px;
	float: left;
	text-align: center;
	width: 660px;
	height: 400px;
}

.image_right {
	margin-top: 100px;
	float: right;
	text-align: center;
	width: 600px;
	height: 400px;
}

.main_text {
	text-align: center;
	margin-top: 150px;
	font-size: 25px;
	font-family: "AppleSDGothicNeoL.ttf";
	text-decoration: underline;
}

.sub_text {
	text-align: center;
	margin-top: 30px;
	font-size: 20px;
	font-family: "AppleSDGothicNeoL.ttf";
}

.logo_text {
	margin-top: -20px;
	font-size: 20px;
	font-family: "AppleSDGothicNeoL.ttf";
	color: white;
	text-align: center;
}

.gostudy {
	border: 1.5px solid white;
	width: 135px;
	height: 30px;
	text-decoration: white;
	margin: 0 auto;
	font-family: "AppleSDGothicNeoL.ttf";
	margin-top: -30px;
}

.weekend_user {
	text-align: center;
	font-size: 23px;
	font-weight: bold;
	font-family: "AppleSDGothicNeoL.ttf";
}

.weekend_user_box {
	border-radius: 50%;
}

.weekend_user_box>img {
	width: 80%;
	height: 60%;
}

.topNick {
	font-size: 21px;
}

.topTime {
	font-size: 18px;
	font-weight: bold;
	color: rgb(255, 197, 61);
}

.new_group {
	text-align: center;
	font-size: 23px;
	font-weight: bold;
	font-family: "AppleSDGothicNeoL.ttf";
}

.new_group_box {
	border: 1px solid rgb(112, 112, 112);
	width: 120px;
	height: 120px;
	border-radius: 50%;
	overflow: hidden;
	margin: auto;
}

.new_group_box>img {
	width: 100%;
	height: 100%;
}

.bottom_text {
	margin-top: 50px;
	margin-bottom: 100px;
	text-align: center;
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 30px;
}

.top_icon {
	position: fixed;
	bottom: 5px;
	right: 5px;
}

.fastbtn {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 30px;
	font-size: 17px;
}
</style>
</head>
<header id="header">
	<!--메인 배너-->
	<div class="container-fluid banner">
		<div class="col" style="text-align: center;">
			<img src="/resources/images/SH_logo2.png" class="logo"> <br>
			<br>
			<p class="logo_text">함께 공부하는 즐거움</p>
			<br>
			<div class="gostudy">
				<a id="toStudy" href="/study/toStudy" style="color: white;">공부하러 가기</a>
			</div>
		</div>
	</div>
	<div class="top_icon">
		<a href="#header" style="z-index: 99">맨 위로 이동</a>
	</div>
	<nav class="navbar navbar-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button" id="navbar-toggler"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h3 class="offcanvas-title" id="offcanvasNavbarLabel">Study
						Helper</h3>
					<button type="button" class="btn-close text-reset" id="text-reset"
						data-bs-dismiss="offcanvas" aria-label="Close"></button>
				</div>

				<c:choose>
					<c:when test="${not empty loginSession}">
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">홈</a></li>
						<li class="nav-item"><a class="nav-link" href="#">About
								us</a></li>
						<li class="nav-item"><a class="nav-link" href="/group/">그룹 스터디</a>
						</li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="offcanvasNavbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 공부하기 </a>
							<ul class="dropdown-menu"
								aria-labelledby="offcanvasNavbarDropdown">
								<li><a class="dropdown-item" href="/study/toStudy">공부 시작하기</a></li>
								<li><a class="dropdown-item" id="golibrary" href="/librarymap">도서관 위치</a></li>
							</ul>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#"
							id="offcanvasNavbarDropdown" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> Study Helper
						</a>
							<ul class="dropdown-menu"
								aria-labelledby="offcanvasNavbarDropdown">
								<li><a class="dropdown-item" href="/planner/toPlanner?mem_seq=${loginSession.mem_seq}">플래너</a></li>
								<li><a class="dropdown-item" href="#">공부시간 확인하기</a></li>
							</ul>
						<li class="nav-item"><a class="nav-link" href="/board/toBoard">지식 커뮤니티</a></li>	
						<li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myPage">마이페이지</a></li>
						<li class="nav-item"><a class="nav-link" id="logoutBtn" onClick="alert('로그아웃 되었습니다.')" href="/member/logout">로그아웃</a></li>
					</ul>
				</div>
				</c:when>
					<c:otherwise>
						<div class="offcanvas-body">
							<div id="underbar"></div>
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link active"
									aria-current="page" href="#">홈</a></li>
								<li class="nav-item"><a class="nav-link" href="#">About
										us</a></li>
								<li class="nav-item"><a class="nav-link" href="/group/">그룹
										스터디</a></li>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="offcanvasNavbarDropdown" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> 공부하기 </a>
									<ul class="dropdown-menu"
										aria-labelledby="offcanvasNavbarDropdown">
										<li><a class="dropdown-item" href="/study/toStudy">공부
												시작하기</a></li>
										<li><a class="dropdown-item"
											href="/librarymap/librarymap">도서관 위치</a></li>
									</ul>
								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#"
									id="offcanvasNavbarDropdown" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> Study
										Helper </a>
									<ul class="dropdown-menu"
										aria-labelledby="offcanvasNavbarDropdown">
										<li><a class="dropdown-item" href="#"
											onclick="sessionCheck();">플래너</a></li>
										<li><a class="dropdown-item" href="#"
											onclick="sessionCheck();">공부시간 확인하기</a></li>
									</ul>
								<li class="nav-item"><a class="nav-link" href="#">지식 커뮤니티</a></li>
								<li class="nav-item"><a class="nav-link" href="#">문의하기</a></li>
								<li class="nav-item"><a class="nav-link" href="#"
									onclick="sessionCheck();">마이페이지</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/member/login">로그인</a></li>
								<li class="nav-item"><a class="nav-link"
									href="/member/signup">회원가입</a></li>
							</ul>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</nav>
</header>
<!--메인 영역-->
<body>
	<!--상단 텍스트-->
	<div class="container-fluid top_text" data-aos="fade-up"
		data-aos-offset="200" data-aos-easing="ease-out-cubic"
		data-aos-duration="2000">
		<br> 혹시 그거 아세요?<br>우리의 인내는 우리의 힘보다 더 많은 것을 성취한다는 것을.
	</div>
	<!--메인 랜딩페이지-->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6" data-aos="fade-up" data-aos-offset="250"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<img class="image_left" src="/resources/images/11.jpg">
			</div>
			<div class="col-6" data-aos="fade-up" data-aos-offset="250"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<p class="main_text">
					perfectly planned timer for you <br> 스케줄 관리로 학습의 효율성을 극대화
				</p>
				<p class="sub_text">
					공부는 첫단추는 시간 관리입니다.<br> 오늘 나의 공부 시간은 얼마인지,<br> 어제의 나는 얼마나
					공부했는지,<br> 이번주에 가장 오래 공부했던 날은 언제였는지.<br> 내 컨디션을 체크하고 공부
					패턴도 만들 수 있습니다.<br> 스터디 헬퍼는 통계를 통해 여러분의 공부량을 알려드려요. <br> <br>
					<button class="fastbtn" type="button" id="gotoPlannerBtn">바로가기</button>
				</p>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-6" data-aos="fade-up" data-aos-offset="200"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<p class="main_text">
					study together <br> 우리의 규칙으로 만들어가는 그룹 스터디
				</p>
				<p class="sub_text">
					더이상 고독한 싸움은 그만하세요.<br> 같은 곳을 향해 걷는 나의 길동무들이 있습니다. <br>
					그룹마다 좋은 능률을 위해 규칙을 만들고<br> 자칫 나태해질 수 있는 나의 마음을 잡아보아요.<br>
					또한 내가 알지 못했던 정보를 얻을 수도 있습니다.<br> <br>
					<button class="fastbtn" type="button" id="gotoGroupBtn">바로가기</button>
				</p>
			</div>
			<div class="col-6" data-aos="fade-up" data-aos-offset="250"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<img class="image_left" src="/resources/images/12.jpg">
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-6" data-aos="fade-up" data-aos-offset="250"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<img class="image_left" src="/resources/images/2.jpg">
			</div>
			<div class="col-6" data-aos="fade-up" data-aos-offset="200"
				data-aos-easing="ease-out-cubic" data-aos-duration="2000">
				<p class="main_text">
					What's wrong? <br> 홀릴 듯이 난 너를 자극해 (Pop pop pop)
				</p>
				<p class="sub_text">
					이미 넌 나를 벗어날 수가 없어<br> 떨린 그 눈빛, 티 나는 몸짓 Baby<br> 터뜨리고 싶은 너
					설렘이 멎기 전에<br> I wanna make it<br> Pop pop pop, you want
					it<br> Pop pop pop 터지길 원해<br> <br>
					<button class="fastbtn" type="button" id="gotoStatsBtn">바로가기</button>
				</p>
			</div>
		</div>
		<!--하단 텍스트 및 회원 그룹 랭크-->
		<div class="container-fluid bottom_text" data-aos="fade-up"
			data-aos-offset="200" data-aos-easing="ease-out-cubic"
			data-aos-duration="2000">
			<p>인내가 꿈을 이루는 날까지 스터디 헬퍼는 여러분과 함께합니다.</p>
		</div>
		<br>

		<!-- 일간 Top3 영역 -->
		<div class="row jusitify-content-center" data-aos="fade-up"
			data-aos-offset="200" data-aos-easing="ease-out-cubic"
			data-aos-duration="2000">
			<div class="col-12 col-md-6 weekend_user">
				<div class="row">
					<span>일간 Top 3</span>
				</div>
				<div class="row">
					<div class="col-4 weekend_user_box">
						<img src="/resources/images/goldtrophy.png"><br>
						<c:if test="${todayList.size() == 0}">
							<span class="topNick">-</span>
							<br>
							<span class="topTime">-</span>
						</c:if>
						<c:if test="${todayList.size() >= 1}">
							<span class="topNick">${todayList[0].mem_nick}</span>
							<br>
							<span class="topTime">${todayList[0].time_count}</span>
						</c:if>
					</div>
					<div class="col-4 weekend_user_box">
						<img src="/resources/images/silvertrophy.png"><br>
						<c:if test="${todayList.size() <= 1}">
							<span class="topNick">-</span>
							<br>
							<span class="topTime">-</span>
						</c:if>
						<c:if test="${todayList.size() >= 2}">
							<span class="topNick">${todayList[1].mem_nick}</span>
							<br>
							<span class="topTime">${todayList[1].time_count}</span>
						</c:if>
					</div>
					<div class="col-4 weekend_user_box">
						<img src="/resources/images/bronzetrophy.png"><br>
						<c:if test="${todayList.size() <= 2}">
							<span class="topNick">-</span>
							<br>
							<span class="topTime">-</span>
						</c:if>
						<c:if test="${todayList.size() >= 3}">
							<span class="topNick">${todayList[2].mem_nick}</span>
							<br>
							<span class="topTime">${todayList[2].time_count}</span>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-6 new_group">
				<div class="row justify-content-center">
					<div class="row">
						<span>베스트 그룹 Top 3</span>
					</div>
					<div class="row">
						<div class="col-4 justify-content-center">
							<div class="new_group_box">
								<!-- 그룹 이미지 -->
								<c:if test="${empty groupList[0].group_image}">
									<img src="/resources/images/group5.jpg">
								</c:if>
								<c:if test="${not empty groupList[0].group_image}">
									<img
										src="/resources/group_img/group_img_${groupList[0].group_image}.jpg">
								</c:if>
							</div>
							<c:if test="${groupList.size() == 0}">
								<span class="topNick">-</span>
								<br>
								<span class="topTime">-</span>
							</c:if>
							<c:if test="${groupList.size() >= 1}">
								<span class="topNick">${groupList[0].group_title}</span>
								<br>
								<span class="topTime">${groupList[0].group_count}</span>
							</c:if>
						</div>
						<div class="col-4 justify-content-center">
							<div class="new_group_box">
								<!-- 그룹 이미지 -->
								<c:if test="${empty groupList[1].group_image}">
									<img src="/resources/images/group5.jpg">
								</c:if>
								<c:if test="${not empty groupList[1].group_image}">
									<img
										src="/resources/group_img/group_img_${groupList[1].group_image}.jpg">
								</c:if>
							</div>
							<c:if test="${groupList.size() <= 1}">
								<span class="topNick">-</span>
								<br>
								<span class="topTime">-</span>
							</c:if>
							<c:if test="${groupList.size() >= 2}">
								<span class="topNick">${groupList[1].group_title}</span>
								<br>
								<span class="topTime">${groupList[1].group_count}</span>
							</c:if>
						</div>
						<div class="col-4 justify-content-center">
							<div class="new_group_box">
								<!-- 그룹 이미지 -->
								<c:if test="${empty groupList[2].group_image}">
									<img src="/resources/images/group5.jpg">
								</c:if>
								<c:if test="${not empty groupList[1].group_image}">
									<img
										src="/resources/group_img/group_img_${groupList[2].group_image}.jpg">
								</c:if>
							</div>
							<c:if test="${groupList.size() <= 2}">
								<span class="topNick">-</span>
								<br>
								<span class="topTime">-</span>
							</c:if>
							<c:if test="${groupList.size() >= 3}">
								<span class="topNick">${groupList[2].group_title}</span>
								<br>
								<span class="topTime">${groupList[2].group_count}</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 일간 Top3 끝 -->
	</div>
</body>
<!--풋터 영역-->
<footer>
	<div class="row justify-content-center footer">
		<div class="col-lg-12 col-12">
			<ul class="ft-ul">
				<li>StudyHelper Inc.</li>
				<li>대표 : 스터디헬퍼 사업자등록번호 : 777-77-77777</li>
				<li>대표번호 : +82)-777-7777 팩스번호 : +82)-1234-5678 홈페이지 :
					Studyhelper.com</li>
				<li>CopyrightⓒStudyHelper Inc. All Rights Reserved.</li>
			</ul>
		</div>
	</div>
</footer>
<!-- 스크립트 영역 -->
<script>
	AOS.init(); //스크롤 애니메이션 명령어

	function sessionCheck() {
		let reLogin = confirm('로그인이 필요합니다.' + '\n' + '확인 시 로그인 창으로 이동됩니다.'
				+ '\n' + '취소시 현재 창이 유지됩니다.');
		if (reLogin) {
			location.href = "/member/login";
			return;
		} else {
			return;
		}
	}
	
	
	/* nav script */
	let underbar = document.getElementById("underbar");
    let homeNav = document.querySelectorAll("li[class='nav-item']");
    
    function indicator(e){
    	underbar.style.left = e.offsetLeft+"px";
    	underbar.style.width = e.offsetWidth+"px";
    	underbar.style.top = e.offsetTop + e.offsetHeight + "px";
    };

    homeNav.forEach((menu)=>
        menu.addEventListener("mouseover",(e)=>indicator(e.currentTarget)));
    
    let navbarToggle = document.getElementById("navbar-toggler");
	let navhead = document.querySelector("#offcanvasNavbarLabel");
	let textReset = document.getElementById("text-reset");
    function navheadEvent(){
    	navhead.style.cssText = "-webkit-animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both";
    	navhead.style.cssText = "animation: tracking-in-expand 0.7s cubic-bezier(0.215, 0.610, 0.355, 1.000) both";
    }
    function navheadEventDelete(){
    	navhead.style.cssText = null;
    }
    
    navbarToggle.addEventListener("click",(e)=>navheadEvent())
    textReset.addEventListener("click",(e)=>navheadEventDelete())
       
    // 플래너 이동 버튼 매핑
    document.getElementById('gotoPlannerBtn').addEventListener('click', (e) => {
    	location.href = "/planner/toPlanner?mem_seq=" + "${loginSession.mem_seq}"
    })
    
    // 그룹 이동 버튼 매핑
    document.getElementById('gotoGroupBtn').addEventListener('click', (e) => {
    	location.href = "/group/"
    })
    
    // 통계 이동 버튼 매핑
    document.getElementById('gotoStatsBtn').addEventListener('click', (e) => {
    	if ("${loginSession}" === "") {
    		location.href = "/notLogin"
    	} else {
        	location.href = "/study/toRecord"
    	}
    })
</script>
</html>