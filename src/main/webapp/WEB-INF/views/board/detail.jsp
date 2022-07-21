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
<title>상세보기 페이지</title>
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

.replyBox {
	background: #f2f5f9;
	border-top: 1px solid #dae0e9;
	padding: 30px;
}

.replyBox2 {
	background: #f2f5f9;
	padding: 30px;
}

.replyBox, .replyBox2 {
	padding-top: 5px;
	padding-bottom: 5px;
}

.reply-form textarea {
	width: inherit;
	height: 57px;
	border: 1px solid #dae0e9;
	color: #999;
	line-height: 1.5;
	padding: 5px;
	resize: none;
	background: #fff;
	font-size: 13px;
}

.reply-btn {
	line-height: 62px;
	text-align: center;
}

.reply-content-area p {
	margin-bottom: 0%;
}

.reply-content-area {
	margin-bottom: 5px;
	margin-top: 5px;
	border-bottom: 0.5px dotted rgb(178, 172, 172);
}

.reply-form {
	margin-top: 5px;
}

a {
	color: black;
}

.reply-date {
	font-size: 11px;
	color: rgb(178, 172, 172);
}

.mem-nick span, b {
	margin: 5px;
}

.noReply {
	margin-bottom: 0px;
}

.summerNote {
	margin-bottom: 20px
}

