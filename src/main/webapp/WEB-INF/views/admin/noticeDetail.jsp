<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- bootstrapwatch -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css"
	integrity="sha384-5QFXyVb+lrCzdN228VS3HmzpiE7ZVwLQtkt+0d9W43LQMzz4HBnnqvVxKg6O+04d"
	crossorigin="anonymous">
<!-- bootstrap icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>공지 상세보기</title>
</head>
<style>
.row>* {
	padding: 0%;
}

.container {
	margin-top: 100px;
	margin-bottom: 100px;
}

.head-text {
	border-bottom: 2px solid black;
}

h2 {
	margin-bottom: 20px;
}

h2, h4 {
	font-weight: 800;
}

.bo-title1, .bo-title2 {
	margin-top: 30px;
}

.mem-nick {
	border-bottom: 1px solid #d8dfe9;
	border-top: 1px solid #d8dfe9;
	text-align: center;
	line-height: 50px;
	height: 50px;
	background-color: #f2f5f9;
	margin-top: 20px;
	margin-bottom: 20px;
}

a {
	color: black;
}

.mem-nick span, b {
	margin: 5px;
}

.summerNote {
	margin-bottom: 20px;
}

.bi-trash:hover {
	cursor: pointer;
}

.note-editor.note-frame .note-editing-area .note-editable[contenteditable=false]
	{
	background-color: white;
}

