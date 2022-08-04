<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrapwatch -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css"
	integrity="sha384-5QFXyVb+lrCzdN228VS3HmzpiE7ZVwLQtkt+0d9W43LQMzz4HBnnqvVxKg6O+04d"
	crossorigin="anonymous">
	<!-- bootstrap icon -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>게시판</title>
</head>
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
.boardContainer {
	margin-top: 50px;
	font-family: "AppleSDGothicNeoL.ttf";
}

.btn-default {
	border: 1px solid #ced4da;
}

input:first-child {
	display: inline;
}

.td {
	display: none;
}

.head-text {
	border-bottom: 1px solid #ced4da;
	
}

.row>* {
	padding: 0%;
}

h2 {
	font-weight: bolder;
	margin-bottom: 20px;
	padding-left : 12px;
}

.writeBtn {
	text-align: center;
	margin-top: 0%;
}

.pagination {
	justify-content: center;
}

.textNo {
	text-align: center;
	border-bottom: 0ch;
}

thead, tbody {
	text-align: center;
}

.searchInput {
	margin-top: 40px;
	justify-content: end;
}
.boardCol{
margin-bottom : 30px;
}

 .aTag {
	text-decoration: none;
	color: black;
}
.noticeTr{
	background-color : #f2f5f9;
}
/* 푸터 */
.footer>* {
	background-color: none;
	padding: 20px;
	position: relative;
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
/* 헤더 */
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

.nav{
color: black;
text-decoration-line: none;
}
li>a:hover {
	color: rgb(20, 62, 177);
}
.dropdown {
	font-size: 14px;
	color: black;
	text-decoration-line: none;
}
.dropdown-menu{
color: black;
}

.dropdown-toggle{
color: black;
text-decoration-line: none;

}
.nav-item{
color: black;
text-decoration-line: none;

}
</style>
<body>

	<jsp:include page="../include/header.jsp" />
<!-- 게시판 -->
	<div class="container boardContainer">
		<div class="row">
			<div class="col-12 head-text">
				<h2>질문 게시판</h2> 
			</div>
		</div>
		<form id="searchForm">
			<div class="row searchInput">
				<div class="col-2 mb-3 searchInput1">
					<div class="form-group">
						<select class="form-select" id="exampleSelect1" name="category">
							<option selected value="all">전체</option>
							<option value="mem_nick">닉네임</option>
							<option value="bo_title">제목</option>
							<option value="bo_content">내용</option>
						</select>
					</div>
				</div>
				<div class="col-3 mb-3 searchInput1">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="검색어를 입력하세요"
							id="keyword" aria-describedby="button-addon2" name="keyword">
						<button class="btn btn-dark" type="button" id="searchBtn">검색</button>
					</div>
				</div>
			</div>

		</form>
		<div class="row">
			<div class="col-12 boardCol">
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
						<%-- 공지사항 --%>
						<c:if test="${noticeList.size() > 0}">
							<c:forEach items="${noticeList}" var="nDto">
								<tr class="noticeTr">
									<th scope="row"><i class="bi bi-megaphone-fill"></i>&nbsp공지</th>		
									<td><a href="/admin//toNoticeDetail?notice_seq=${nDto.notice_seq}" class="aTag">${nDto.notice_title}</a></td>
									<td>관리자</td>
									<td>${nDto.notice_date}</td>
									<td>${nDto.view_count}</td>
									<td class="td">${nDto.notice_content}</td>
								</tr>
							</c:forEach>
						</c:if>
						<%-- 게시글 목록 --%>
						<c:if test="${list.size() == 0}">
							<tr>
								<th colspan="5" class="textNo">등록된 게시물이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${list.size() > 0}">
							<c:forEach items="${list}" var="dto">
								<tr class="tr">
									<th scope="row">${dto.bo_seq}</th>
									<td><a href="/board/toDetail?bo_seq=${dto.bo_seq}" class="aTag">${dto.bo_title}</a></td>
									<td>${dto.mem_nick }</td>
									<td>${dto.bo_date}</td>
									<td>${dto.view_count}</td>
									<td class="td">${dto.bo_content}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row navi">
			<div class="col-12 colNavi">
				<ul class="pagination justify-content-center">
					<c:if test="${naviMap.needPrev eq true }">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${naviMap.startNavi-1}" class="aTag"><</a></li>
					</c:if>

					<c:forEach var="pageNum" begin="${naviMap.startNavi}"
						end="${naviMap.endNavi}" step="1">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${pageNum}"class="aTag"">${pageNum}</a></li>
					</c:forEach>

					<c:if test="${naviMap.needNext eq true }">
						<li class="page-item"><a class="page-link"
							href="/board/toBoard?curPage=${naviMap.endNavi+1}"class="aTag">></a></li>
					</c:if>
				</ul>

			</div>
		</div>
		<div class="row writeBtn">
			<div class="col-12">
				<button type="button" class="btn btn-warning" id="writeBtn">질문하기</button>
			</div>
		</div>
		<!-- 푸터 -->
		<jsp:include page="../include/footer.jsp" />
	<script>
		$("#writeBtn").on("click", function() { // 글쓰기로 페이지 이동
			location.href = "/board/toWrite";
		})
		$("#searchBtn").on("click", function() { // 검색
			if($("#keyword").val()==""){
				alert("검색어를 입력하세요");
				}else{
			let data = $("#searchForm").serialize();
			console.log(data);
			$.ajax({
				url : "/board/search?curPage=1",
				type : "get",
				data : data,
				success : function(data) {
					console.log(data)
					 $("tbody").empty();
					if(data.length == 0){ // 검색 결과가 없을때 
						let tr = $("<tr>");
						let td = $("<td colspan=5>").append("등록된 게시물이 없습니다.").addClass("textNo");
						tr.append(td);
						tr.appendTo("tbody");
						// 네비바
						 $(".colNavi").empty();
						 liOne.append(one);
							ul.append(liOne);
							$(".colNavi").append(ul);
					} else{	 // 검색결과가 있을때
						for(dto of data){
						let tr = $("<tr>").addClass("tr");
						let th = $("<th>").append(dto.bo_seq).attr("scope","row");
						let a = $("<a>").append(dto.bo_title).attr("href","/board/toDetail?bo_seq="+dto.bo_seq);
						let td1 = $("<td>").append(a);
						let td3 = $("<td>").append(dto.bo_date);
						let td2 = $("<td>").append(dto.mem_nick);
						let td4 = $("<td>").append(dto.view_count);
						let td5 = $("<td>").append(dto.bo_content).addClass("td");
						tr.append(th,td1,td2,td3,td4,td5);
						tr.appendTo("tbody");			
						}
						/* navi */
						let ul = $("<ul>").addClass("pagination justify-content-center")
						let liPre = $("<li>").addClass("page-item");
						let a1 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${naviMap.startNavi-1}").html("<");
						
						let liNum = $("<li>").addClass("page-item");
						let a2 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${pageNum}").val("${pageNum}");
						
						let liOne = $("<li>").addClass("page-item");
						let one = $("<a>").addClass("page-link aTag").attr("href","/board/toBoard?curPage=1").val("목록");
						
						let liNext = $("<li>").addClass("page-item");
						let a3 = $("<a>").addClass("page-link").attr("href","/board/toBoard?curPage=${naviMap.startNavi+1}").html(">");
						
						// 네비바 비동기로 만들어 주기
						 $(".colNavi").empty();
						if(data.length <= 10){// 게시글이 10개 이하 일때
/* 							liOne.append(one);
							ul.append(liOne);
							$(".colNavi").append(ul); */
						} else{ // 게시글이 10개 이상일때
							/*  $(".colNavi").empty();
							 liOne.append(one);
								ul.append(liOne);
								$(".colNavi").append(ul); */
						} 
						
/*
						<div class="row navi">
						<div class="col-12 colNavi">
							<ul class="pagination justify-content-center">
								<c:if test="${naviMap.needPrev eq true }">
									<li class="page-item"><a class="page-link"
										href="/board/toBoard?curPage=${naviMap.startNavi-1}" id="aTag"><</a></li>
								</c:if>

								<c:forEach var="pageNum" begin="${naviMap.startNavi}"
									end="${naviMap.endNavi}" step="1">
									<li class="page-item"><a class="page-link"
										href="/board/toBoard?curPage=${pageNum}"id="aTag">${pageNum}</a></li>
								</c:forEach>

								<c:if test="${naviMap.needNext eq true }">
									<li class="page-item"><a class="page-link"
										href="/board/toBoard?curPage=${naviMap.endNavi+1}"id="aTag">></a></li>
								</c:if>
							</ul>

						</div>
					</div>
						*/
					}  
				},
				error : function(e) {
					console.log(e);
				}
			})
				}
		})
	</script>
</body>
</html>












