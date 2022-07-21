<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>그룹 목록</title>
<style>
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>그룹방 번호</th>
					<th>그룹 제목</th>
					<th>그룹 내 활동 시간</th>
					<th>그룹 인원</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
				</tr>
			</tbody>
		</table>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		
	
	
	</script>
</body>
</html>