<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
<script type="text/javascript"
	src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
></script>
<!-- include summernote css/js-->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet"
>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<!-- bootstrapwatch -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/cosmo/bootstrap.min.css"
	integrity="sha384-5QFXyVb+lrCzdN228VS3HmzpiE7ZVwLQtkt+0d9W43LQMzz4HBnnqvVxKg6O+04d"
	crossorigin="anonymous">
<title>글쓰기</title>
</head>
<style>
@font-face {
	src: url("/resources/fonts/GothicA1-Regular.ttf");
	font-family: "GothicA1-Regular.ttf";
}

@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoL.ttf");
	font-family: "AppleSDGothicNeoL.ttf";
}

@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB.ttf";
}

.row>* {
	padding: 0%;
}

.boardContainer {
	margin-top: 50px;
	font-family: "GothicA1-Regular.ttf";
}

.head-text {
	border-bottom: 1px solid black;
	margin-bottom: 50px;
}
#h2{
	font-weight: bolder;
	margin-bottom: 20px;
}

h2 {
	font-weight: bolder;
	margin-bottom: 20px;
	padding-left : 12px;
}

h2, h4 {
	font-weight: 800;
}

.bo-title {
	margin-top: 30px;
	margin-bottom: 10px;
}

.note-resizebar {
	display: none;
}

.boardCol {
	margin-bottom: 50px;
}

.summerNote {
	margin-bottom: 20px;
}

.btnArea {
	margin-top: 50px;
}

.message_box {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

#writeBtn {
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 10px;
	font-size: 16px;
	margin-top: 20px;
	background-color: rgb(8, 0, 83);
	font-family: "AppleSDGothicNeoB.ttf";
}

#toBack {
	
	color: white;
	border-radius: 10px;
	border: 3px solid rgb(184, 184, 184);
	font-size: 16px;
	margin-top: 20px;
	background-color: rgb(184, 184, 184);
	font-family: "AppleSDGothicNeoB.ttf";
}
/* 헤더 */
.banner {
	position: relative;
	height: 15vh;
	background: url("/resources/images/4.jpg") no-repeat center;
	background-size: cover;
	border-top-left-radius: 35px;
	border-top-right-radius: 35px;
}
.logo {
	margin-top: 25px;
	position: relative;
	width: 280px;
	height: 50px;
	z-index: 1;
}
.navbar-toggler {
	border: none;
}
.navbar-nav {
	margin: 0 auto;
	background-color: none;
}
a {
	text-decoration: none;
	padding: 20px;
	color: black;
	margin-top: -20px;
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 15px;
}

.nav{
color: black;
text-decoration-line: none;
}
li>a:hover {
	color: rgb(20, 62, 177);
}
.dropdown {
	font-size: 14px;
	color: black;
	text-decoration-line: none;
}
.dropdown-menu{
color: black;
}

