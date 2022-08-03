<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<style>
#errorerror{
	text-align: center;
	margin-top:50px;
}
</style>
<body>

	<div class="container" id="errorerror">
	<div>
	<h2>요청하신 페이지를 찾을 수 없습니다.</h2>
	</div>
	
	<div>
	<h3>관리자에게 문의하거나 페이지 주소를 올바르게 입력해주세요.</h3>
	</div>
	
	<div>
	<img src="/resources/images/errorerror.jpg" class="errorImg">
	</div>
	
	<button type="button" id="gotoHome">홈으로</button>
	</div>


	<script>
	document.getElementById("gotoHome").onclick = function(){
		location.href = "/"
	}
	</script>
</body>
</html>