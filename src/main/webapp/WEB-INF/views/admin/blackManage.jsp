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
<title>관리자 블랙리스트 관리</title>
<style>
.fastbtn {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 30px;
}
.empty {
	margin : 30px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>카테고리</th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>차단 해제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty blacklist}">
						<tr>
							<td colspan="4">차단된 유저가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${blacklist}" var="list">
							<tr>
								<td>${list.mem_std_key}</td>
								<td>${list.mem_id}</td>
								<td>${list.mem_nick}</td>
								<td><button type="button" class="fastbtn unblocking"
										value="${list.mem_seq}">차단 해제</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="empty"></div>
		<nav>
			<ul class="pagination justify-content-center" id="pagingUl">
				<c:if test="${naviMap.needPrev eq true}">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlackManage?curPage=${naviMap.startNavi-1}"><span
							aria-hidden="true">&laquo;</span> </a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${naviMap.startNavi}"
					end="${naviMap.endNavi}" step="1">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlackManage?curPage=${pageNum}">${pageNum}</a></li>
				</c:forEach>
				<c:if test="${naviMap.needNext eq true}">
					<li class="page-item"><a class="page-link"
						href="/admin/toBlackManage?curPage=${naviMap.endNavi+1}"><span
							aria-hidden="true">&raquo;</span> </a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$(".unblocking").on("click", function(){
			let mem_seq = this.value;
			let answer = confirm("차단을 해제하시겠습니까?");
			if(answer) {
				location.href = "/admin/unblocking?mem_seq="+mem_seq;
				return;
			} else {
				return;
			}
			console.log(mem_seq);
		})
		
	</script>
</body>
</html>