.dropdown-toggle{
color: black;
text-decoration-line: none;

}
.nav-item{
color: black;
text-decoration-line: none;

}
</style>
<body>
<!-- 해더 -->
<jsp:include page="../include/header.jsp" />
	<div class="container">
		<div class="study_banner">
			<p class="main_text">지식 커뮤니티🙋🏻‍♀️🙋🏻‍♂️</p>
		</div>
		<p class="message_box">
			스터디헬퍼에서는 회원들과 여러가지 정보를 공유할 수 있습니다.<br> 문제를 공유하고 머리를 맞대어 문제를 푸는 기쁨을 누려요. 혹은 공부하는 일상을 서로 공유해요.
			<br>
		</p>
	</div>
	<form action="/board/write" method="post" enctype="multipart/form-data" id="writeForm">
		<div class="container boardContainer">
			<div class="row bo-title">
				<div class="col d-flex justify-content-center">
					<input type="text" class="form-control" id="title" name="bo_title" placeholder="제목을 입력해주세요">
				</div>
			</div>
			<div class="row summernote">
				<div class="col">
					<textarea id="summernote" name="bo_content" rows="10"></textarea>
				</div>
			</div>
			<div class="row btnArea">
				<div class="col d-flex justify-content-center" style="margin-top:50px;">
					<button type="button" class="btn btn-secondary m-1" id="toBack">목록</button>
					<button type="button" class="btn btn-outline-primary m-1" id="writeBtn">글쓰기</button>
				</div>
			</div>
		</div>
		<div>
			<input type="text" name="mem_nick" value="${loginSession.mem_nick }" class="d-none"> <input
				type="text" name="mem_seq" value="${loginSession.mem_seq}" class="d-none"
			> <input type="text" name="img_src" id="img_src" class="d-none">
		</div>
	</form>
	<script>
			$(window).on("load", function() {
	    		$("#title").focus();
			});
		 	// 뒤로 가기 버튼
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
				placeholder : "300자 이내의 내용을 입력해주세요.",
				tabsize : 2,
				minHeight : 400,
				maxHeight : $(this).children().prop("height"),
				height : $(this).children().prop("height"),  // 높이 속성을 자식의 높이 값으로 한다.
				disableResizeEditor: true,	// resize-none
				focus : false,
				disableDragAndDrop: true,  // 드롭앤 드랍 방지 
				 callbacks : {
					onImageUpload : function(files, editor, welEditable){
						for(let i = files.length - 1; i >= 0; i--){
							uploadSummernoteImageFile(files[i],this);
						}
					},
					/* onMediaDelete : function(target)    {
		                console.log(target[0].src);
		            	deleteFile(target[0].src);
		            } */
				}   
			});
		
			// summernote 이미지 업로드 할 때 실행되는 함수의 정의 
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
 						let img = $("<img>").attr("src","/board/"+data);
 						img.attr({"width":"50%","height":"50%"}); 			// image 업로드시 width/height 50%로 맞춰주기
 						console.log(img);  
						$(el).summernote("insertNode", img[0]);
					}
				});
			}
			// 등록 버튼을 누르면 
			$("#writeBtn").on("click",function(){
				// 정규표현식
				let regexTitle = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,20}$/;
				let regexContent = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,1000}$/;
				
				if($("#title").val()==""){
            		alert("제목을 입력해주세요."); 
            		$("#title").focus();
            		return;
            	}else if(!regexTitle.test($("#title").val())){
            		alert("20자 이내로 입력해주세요.");
            		$("#title").focus();
            		$("#title").val("");
            		return;
            	}else if(!regexContent.test($("#summernote").val())){
            		alert("내용을 300자 이내로 입력해주세요.");
            		$('#summernote').summernote({focus:true})
            		$("#summernote").val("");
            		return;
            	}
				else if($("#summernote").val()==""){
            		alert("내용을 입력해주세요."); 
            		$('#summernote').summernote({focus:true})
            		return;
            	}
				
				$("#writeForm").submit();
			}) 
			
			
			
			// MutationObserver를 통해 summernote에서 제거한 img의 경로값 얻기
				let target = document.querySelector(".note-editable"); // summernote - 데이터가 입력되는 부분의 부모
				console.log(target);
				//1. 옵션 설정
				let config = {childList:true, subtree:true, characterData:true};

				//2. 옵저버 인스턴스 생성 
				let observer = new MutationObserver(function(mutations){
					for(let mutation of mutations){ // mutationRecord값 얻어오기
						
						if(mutation.removedNodes.length == 1){ // 데이터가 제거됐을때 
						
							if(mutation.removedNodes[0].src != null){ // src속성이 있는 데이터일때(img 태그일 때) 
								let img = mutation.removedNodes[0].src;	// 삭제한 이미지의 경로값			
 								console.log(img);
								let img_src = $("#img_src").val(img);
								let path = img_src.val();
								 $.ajax({
									url:"/board/imgDelete"
									,type:"post"
									,data : {"path":path}
									,success : function(data){
										console.log(data);
									}
									,error : function(e){
										console.log(e);
									}
								})     
							};					
						}
				}
				});
				//3. DOM의 변경사항 관찰시작
				observer.observe(target,config);
						 
				
		</script>
	<!-- 푸터 -->
	<jsp:include page="../include/footer.jsp" />
</body>
</html>



