.bi-trash:hover {
	cursor: pointer;
}
</style>
<body>
	<form action="/board/update" method="post" id="updateForm">
		<div class="container">
			<div class="row">
				<div class="col-12 head-text">
					<h2>지식 커뮤니티</h2>
				</div>
			</div>
			<!-- 게시글 제목 -->
			<div class="row bo-title1">
				<div class="col d-flex justify-content-center" id="title">
					<h4>${dto.bo_title}</h4>
				</div>
			</div>
			<div class="row bo-title2 d-none">
				<!-- 수정을 했을때 d-none을 풀어준다 -->
				<div class="col d-flex justify-content-center">
					<input type="text" class="form-control" id="title" name="bo_title"
						value="${dto.bo_title}" placeholder="제목을 입력해주세요">
				</div>
			</div>
			<!-- 게시글 정보 띄워주기 -->
			<div class="row mem-nick">
				<div class="col">
					<span>작성자&nbsp<b>${dto.mem_nick}&nbsp</b></span> <span> |
						&nbsp</span> <span>작성일&nbsp<b>${dto.bo_date}&nbsp</b></span> <span>
						| &nbsp</span> <span>조회수&nbsp<b>${dto.view_count}</b></span>
				</div>
			</div>
			<!-- 게시글 내용 -->
			<div class="row summerNote">
				<div class="col">
					<textarea id="summernote" name="bo_content" rows="10"></textarea>
				</div>
			</div>
			<!-- 댓글 -->
			<div class="row replyBox">
				<c:if test="${empty list }">
					<div class="col-12 ">
						<p class="text-center noReply">등록된 댓글이 없습니다.</p>
					</div>
				</c:if>
				<c:if test="${not empty list}">
					<%-- 댓글이 있다면 --%>
					<c:forEach items="${list}" var="reDto">
						<div class="reply-content-area">
							<p>
								<b>${reDto.mem_nick}</b><span class="reply-date">${reDto.reply_date}</span><c:if test="${dto.mem_seq == reDto.mem_seq}"><i class="bi bi-trash"></i><!--  mem_seq와 댓글 쓴사람의 seq가 같을 때 삭제 버튼을 띄우준다.  -->
									<input type="text" class="d-none getSeq"
										value="${reDto.reply_seq}" name="reply_seq">
								</c:if>
							</p>
							<p>${reDto.reply_content}</p>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="row replyBox2">
				<div class="col-11 reply-form">
					<textarea name="reply_content" id="reply-area"
						placeholder="50자 이내로 입력해주세요"></textarea>
				</div>
				<div class="col-1 reply-btn">
					<button type="button" class="btn btn-outline-secondary"
						id="replyBtn">등록</button>
				</div>

			</div>
			<!-- 버튼 -->
			<div class="row">
				<div class="col d-flex justify-content-center">
					<button type="button" class="btn btn-secondary m-2" id="toBack">목록</button>
					<c:if test="${dto.mem_seq == 1}">
						<!-- loginSession.mem_seq 값으로 대체하기 -->
						<button type="button" class="btn btn-defualt m-2" id="updateBtn">수정</button>
						<button type="button" class="btn btn-dark m-2" id="deleteBtn">삭제</button>
						<button type="button" class="btn btn-defualt m-2 d-none"
							id="completeBtn">완료</button>
					</c:if>
				</div>
			</div>
		</div>
		<div>
			<input type="text" name="bo_seq" value="${dto.bo_seq}" id="bo_seq"
				class="d-none"> <input type="text" name="mem_nick"
				value="${dto.mem_nick}" class="d-none"> <input type="text"
				name="mem_seq" value="${dto.mem_seq}" class="d-none"> <input
				type="text" name="img_src" id="img_src" class="d-none">
		</div>
	</form>
	<script>
		 	// 목록 버튼
			document.getElementById("toBack").onclick = function(){
				location.href = "/board/toBoard";
			}
		 	
			
			// 섬머노트 
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
				maxHeight : 400,
				height : 400,
				focus : true,
				lang : "ko-KR", // 한글 설정 
				disableDragAndDrop: true,  // 드롭앤 드랍 방지 
				 callbacks : {
					onImageUpload : function(files, editor, welEditable){
						for(let i = files.length - 1; i >= 0; i--){
							uploadSummernoteImageFile(files[i],this);
						}
					}
				}   
			});
			
			$("#summernote").summernote("pasteHTML", '${dto.bo_content}'); // 태그자 summernote에 넣어주기 // 게시글 내용 띄워주기
			$("#summernote").summernote("disable"); // 비활성화 
			
			// 이미지 업로드 할 때 실행되는 함수의 정의 
			function uploadSummernoteImageFile(file,el){			
				let data = new FormData();
				data.append("file", file);
				$.ajax({	
					data : data,
					type : "POST",
					url : "/board/summernote",
					contentType : false,
					enctype : "multipart/form-data",
					processData : false,
					success : function(data) {
						 console.log(data);
 						let img = $('<img>').attr('src','/board/'+data);
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
				$(".bo-title1").addClass("d-none");
				$(".bo-title2").removeClass("d-none");
				$(".bo-title2").focus();
			})
			
			// 삭제 버튼을 누르면
			$("#deleteBtn").on("click",function(){
				let answer = confirm("게시글을 삭제하시겠습니까?");
				if(answer){ // 글을 삭제한다면
					// 해당 글의 이미지가 있다면 sys_name 배열에 담아 서버폴더에서 직접 삭제 시켜주는 작업
					let str = $("#summernote").val(); // 1. 정규식으로 해당 글의 image의 sysname 담기
					console.log(str);					// 대상 문자열
					 let regex = /\/board\/(.*?)"/g;	
					 // 뽑아낸 이미지명을 저장하기위한 배열
					 let img_arr = [];
					 while(regex.exec(str)!= null){  // 이미지가 있다면 
						console.log(RegExp.$1);
					 	img_arr.push(RegExp.$1);  // 이미지의 이름 배열에 담기
					};
					console.log(img_arr);
					
					let deleteForm = $("<form>").attr({"action":"/board/delete", "method":"post"}).css("display","none");
					deleteForm.append($("#bo_seq"));
					$("body").append(deleteForm);
					if(img_arr.length > 0){ // 이미지가 있는 게시글을 삭제했을 때
						$.ajax({
							url : "/board/delete"
							,data : {"bo_seq":$("#bo_seq").val(), "arr" : img_arr}
							, type : "post"
							, success : function(data){
								if(data=="success"){
									alert("게시글이 삭제되었습니다.");
									location.href="/board/toBoard";
								}else{
									alert("게시글 삭제에 실패했습니다.");
									location.href="/board/toBoard";
								}
							}
							,error : function(e){
								cnosole.log(e);
							}		
						})
					}
					else{ // 텍스트만 있는 게시글을 삭제했을때
						$.ajax({
							url : "/board/delete2"
							,data : {"bo_seq":$("#bo_seq").val()}
							, type : "post"
							, success : function(data){
								if(data=="success"){
									alert("게시글이 삭제되었습니다.");
									location.href="/board/toBoard";
								}else{
									alert("게시글 삭제에 실패했습니다.");
									location.href="/board/toBoard";
								}
							}
							,error : function(e){
								cnosole.log(e);
							}		
						})
					}
				}else{ // 글을 삭제하지 않는다면 
					location.href="/board/toDetail?bo_seq=${dto.bo_seq}";
				}
			})
			//!!!!!!!!!!!!!!! 수정시 실제로 삭제되어야할 이미지경로를 배열에 담는다 
			let updateFile = [];
			// 수정완료 버튼을 누르면 
			$("#completeBtn").on("click",function(){	
				let files = $("<input>").attr({
					"type": "text",
					"name": "arr[]",
					"value": updateFile}).css("display", "none");
				$("#updateForm").append(files);
				$("#updateForm").submit();
				 // 정규식 적용하기
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
				
				/////  댓글 영역 /////
				$("#replyBtn").on("click",function(){
					if($("#reply-area").val()==""){
						alert("댓글을 입력해주세요.");
						return;
					}else{
						$.ajax({
							url:"/reply/write"
							,type:"post"
							,data : {"bo_seq":$("#bo_seq").val(), "reply_content":$("#reply-area").val()}
							,success : function(data){
								console.log(data);
									makeReply(data);
							}
							,error : function(e){
								console.log(e);
							}
						})
					}
					$("#reply-area").val("");
				})
			// 휴지통 누르면 댓글 삭제
				$(document).on("click",".bi-trash",function(){
					/*  console.log(this.value);*/
					console.log($(this).next(".getSeq"));
					let reply_seq = $(this).next(".getSeq").val();
					let bo_seq = $("#bo_seq").val();
					console.log(bo_seq);
					 $.ajax({
						 url : "/reply/delete"
						 ,type : "post"
						 ,data : {"reply_seq":reply_seq}
						 ,success : function(data){
							 console.log(data);
							if(data=="success"){
								$.ajax({
									url:"/reply/select"
									,type:"post"
									,data:{"bo_seq":bo_seq}
									,success : function(data){
										makeReply(data);
									}
									,error : function(e){
										console.log(e);
									}
								})
							}else{
								alert("댓글 삭제에 실패했습니다.");
							}

						 }
					 	 ,error : function(e){
					 		 console.log(e);
					 	 }
					 }) 
				})
		
				function makeReply(data){
					$(".replyBox").empty();
								 if(data.length==0){ // 댓글이 없다면 
								 let p = $("<p>").addClass("text-center noReply").html("등록된 댓글이 없습니다.");
									let div = $("<div>").addClass("col-12");
									div.append(p);
									$(".replyBox").append(div);
							 }else{ // 댓글이 있다면 
								 for(let reply of data){ // 동적으로 댓글 뿌려주기
									 console.log(reply.reply_seq);
									 let div = $("<div>").addClass("reply-content-area");
									let b = $("<b>").html(reply.mem_nick);
									let span = $("<span>").addClass("reply-date").html(reply.reply_date);
									let a = $("<i>").addClass("bi bi-trash");
									let p1 = $("<p>");
									let p2 = $("<p>").html(reply.reply_content);
									let input = $("<input>").addClass("d-none getSeq").val(reply.reply_seq).attr("type","text");
									if("${dto.mem_seq}"==reply.mem_seq){
										p1.append(b,span,a,input);
										div.append(p1,p2);
										$(".replyBox").append(div);
									}else{
										p1.append(b,span);
										div.append(p1,p2);
										$(".replyBox").append(div);
									} 
								}
							 } 
						}
			
				
		</script>
</body>
</html>































