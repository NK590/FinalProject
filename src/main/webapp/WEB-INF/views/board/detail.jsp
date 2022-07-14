<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" />
    <script type="text/javascript" src="cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- include summernote css/js-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>    
<title>상세보기 페이지</title>
</head>
<body>
	<form action="/board/update" method="post" enctype="multipart/form-data" id="updateForm">
		<div class="container">
			<div class="row">
				<div class="col d-flex justify-content-center">
					<h2>게시글 상세보기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="title" class="form-label">제목</label>
			  		<input type="text" class="form-control" id="title" name="bo_title" value="${dto.bo_title}" readonly>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label for="content" class="form-label">내용</label>
			  		<textarea id="summernote" name="bo_content" rows="10" ></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<button type="button" class="btn btn-secondary m-1" id="toBack">뒤로가기</button>
					<button type="button" class="btn btn-defualt m-1" id="updateBtn">수정</button>
					<button type="button" class="btn btn-defualt m-1 d-none" id="completeBtn">완료</button>
				</div>
			</div>
		</div>		
		<div>
			<input type="text" name="mem_nick" value="${dto.mem_nick}">
			<input type="text" name="mem_seq" value="${dto.mem_seq}" >
		</div>
	</form>
		<script>
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
			
			$("#summernote").summernote("pasteHTML", '${dto.bo_content}'); // 태그자 summernote에 넣어주기
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
				$("#completeBtn").removeClass("d-none");
				
			})
			
		</script>
</body>
</html>