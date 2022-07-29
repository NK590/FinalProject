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
<title>myGroup</title>
<style>
body {
	box-sizing: border-box;
	background-color: white;
}



.sidebar {
	margin-top: 100px;
}


</style>
</head>
<body>
	<div class="container sidelist">
		<div class="row p-2">
			<!-- 사이드 내비바 -->
			<div class="col-3">
				<div class="sidebar">
					<h2>
						<span>${loginSession.mem_nick}</span><span>님</span>
					</h2>
					<h3>
						<span>안녕하세요.</span>
					</h3>
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link active"	aria-current="page" href="/mypage/myPage">나의 그룹</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myBoard">나의 커뮤니티</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myInfo">회원정보 수정</a></li>
						<li class="nav-item"><a class="nav-link" href="/mypage/myDropout">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
			<!-- content body -->

			<div class="col-9">
				<p>
				<h3>나의 그룹</h3>
				</p>
				<div class="col-sm-10 wrap" id="allbody">
				
				<div class="row">
							<div class="col-12">
								<table class="table">
									<colgroup>
										<col style="width: 45%">
										<col style="width: 35%">
										<col style="width: 20%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">그룹제목</th>
											<th scope="col">그룹 카테고리</th>
											<th scope="col">현재 인원수</th>
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
												<tr>
													<td>${dto.group_title}</td>
													<td>${dto.group_std_key}</td>
													<td>${dto.group_memCount}</td>
													<td class="d-none groupSeq">${dto.group_seq}</td>
												</tr>
											</c:forEach>
										</c:if>
									</tbody>
								</table>
								
								<div class="row justify-content-center"	style="margin-top: 30px; margin-bottom: 30px;">
					<div class="col-4 d-flex justify-content-end" style="margin-right: 70px;">
						<button type="button" id="goGroupStudy" class="w-btn w-btn-indigo">그룹스터디로 Go!</button>
					</div>
					<div class="col-4 d-flex justify-content-start" style="margin-left: 40px;">
						<button type="button" id="goChatRoom" class="w-btn w-btn-skin" >나의 채팅방으로 Go!</button>
					</div>
				</div>
							</div>
						</div>
				
				</div>

				
			</div>

		</div>
	</div>
	<script>
	// goGroupStudy 버튼 누르면 group->home 페이지로 이동
	document.getElementById("goGroupStudy").onclick = function(){
		location.href = "/group/"
	}
	
	// "goChatRoom" 버튼 누르면 내가 들어가있는 채팅 페이지로 이동
	
	document.getElementById("goChatRoom").onclick = function(){
		
		location.href = "/group/room?group_seq="+$(".groupSeq").html();	
				
	}
	</script>
</body>
</html>