.note-resizebar {
	display: none;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<form action="/admin/noticeUpdate" method="post" id="updateForm">
		<div class="container">
			<div class="row">
				<div class="col-12 head-text">
					<h2>공지사항 상세페이지</h2>
				</div>
			</div>
			<!-- 게시글 제목 -->
			<div class="row notice-title1">
				<div class="col d-flex justify-content-center" id="title">
					<h4>${dto.notice_title}</h4>
				</div>
			</div>
			<div class="row notice-title2 d-none">
				<!-- 수정을 했을때 d-none을 풀어준다 -->
				<div class="col d-flex justify-content-center">
					<input type="text" class="form-control" id="title2"
						name="notice_title" value="${dto.notice_title}"
						placeholder="제목을 입력해주세요">
				</div>
			</div>
			<!-- 게시글 정보 띄워주기 -->
			<div class="row mem-nick">
				<div class="col">
					<span>작성자&nbsp<b>관리자&nbsp</b></span> <span> | &nbsp</span> <span>작성일&nbsp<b>${dto.notice_date}&nbsp</b></span>
					<span> | &nbsp</span> <span>조회수&nbsp<b>${dto.view_count}</b></span>
				</div>
			</div>
			<!-- 게시글 내용 -->
			<div class="row summerNote">
				<div class="col">
					<textarea id="summernote" name="notice_content" rows="10"></textarea>
				</div>
			</div>


			<div class="row">
				<div class="col d-flex justify-content-center">

					<button type="button" class="btn btn-secondary m-2" id="toBack">목록</button>
					<c:if test="${empty loginSession}">
						<button type="button" class="btn btn-defualt m-2" id="updateBtn">수정</button>
						<button type="button" class="btn btn-dark m-2" id="deleteBtn">삭제</button>
						<button type="button" class="btn btn-defualt m-2 d-none"
							id="completeBtn">완료</button>
					</c:if>

				</div>
			</div>

		</div>
		<div>
			<input type="text" name="notice_seq" value="${dto.notice_seq}"
				id="notice_seq" class="d-none"> <input type="text"
				name="img_src" id="img_src" class="d-none">
		</div>
	</form>
	<jsp:include page="../include/footer.jsp" />
	<script>
		 	// 목록 버튼
			document.getElementById("toBack").onclick = function(){
				location.href = "/board/toBoard";
			}
		 	
			 
			$('#summernote').summernote({
				// 섬머노트 툴바 옵션
				  toolbar: [
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'superscript', 'subscript']],
				    ['fontsize', ['fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert', ['picture']]],
				placeholder : "200자 이내의 내용을 입력해주세요.",
				tabsize : 2,
				minHeight : 400,
				maxHeight : $(this).children().prop("height"),
				height : $(this).children().prop("height"),
				disableResizeEditor: true,
				focus : true,
				lang : "ko-KR", // 한글 설정 
				disableDragAndDrop: true,  // 드롭앤 드랍 방지 
				 callbacks : {
					onImageUpload : function(files, editor, welEditable){
						for(let i = files.length - 1; i >= 0; i--){
							uploadSummernoteImageFile(files[i],this);
						}
					},
					// Blur면 툴바 d-none, Focus시 툴바 d-block
					onBlur:function(e){   // summernote에 커서가 없을때 툴바 숨김
						let p = e.target.parentNode.parentNode;
						if(!(e.relatedTarget && $.contains(p,e.relatedTarget))){
							$(this).parent().children(".note-editor").children(".note-toolbar").css("display","none");
							console.log("onBlur");
						}
					},
					onFocus:function(e){ // summernote에 커서가 올라가 있을때 툴바 표시
						$(this).parent().children(".note-editor").children(".note-toolbar").css("display","block");
						console.log("onBlur");
					} 
					
				}   
			});
			
			$("#summernote").summernote("pasteHTML", '${dto.notice_content}'); // 태그자 summernote에 넣어주기 // 게시글 내용 띄워주기
			$("#summernote").summernote("disable"); // 비활성화 
			
			// 이미지 업로드 할 때 실행되는 함수의 정의 
			function uploadSummernoteImageFile(file,el){			
				let data = new FormData();
				data.append("file", file);
				$.ajax({	
					data : data,
					type : "POST",
					url : "/admin/summernote",
					contentType : false,
					enctype : "multipart/form-data",
					processData : false,
					success : function(data) {
						 console.log(data);
 						let img = $('<img>').attr('src','/admin/'+data);
 						img.attr({"width":"50%","height":"50%"}); //이미지 크기 미리 설정
						console.log(img);  
						$(el).summernote("insertNode", img[0]);
					}
				});
			}
			
			// 수정 버튼을 누르면 
			$("#updateBtn").on("click",function(){
				$("#summernote").summernote("enable");
				$("#updateBtn").addClass("d-none");
				$("#deleteBtn").addClass("d-none");
				$("#completeBtn").removeClass("d-none");
				$(".notice-title1").addClass("d-none");
				$(".notice-title2").removeClass("d-none");
				$("#title2").focus();
			})
			
			// 삭제 버튼을 누르면
			$("#deleteBtn").on("click",function(){
				let answer = confirm("게시글을 삭제하시겠습니까?");
				if(answer){ // 글을 삭제한다면
					// 해당 글의 이미지가 있다면 sys_name 배열에 담아 서버폴더에서 직접 삭제 시켜주는 작업
					let str = $("#summernote").val(); // 1. 정규식으로 해당 글의 image의 sysname 담기
					console.log(str);					// 대상 문자열
					 let regex = /\/admin\/(.*?)"/g;	
					 // 뽑아낸 이미지명을 저장하기위한 배열
					 let img_arr = [];
					 while(regex.exec(str)!= null){  // 이미지가 있다면 
						console.log(RegExp.$1);
					 	img_arr.push(RegExp.$1);  // 이미지의 이름 배열에 담기
					};
					console.log(img_arr);
					
					let deleteForm = $("<form>").attr({"action":"/admin/noticeDelete", "method":"post"}).css("display","none");
					deleteForm.append($("#notice_seq"));
					$("body").append(deleteForm);
					if(img_arr.length > 0){ // 이미지가 있는 게시글을 삭제했을 때
						$.ajax({
							url : "/admin/noticeDelete"
							,data : {"notice_seq":$("#notice_seq").val(), "arr" : img_arr}
							, type : "post"
							, success : function(data){
								if(data=="success"){
									alert("게시글이 삭제되었습니다.");
									location.href="/admin/toNotice";
								}else{
									alert("게시글 삭제에 실패했습니다.");
									location.href="/admin/toNotice";
								}
							}
							,error : function(e){
								cnosole.log(e);
							}		
						})
					}
					else{ // 텍스트만 있는 게시글을 삭제했을때
						$.ajax({
							url : "/admin/noticeDelete2"
							,data : {"notice_seq":$("#notice_seq").val()}
							, type : "post"
							, success : function(data){
								if(data=="success"){
									alert("게시글이 삭제되었습니다.");
									location.href="/admin/toNotice";
								}else{
									alert("게시글 삭제에 실패했습니다.");
									location.href="/admin/toNotice";
								}
							}
							,error : function(e){
								cnosole.log(e);
							}		
						})
					}
				}else{ // 글을 삭제하지 않는다면 
					location.href="/admin/toDetail?notice_seq=${dto.notice_seq}";
				}
			})
			//수정시 실제로 삭제되어야할 이미지경로를 배열에 담는다 
			let updateFile = [];
			// 수정완료 버튼을 누르면 
			$("#completeBtn").on("click",function(){	
				let files = $("<input>").attr({
					"type": "text",
					"name": "arr[]",
					"value": updateFile}).css("display", "none");
				$("#updateForm").append(files);
				let contents = $("#summernote").val();
				let title = $("#title2").val().trim();
				if(contents =="" || title ==""){
					alert("제목을 입력해주세요")
					return;
				}
				if($("#title2").val().length>30){
					alert("제목을 30자 이내로 입력해주세요")
					return;
				}
				if($("#summernote").val().length>300){
					alert("내용을 300자 이내로 입력해주세요")
					return;
				}
				$("#updateForm").submit();
			}) 
			
				// MutationObserver를 통해 summernote에서 제거한 img의 경로값 얻기
				let target = document.querySelector(".note-editable"); // summernote - 데이터가 입력되는 부분의 부모
				console.log(target);
				//1. 옵션 설정
				let config = {childList:true, subtree:true, characterData:true, characterDataOldValue:true};
				
				//2. 옵저버 인스턴스 생성 
				let observer = new MutationObserver(function(mutations){
					for(let mutation of mutations){ // mutationRecord값 얻어오기
						
						if(mutation.removedNodes.length == 1){ // 데이터가 제거됐을때 
						
							if(mutation.removedNodes[0].src != null){ // src속성이 있는 데이터일때(img 태그일 때) 
								let img = mutation.removedNodes[0].src;	// 삭제한 이미지의 경로값			
 								console.log(img);
								let img_src = $("#img_src").val(img);
								let path = img_src.val();
								updateFile.push(path);
								console.log(updateFile);
							};					
						}
				}
				});
				//3. DOM의 변경사항 관찰시작
				observer.observe(target,config);
			</script>
</body>
</html>