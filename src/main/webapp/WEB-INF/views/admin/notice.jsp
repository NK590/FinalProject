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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- bootstrapwatch -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css"
	integrity="sha384-5QFXyVb+lrCzdN228VS3HmzpiE7ZVwLQtkt+0d9W43LQMzz4HBnnqvVxKg6O+04d"
	crossorigin="anonymous">
<title>공지사항</title>
</head>
<style>
.container {
	margin-top: 100px;
}

.btn-default {
	border: 1px solid #ced4da;
}

.td {
	display: none;
}

a {
	text-decoration: none;
	color: black;
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
}

.writeBtn {
	text-align: center;
	margin-top: 0%;
}

.textNo {
	text-align: center;
	border-bottom: 0ch;
}

thead, tbody {
	text-align: center;
}
</style>
<body>
<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-12 head-text">
				<h2>공지사항</h2>
			</div>
		</div>
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
								<th colspan="5" class="textNo">등록된 게시물이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${list.size() > 0}">
							<c:forEach items="${list}" var="dto">
								<tr class="tr">
									<th scope="row">${dto.notice_seq}</th>
									<td><a href="/admin/toNoticeDetail?notice_seq=${dto.notice_seq}">${dto.notice_title}</a></td>
									<td>관리자</td>
									<td>${dto.notice_date}</td>
									<td>${dto.view_count}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row writeBtn">
			<div class="col-12">
				<button type="button" class="btn btn-warning" id="writeBtn">글쓰기</button>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	<script>
		$("#writeBtn").click(function(){
			location.href="/admin/noticeWrite";
		})
	</script>
</body>
</html>