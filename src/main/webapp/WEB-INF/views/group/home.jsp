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
    	margin: 10px;
        width: 40%;
        height: 60%;
    }
    #goMyGroupBtn {
    	margin: 10px;
        width: 40%;
        height: 60%;
    }
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<div class="container">
	<!-- 그룹 검색창 -->
    <div class="row">
        <c:if test="${not empty loginSession}">
        <div class="col-9">
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
        <div class="col-3 align-self-center">
        	<button class="btn btn-primary" id="createGroupBtn" data-bs-toggle="modal" data-bs-target="#makeGroupModal">그룹 생성</button>
        	<c:if test="${loginSession.group_seq ne 0}">
        		<button class="btn btn-secondary" id="goMyGroupBtn">내 그룹</button>
        	</c:if>
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
    <!-- 여기까지 그룹 검색창 -->
    
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
	
	<!-- 그룹 리스트 -->
	<div class="row text-center">
		<h3>그룹 리스트</h3>
	</div>
	<div id="groupListView">
		<c:choose>
			<c:when test="${empty groupList}">
				<div class="row text-center">
					<h4>생성된 그룹이 없습니다.</h4>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${groupList}" var="group">
					<div class="row g-0 groupDetail" style="border: 1px solid grey; width: 100%; height: 200px">
						<div class="col-4">
							<img src="/resources/group_img/group_img_${group.group_image}.jpg" style="width: 300px; height: 200px">
						</div>
						<div class="col-8 align-self-center">
					        <h3>${group.group_title}</h3>
					        <button type="button" class="btn btn-secondary groupDetailBtn" data-bs-toggle="modal" data-bs-target="#groupDetailModal">그룹 상세정보</button>
					        <input type="text" value="${group.group_seq}" style="display: none;">
						</div>
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
			      		<div class="row">
			      			<div class="col-4 align-self-center">
			      				<button type="button" class="btn btn-primary" id="toggleImageSelectBtn">그룹 이미지</button>
			      			</div>
			      			<div class="col-8" id="selectedImageDiv">
			      				<img src="/resources/group_img/group_img_1.jpg" style="width: 100%" alt="1" id="selectedImage">
			      				<input type="text" class="d-none" id="selectedImageNum" name="selectedImageNum" value="1">
			      			</div>
			      		</div>
			      		<div class="row">
			      			<div class="row m-1 p-1" id="imageSelectList">
								<c:forEach items="${imageList}" var="image">
				      				<div class="col-4 p-1">
				      					<img src="/resources/group_img/group_img_${image}.jpg" style="width: 100%" class="imageSelect" alt="${image}">
				      				</div>
								</c:forEach>
								<!-- 이미지 선택 관련 스크립트 로직 -->
								<script>
									$('#imageSelectList').hide()
									// 이미지 선택창 토글
									$('#toggleImageSelectBtn').on('click', (e) => {
										$('#imageSelectList').toggle(100)
									})
									// 이미지 리스트에서 이미지 선택 시
									$('.imageSelect').on('click', (e) => {
										let imageNum = $(e.target).attr('alt')
										$('#selectedImage').attr("src", "/resources/group_img/group_img_" + imageNum + ".jpg").attr("alt", 'imageNum')
										$('#selectedImageNum').val(imageNum)
										$('#imageSelectList').toggle(100)
									})
								</script>
			      			</div>
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
	
	<!-- 이하 그룹 상세 모달 -->
	<div class="modal fade" id="groupDetailModal" tabindex="-1" aria-labelledby="groupDetailModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
		    <div class="modal-content">
		        <div class="modal-header">
		        	<h5 class="modal-title" id="exampleModalLabel">그룹 상세</h5>
		        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		        </div>
		        <div class="modal-body">
		        	<input type="text" id="groupDetailSeq" style="display: none">
		        	<p>
		        		<span>그룹 이름 : </span><span id="groupDetailName"></span>
		        	</p>
		        	<p>
		        		<span>방장의 한마디 : </span><span id="groupDetailContent"></span>
		        	</p>
		        	<p>
		        		<span>그룹 카테고리 : </span><span id="groupDetailCategory"></span>
		        	</p>
		        	<p>
		        		<span>그룹 현 인원 수 : </span><span id="groupDetailCurNum"></span> / <span id="groupDetailMaxNum"></span>
		        	</p>
		        </div>
		        <div class="modal-footer">
		        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        	<button type="button" class="btn btn-primary" id="groupEnterBtn">들어가기</button>
		        </div>
		    </div>
	    </div>
	</div>
	<!-- 이상 그룹 상세 모달 -->
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
					let groupDiv = $("<div>").addClass("row g-0 groupDetail")
						.css({"border" : "1px solid grey", "width" : "100%", "height" : "200px"})
					
					let picDiv = $("<div>").addClass("col-4")
					let contentDiv = $("<div>").addClass("col-8 align-self-center")
					
					let img = $("<img>").attr("src", "/resources/group_img/group_img_" + elem.group_image + ".jpg")
						.css({"width" : "300px", "height" : "200px"})
					let groupTitle = $("<h3>").html(elem.group_title)
					let groupDetailBtn = $("<button>").addClass("btn btn-secondary groupDetailBtn").html("그룹 상세정보")
					let hiddenInput = $("<input>").attr("type", "text").val(elem.group_seq).css({"display" : "none"})
					
					picDiv.append(img)
					contentDiv.append(groupTitle, groupDetailBtn, hiddenInput)
					groupDiv.append(picDiv, contentDiv)
					$('#groupListView').append(groupDiv)
				})
			},
			error : (error) => {
				console.log(error)
			}
		})
	})
	
	// 그룹 상세 버튼 클릭시
	$(document).on('click', '.groupDetailBtn', (e) => {
		let group_seq = $(e.target).next().val()
		$.ajax({
			url : "/group/getGroupBySeq",
			type : "get",
			data : { group_seq : group_seq },
			success : (result) => {
				$('#groupDetailSeq').val(group_seq)
				$('#groupDetailName').html(result.group_title)
				$('#groupDetailContent').html(result.group_content)
				$('#groupDetailCategory').html(result.group_std_key)
				$('#groupDetailCurNum').html(result.group_memCount)
				$('#groupDetailMaxNum').html(result.group_max)
			},
			error : (error) => {
				console.log(error)
			}
		})
	})
	
	// 그룹 들어가기 버튼 클릭 시
	$('#groupEnterBtn').on('click', (e) => {
		let group_seq = $('#groupDetailSeq').val()
		let loginGroup_seq = ${loginSession.group_seq}
		let mem_seq = ${loginSession.mem_seq}
		
		let curNum = parseInt($('#groupDetailCurNum').html())
		let maxNum = parseInt($('#groupDetailMaxNum').html())
		
		if (loginGroup_seq == 0) {
			let confirmGroupSignin = confirm('그룹에 가입하시겠습니까?')
			if (confirmGroupSignin) {
				if (curNum >= maxNum) {
					alert('방이 꽉 찼습니다.')
				} else {
					$.ajax({
						url : "/group/groupSignin",
						type : "post",
						data : { group_seq : group_seq, mem_seq : mem_seq },
						success : (result) => {
							if (result === "success") {
								location.href = "/group/room?group_seq=" + group_seq
							}
						},
						error : (error) => {
							console.log(error)
						}
					})
				}
			} else {
				alert("그룹에 가입하실 수 없습니다.")
			}
		} else if (group_seq != loginGroup_seq) {
			alert('이미 다른 그룹에 가입하셨습니다.')
			return
		} else {
			location.href = "/group/room?group_seq=" + group_seq
		}
	})
	
	// 내 그룹 가기 버튼 클릭 시
	$('#goMyGroupBtn').on('click', (e) => {
		location.href = "/group/room?group_seq=" + ${loginSession.group_seq}
	})
</script>
</body>
</html>