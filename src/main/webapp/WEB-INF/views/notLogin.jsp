<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 세션 에러</title>
</head>
<body>
	<script>
		alert('로그인 세션이 존재하지 않습니다. 로그인 해주십시오.')
		location.href = "/member/login"
	</script>
</body>
</html>