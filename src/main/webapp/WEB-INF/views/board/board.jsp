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
<title>게시판</title>
</head>
<style>
.container {
	margin-top: 100px;
}

.row:first-child {
	justify-content: end;
	margin-bottom: 20px;
}

.btn-default {
	border: 1px solid #ced4da;
}

.row:first-child .col-2 {
	text-align: start;
}

input:first-child {
	display: inline;
}

.row:last-child {
	justify-content: center;
	margin-top: 20px;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<div class="col-2">
				<input type="text" class="form-control" placeholder="검색어를 입력하세요">
			</div>
			<div class="col-2">
				<button type="button" class="btn btn-default">검색</button>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">title</th>
							<th scope="col">nickname</th>
							<th scope="col">date</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${list.size() == 0}">
							<tr>
								<th colspan="4">등록된 게시물이 없습니다.</th>
							</tr>
						</c:if>
						<c:if test="${list.size() > 0}">
							<c:forEach items="${list}" var="dto">
								<tr>
									<th scope="row">${dto.bo_seq}</th>
									<td><a href="/board/toDetail?bo_seq=${dto.bo_seq}">${dto.bo_title}</a></td>
									<td>${dto.mem_nick }</td>
									<td>${dto.bo_date}</td>
								</tr>
							</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-2">
				<button type="button" class="btn btn-default" id="writeBtn">글쓰기</button>
			</div>
		</div>
	</div>
	<script>
    	$("#writeBtn").on("click", function(){	// 글쓰기로 페이지 이동
    		location.href = "/board/toWrite";
    	})
    </script>
</body>
</html>












