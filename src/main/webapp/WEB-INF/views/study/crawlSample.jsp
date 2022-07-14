<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크롤링 테스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	body {
		box-sizing : border-box;
	}
	.crawl-container {
		width : 400px;
		height : 600px;
	}
	.crawl-display {
		width : 400px;
		height : 500px;
		border : 1px solid black;
	}
</style>
</head>
<body>
	<div class="crawl-container">
		<div class="crawl-display">
			<!-- 여기에 검색결과 뜰 예정 -->
		</div>
		<div class="crawl-input">
			<select id="languageSelect">
				<option value="en">영어</option>
				<option value="jp">일본어</option>
				<option value="cn">중국어</option>
			</select>
			<input type="text" name="queryInput" id="queryInput">
			<button type="button" id="queryBtn">검색</button>
		</div>
	</div>
	<script>
		// 사전 검색 ajax 요청
		$('#queryBtn').on('click', (e) => {
			let queryInput = $('#queryInput').val()
			let languageInput = $('#languageSelect').val()
			
			if (queryInput !== '') {
				$.ajax({
					url : '/study/dicSearch',
					type : 'get',
		            contentType: 'application/json; charset=utf-8',
					data : { queryInput : queryInput, languageInput : languageInput },
					success : (response) => {
						$('.crawl-display').empty()
						
						let queryInputTag = $('<p>').append(queryInput)
						$('.crawl-display').append(queryInputTag)
						
						if (response.length === 0) {
							$('.crawl-display').append($('<p>').append("결과가 없습니다."))
						} else {
							response.forEach((elem, index) => {
								let resultTag = $('<p>').append(elem)
								$('.crawl-display').append(resultTag)
							})
						}
					},
					error : (error) => {
						console.log(error)
					}
				})
			} else {
				alert("찾을 단어를 입력해주십시오.")
			}
		})
	</script>
</body>
</html>