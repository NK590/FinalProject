<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 신고</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="container">
	<form action="/report/send" method="post" id="reportForm">
		<div class="row">
			<p>신고할 닉네임</p>
			<input type="text" class="form-control" id="reportId">
			<p>신고 내용</p>
			<input type="text" class="form-control" id="reportContent">
			<button type="button" class="btn btn-primary" id="reportSubmitBtn">제출</button>
		</div>
	</form>
</div>
<script>

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>