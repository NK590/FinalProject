<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>글쓰기</title>
</head>
<body>
		<form action="/board/write" method="post" enctype="multipart/form-data" id="writeForm">
		<div class="container">
			<div class="row">
				<div class="col d-flex justify-content-center">
					<h2>글쓰기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<label for="title" class="form-label">제목</label>
			  		<input type="text" class="form-control" id="title" name="bo_title" placeholder="제목을 입력하세요.">
				</div>
			</div>

			<div class="row">
				<div class="col">
					<label for="content" class="form-label">내용</label>
			  		<textarea id="summernote" name="bo_content" rows="10"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col d-flex justify-content-center">
					<button type="button" class="btn btn-secondary m-1" id="toBack">뒤로가기</button>
					<button type="button" class="btn btn-defualt m-1" id="writeBtn">등록</button>
				</div>
			</div>
		</div>		
		<div>
			<input type="text" name="mem_nick" value="abc123">
			<input type="text" name="mem_seq" value="1" >
		</div>
	</form>
		<script>
		 	// 뒤로 가기 버튼
			document.getElementById("toBack").onclick = function(){
				location.href = "/board/toBoard";
			}
			// 섬머노트 
			$('#summernote').summernote({
				placeholder : "500자 이내의 내용을 입력해주세요.",
				tabsize : 2,
				height : 400,
				focus : true,
				 callbacks : {
					onImageUpload : function(files, editor, welEditable){
						for(let i = files.length - 1; i >= 0; i--){
							uploadSummernoteImageFile(files[i],this);
						}
					}
				}   
			});
			
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
 						let img = $("<img>").attr("src","/board/"+data);
						console.log(img);  
						$(el).summernote("insertNode", img[0]);
					}
				});
			}
			// 등록 버튼을 누르면 
			$("#writeBtn").on("click",function(){
				// 정규식 추가하기
				
				$("#writeForm").submit();
			})
			
		</script>
	
</body>
</html>



















