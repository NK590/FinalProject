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
<title>스터디 그룹 목록</title>
<style>
.fastDelete {
	background-color: rgb(255, 59, 59);
	color: white;
	border: 3px solid rgb(255, 59, 59);
	border-radius: 30px;
}

.empty {
	margin-top: 30px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<div class="container">
		<table class="table">
			<thead>
				<tr>
					<th>그룹방 번호</th>
					<th>그룹 제목</th>
					<th>이번주 활동 시간</th>
					<th>그룹 인원</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.size() == 0}">
						<tr>
							<td colspan="5">등록된 그룹방이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>${dto.group_seq}</td>
								<td>${dto.group_title}</td>
								<td>${dto.group_count}분</td>
								<td>${dto.group_memCount}명</td>
								<td><button type="button" class="groupDelete fastDelete"
										value="${dto.group_seq}">삭제</button></td>
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
						href="/admin/toGrouplist?curPage=${naviMap.startNavi-1}"><span
							aria-hidden="true">&laquo;</span> </a></li>
				</c:if>
				<c:forEach var="pageNum" begin="${naviMap.startNavi}"
					end="${naviMap.endNavi}" step="1">
					<li class="page-item"><a class="page-link"
						href="/admin/toGrouplist?curPage=${pageNum}">${pageNum}</a></li>
				</c:forEach>
				<c:if test="${naviMap.needNext eq true}">
					<li class="page-item"><a class="page-link"
						href="/admin/toGrouplist?curPage=${naviMap.endNavi+1}"><span
							aria-hidden="true">&raquo;</span> </a></li>
				</c:if>
			</ul>
		</nav>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$(".groupDelete").on("click", function() {
			let answer = confirm("정말 삭제하시겠습니까?");
			if(answer){
				location.href = "/admin/deleteGroup?group_seq=" + this.value;
			} else {
				return;
			}
		})
	</script>
</body>
</html>