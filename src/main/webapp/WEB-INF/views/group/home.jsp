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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>그룹 리스트</title>
<style>
    #createGroupBtn {
        margin: 20px;
        width: 60%;
        height: 60%;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="container">
    <div class="row">
        <c:if test="${not empty loginSession}">
        <div class="col-10">
            <div class="row text-center">
                <h3>그룹 검색</h3>
            </div>
            <div class="row">
                <div class="col-3">
                    <select class="form-select" id="searchCategoryInput">
                        <option selected value="">그룹 선택</option>
                        <option value="초등학생">초등학생</option>
                        <option value="중학생">중학생</option>
                        <option value="고등학생">고등학생</option>
                        <option value="수능/N수">수능/N수</option>
                        <option value="자격증">자격증</option>
                        <option value="취준생">취준생</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="col-9">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="그룹명 입력" id="searchGroupInput">
                        <button class="btn btn-outline-secondary" type="button" id="searchGroupBtn">검색</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-2">
        		<button class="btn btn-primary" id="createGroupBtn" data-bs-toggle="modal" data-bs-target="#makeGroupModal">그룹 생성</button>
        </div>
        </c:if>
        <c:if test="${empty loginSession}">
        	<div class="row text-center">
                <h3>그룹 검색</h3>
            </div>
            <div class="row">
                <div class="col-3">
                    <select class="form-select" id="searchCategoryInput">
                        <option selected value="">그룹 선택</option>
                        <option value="초등학생">초등학생</option>
                        <option value="중학생">중학생</option>
                        <option value="고등학생">고등학생</option>
                        <option value="수능/N수">수능/N수</option>
                        <option value="자격증">자격증</option>
                        <option value="취준생">취준생</option>
                        <option value="기타">기타</option>
                    </select>
                </div>
                <div class="col-9">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="그룹명 입력" id="searchGroupInput">
                        <button class="btn btn-outline-secondary" type="button" id="searchGroupBtn">검색</button>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
	<!-- <div class="row text-center">
		<h3>그룹 TOP3</h3>
	</div>
	<div class="row">
		<div class="col-4">
            결과
        </div>
		<div class="col-4">
            결과
        </div>
		<div class="col-4">
            결과
        </div>
	</div> -->
	<div class="row text-center">
		<h3>그룹 리스트</h3>
	</div>
	<div id="groupListView">
		<c:choose>
			<c:when test="${empty groupList}">
				<div class="row text-center">
					<h2>생성된 그룹이 없습니다.</h2>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${groupList}" var="group">
					<div class="row text-center">
						<a href="/group/room?group_seq=${group.group_seq}">${group.group_title}</a>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- 이하 그룹 생성 모달 -->
	<form action="/group/makeRoom" method='post' id='makeGroupForm'>
		<div class="modal fade" id="makeGroupModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
			    <div class="modal-content">
		      		<div class="modal-header">
			        	<h5 class="modal-title">그룹 생성</h5>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      	</div>
			      	<div class="modal-body">
			      		<div class="row">
			      			<span>카테고리</span>
		                    <select class="form-select" id="categoryInput" name="categoryInput">
		                        <option selected value="">그룹 선택</option>
		                        <option value="초등학생">초등학생</option>
		                        <option value="중학생">중학생</option>
		                        <option value="고등학생">고등학생</option>
		                        <option value="수능/N수">수능/N수</option>
		                        <option value="자격증">자격증</option>
		                        <option value="취준생">취준생</option>
		                        <option value="기타">기타</option>
		                    </select>
			      		</div>
			      		<div class="row">
			      			<span>방 이름</span>
			      			<input type='text' class='form-control' id='roomNameInput' name='roomNameInput'>
			      		</div>
			      		<div class="row">
			      			<span>방장의 한마디</span>
			      			<input type='text' class='form-control' id='roomContentInput' name='roomContentInput'>
			      		</div>
			      		<div class="row">
			      			<span>방 인원수</span>
		                    <select class="form-select" id='memberNumberInput' name='memberNumberInput'>
		                        <option selected value="0">인원수 선택</option>
		                        <option value="2">2</option>
		                        <option value="3">3</option>
		                        <option value="4">4</option>
		                        <option value="5">5</option>
		                    </select>
			      		</div>
			      	</div>
			      	<div class="modal-footer">
			        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        	<button type="button" class="btn btn-primary" id="makeGroupBtn">그룹 생성</button>
			      	</div>
			    </div>
		    </div>
		</div>
	</form>
	<!-- 이상 그룹 생성 모달 -->
</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<!-- 이하 script -->
<script>
	
	// 그룹 생성 처리
	$('#makeGroupBtn').on('click', (e) => {
		let makeGroupConfirm = confirm('그룹을 만드시겠습니까?')
		if (makeGroupConfirm) {
			let categoryInput = $('#categoryInput').val()
			let roomNameInput = $('#roomNameInput').val()
			let roomContentInput = $('#roomContentInput').val()
			let memberNumberInput = $('#memberNumberInput').val()
			
			if (categoryInput === '') {
				alert('카테고리를 입력해주세요.')
			} else if (roomNameInput === '') {
				alert('방 이름을 입력해주세요.')
			} else if (roomContentInput === '') {
				alert('방장의 한마디를 입력해주세요.')
			} else if (memberNumberInput === '0') {
				alert('그룹 인원수를 설정해주세요.')
			} else {
				$.ajax({
					url : "/group/checkJoinStatus",
					type : "get",
					success : (result) => {
						if (result !== 0) {
							alert("이미 그룹에 참여중입니다. 그룹을 탈퇴 후 시도해주세요.")
						} else {
							$('#makeGroupForm').submit()
						}
					},
					error : (error) => {
						console.log(error)
					}
				})
			}
		}
	})
	
	// 그룹 검색
	$('#searchGroupBtn').on('click', (e) => {
		let searchGroupInput = $('#searchGroupInput').val()
		let searchCategoryInput = $('#searchCategoryInput').val()
		$.ajax({
			url : "/group/getGroupByName",
			type : "get",
			data : { group_title : searchGroupInput, group_std_key : searchCategoryInput },
			success : (result) => {
				$('#groupListView').empty()
				result.forEach((elem) => {
					let groupDiv = $("<div>").addClass("row text-center")
					let a = $("<a>").append(elem.group_title).attr("href", "/group/room?group_seq=" + elem.group_seq)
					groupDiv.append(a)
					$('#groupListView').append(groupDiv)
				})
			},
			error : (error) => {
				console.log(error)
			}
		})
	})
</script>
</body>
</html>