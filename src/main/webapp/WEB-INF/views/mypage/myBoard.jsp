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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>나의 활동내역</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}

#bodylist {
	width: 100%;
	padding: 30px;
	background-color: white;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}


.line {
	border-bottom: 1px solid black;
}

#allbody {
	width: 100%;
	height: 650px;
	position: relative;
}
.tr:hover {
	background-color: aliceblue;
	}
.navItem {
	font-size: 20px;
	margin: 8px;
	text-decoration-line: none;
	color: black;
}

#txtSt {
	color: black;
	font-size: 20px;
	text-decoration-line: none;
	color: black;
	font-family: "AppleSDGothicNeoL.ttf";
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
.nav-link{
	font-size: 20px;
}
.nickDeco{
font-family: "AppleSDGothicNeoB.ttf";
font-size: 30px;

}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		  <div class="row justify-content-center">
			<!-- 사이드 내비바 -->
			<div class="col-3 menubar">
					<p class="nickDeco">
						<span>${loginSession.mem_nick}</span><span> 님,</span>
		<br>
						<span>오늘도 화이팅!💪🏻</span>
						<br>
						<br>
					</p>
					<ul class="nav flex-column">
						<li class="nav-item navItem"><a class="nav-link active" id="txtSt" aria-current="page"
							href="/mypage/myPage"
						>나의 그룹👨‍👩‍👧‍👦</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myBoard">나의 활동내역✍🏻</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myInfo">회원정보 수정✏️</a></li>
						<li class="nav-item navItem"><a class="nav-link" id="txtSt" href="/mypage/myDropout">회원탈퇴👋</a></li>
					</ul>
				</div>
			<!-- content body -->

			<div class="col-9">
				<p>
				<h3>나의 활동내역</h3>
				</p>
				<div class="line"></div>
				<div class="col-sm-10 wrap" id="allbody">
						
						<div class="row">
							<div class="col-12">
								<table class="table">
									<colgroup>
										<col style="width: 10%">
										<col style="width: 40%">
										<col style="width: 25%">
										<col style="width: 15%">
										<col style="width: 10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:if test="${list.size() == 0}">
											<tr>
												<th colspan="5" class="textNo">조회된 게시물이 없습니다.</th>												
											</tr>
										</c:if>
										<c:if test="${list.size() > 0}">
											<c:forEach items="${list}" var="dto">
												<tr class="tr" onclick="location.href='/board/toDetail?bo_seq=${dto.bo_seq}'">
													<th scope="row">${dto.bo_seq}</th>
													<td><a href="/board/toDetail?bo_seq=${dto.bo_seq}">${dto.bo_title}</a></td>
													<td>${dto.mem_nick }</td>
													<td>${dto.bo_date}</td>
													<td>${dto.view_count}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
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