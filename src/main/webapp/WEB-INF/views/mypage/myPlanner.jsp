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
<title>myDropout</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

#bodylist {
	width: 515px;
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
</style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
	<div class="container sidelist">
		<div class="row p-2">
			<!-- 사이드 내비바 -->
			<div class="col-2">
				<div class="sidebar">
					<h2>
						<span>${loginSession.mem_nick}</span><span>님</span>
					</h2>
					<h3>
						<span>안녕하세요.</span>
					</h3>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="/mypage/myPage">나의 그룹</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myBoard">나의 활동내역</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myPlanner">나의 플래너</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myInfo">회원정보 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myDropout">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<!-- content body -->

			<div class="col-10">
				<p>
				<h3>나의 플래너</h3>
				</p>
				<div class="line"></div>
					<div class="col-sm-10 wrap" id="allbody">

						<div class="container d-flex justify-content-center" id="bodylist">
			
						</div>
					</div>

				</div>

			</div>
	</div>
	<script>
	
	
	</script>
	
	<jsp:include page="../include/footer.jsp" />
	
</body>
</html>