<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"
></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"
></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Insert title here</title>
<style>
@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoL.ttf");
	font-family: "AppleSDGothicNeoL.ttf";
}

@font-face {
	src: url("/resources/fonts/AppleSDGothicNeoB.ttf");
	font-family: "AppleSDGothicNeoB.ttf";
}

body {
	box-sizing: border-box;
	margin-top: 60px;
}

#searchIdBtn {
	background-color: white;
	color: black;
	border: 1px solid rgb(8, 0, 83);
	border-radius: 10px;
	font-size: 16px;
	margin-bottom: 20px;
}

#loginButton {
	background-color: rgb(8, 0, 83);
	color: white;
	border: 3px solid rgb(8, 0, 83);
	border-radius: 10px;
	font-size: 16px;
	margin-top: 20px;
}

.abab {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 15px;
}
.abcde {
	font-family: "AppleSDGothicNeoB.ttf";
	font-size: 25px;
}
</style>
</head>

<body>
	<div class="container">
		<form id="searchIdForm">
			<div class="row">
				<div class="col-12 mb-5 d-flex justify-content-center">
					<div class="abcde">이메일 찾기</div>
				</div>
			</div>
			<div id="abab">이메일은 가입시 입력하신 닉네임을 통해 찾을 수 있습니다.💃</div>
			<div class="row p-2">
				<label for="nick" class="form-label" id="cdcd"></label>
				<div class="col-8">
					<input type="text" class="form-control" id="findName" placeholder="닉네임을 입력하세요.">
				</div>
				<div class="col-4">
					<button type="button" id="searchIdBtn">닉네임 확인</button>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-3 d-flex justify-content-center">
					<button type="button" id="loginButton" class="btn btn">로그인</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		
		
		// 로그인 버튼 누르면
		document.getElementById("loginButton").onclick = function() {
			self.close();
		}
		
		// 닉네임 확인
		document.getElementById("searchIdBtn").onclick = function(){
			let findName = $("#findName").val()
            console.log("왔어");
            $.ajax({
          	  url : "/member/findNick"
          	  ,type : "post"
          	  ,data : {mem_nick:findName}
          	  ,success : function(data){
          		  console.log("=================나와라===============");
       			 console.log(data);
          		  if (data != "no"){
          		  alert(data);
          		opener.document.getElementById("id").value = data;
          			return "/member/idSearch";  
          		  }else{
          			  alert("등록된 닉네임이 없습니다.");
          		  }
      		  
          	  }
                ,error : function(e){
              	  console.log(e);
                }
            })
		}
		
//		document.getElementById("loginButton").onclick = function() {			
//			opener.document.getElementById("").value = document.getElementById("#id").value;
//			self.close();
//		}
			
		

		</script>


</body>
</html>