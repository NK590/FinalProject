<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://kit.fontawesome.com/c370500c98.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<title>공부하기</title>
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

.stopwatch {
	display: inline-block;
	background-color: none;
	margin-bottom: 40px;
	margin-top: 30px;
}

.stopwatch span {
	padding-right: 30px;
	padding-top: 10px;
	font-weight: bold;
	font-size: 20pt;
	display: block;
	float: left;
}

.subjectName {
	height: 40px;
	margin-top: 10px;
	margin-right: 10px;
	text-align: left;
}

.stopwatch a i {
	padding-top: 15px;
	padding-bottom: 0;
	padding-left: 10px;
	text-decoration: none;
	float: left;
}

a:nth-child(5) {
	pointer-events: none;
}

.basic a:nth-child(1) {
	pointer-events: none;
}

#alert2 {
	display: none;
	position: relative;
	left: 650px;
	width: 600px;
	height: 150px;
}

#alert {
	display: none;
	position: relative;
	left: 650px;
	width: 400px;
	height: 170px;
}

.fa-play {
	/*스탑워치의 재생버튼 스타일*/
	color: black;
	font-size: 20pt;
}

.fa-pause {
	/*스탑워치의 일시정지버튼 스타일*/
	color: black;
	font-size: 20pt;
}

.fa-stop {
	/*스탑워치의정지버튼 스타일*/
	color: black;
	font-size: 20pt;
}

.fa-circle-minus {
	margin-top: 10px;
}

body {
	box-sizing: border-box;
	overflow-x: hidden;
}

.crawl-container {
	display: inline-block;
	padding-top: 50px;
	width: 450px;
	height: 300px;
}

.crawl-display {
	width: 300px;
	height: 200px;
	border: 1px solid black;
	overflow: scroll;
	overflow-x: auto;
	margin-top: 20px;
	padding: 10px;
	margin: 0 auto;
}

.crawl-input {
	margin-left: 18px;
	margin-top: 10px;
}

#queryBtn {
	background-color: white;
	border: none;
}

.fa-book-atlas {
	font-size: 20pt;
}

input, p {
	display: inline-block;
}

#hourValue {
	width: 100px;
}

#minuteValue {
	width: 100px;
}

#secondValue {
	width: 100px;
}

button {
	margin-left: 0.5rem;
}

.hidden {
	display: none;
}

#pause-button {
	/*일시정지버튼 스타일*/
	background-color: white;
	border: none;
}

#resume-button {
	/*재생버튼 스타일*/
	background-color: white;
	border: none;
}

#reset-button {
	/*정지버튼 스타일*/
	background-color: white;
	border: none;
}

.countdown {
	width: 380px;
	background-color: rgb(255, 255, 255);
}

#hourDisplay {
	/*스탑워치 시*/
	font-size: x-large
}

#minuteDisplay {
	/*스탑워치 분*/
	font-size: x-large
}

#secondDisplay {
	/*스탑워치 초*/
	font-size: x-large
}

#sumTime {
	/*총공부시간*/
	font-size: 20pt;
	font-weight: bold;
}

.watchgroup {
	text-align: center;
	margin: 0 auto;
	padding: 30px;
	width: 100%;
	background: url("/resources/images/back5.jpg") no-repeat center;
	background-size: cover;
}

.stdMsg {
	font-size: 15px;
	font-family: "AppleSDGothicNeoL.ttf";
	font-style: italic;
}

.message_box {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.timesave {
	color: white;
}

.btn-spt {
	margin: 0 auto;
	text-align: center;
	margin: 20px;
}

#btn-spt {
	background-color: white;
	border: 1px solid rgb(0, 17, 84);
	border-radius: 15px;
	font-size: 20px;
}

.stdTime {
	font-size: 19px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.subjectName {
	float: left;
}

#start-button {
	border: 1px solid rgb(0, 17, 84);
	border-radius: 15px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="study_banner">
			<p class="main_text">공부 시작하기✍🏻</p>
		</div>
		<p class="message_box">
			스터디헬퍼가 여러분의 공부를 도와줄게요.<br> 공부할 과목을 입력하고 시간을 기록해보아요. 필요한만큼 타이머를
			삭제하고 추가할 수도 있어요.<br> Study Supporters엔 시험 대비를 위한 카운트 다운과 기록에 지장을
			주지 않는 사전 검색 기능도 있어요.
		</p>
	</div>
	<input type="text" id="hour" style="display: none;">
	<input type="text" id="min" style="display: none;">
	<input type="text" id="sec" style="display: none;">

	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">정말 삭제하시겠습니까?</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">지금 삭제하시면 시간 기록도 사라집니다.</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-bs-dismiss="modal"
						id="modalclose">취소</button>
					<button type="button" class="btn btn-dark" id="modalokay">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">타이머는 최대 5개까지 등록 가능합니다.</h5>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" id="modalokay2">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal3">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">시간이 종료됐습니다.</h5>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" id="modalokay3">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal4">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">분은 59분 초는 59초를 넘길 수 없습니다.</h5>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" id="modalokay4">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal5">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">로그인 해야 기록 저장이 됩니다.</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">로그인 하시겠습니까?</div>
				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-dark" data-bs-dismiss="modal"
						id="modalclose5">취소</button>
					<button type="button" class="btn btn-dark" id="modalokay5">확인</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="alert2">
		<div class="alert alert-warning text-center" role="alert">
			<h4 class="alert-heading">과목의 이름을 지정해 주세요</h4>
			<p>과목의 이름이 지정되지 않은 타이머가 있습니다.</p>
		</div>
	</div>
	<div class="row" id="alert">
		<div class="alert alert-success" role="alert">
			<h4 class="alert-heading">1분후 모든 타이머가 리셋 됩니다!</h4>
			<p>자정에 모든 타이머가 리셋됩니다. 그전에 공부시간을 저장하지 않으면 공부시간이 모두 사리집니다 서둘러 공부시간을
				저장해 주세요!!</p>
		</div>
	</div>
	<!-- 사전시작 -->
	<div class="btn-spt">
		<div class="stdTime">오늘 나의 공부 시간⏰</div>
		<div class="d-flex justify-content-center" id="sumTime"></div>
		<button type="btn btn-dark" id="btn-spt" data-bs-toggle="offcanvas"
			data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">Study
			Supporters️</button>
	</div>
	<div class="offcanvas offcanvas-start" tabindex="-1"
		id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
		<div class="offcanvas-header">
			<h2 class="offcanvas-title" id="offcanvasExampleLabel">Study
				Supporters🏋🏻‍♀️</h2>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body">
			<div>
				<div class="row dic-timer">
					<h5>
						<i class="fa-solid fa-stopwatch"></i>카운트 다운 타이머
					</h5>
					<p>
						시험과 모의고사를 대비하여 타이머를 이용해보세요.<br> 타이머를 이용해도 공부시간은 계속 누적됩니다.
					</p>
					<div class="countdown text-center" style="padding-top: 20px;">
						<div id="form">
							<input type="number" placeholder="HH" min="0" id="hourValue">
							<p>:</p>
							<input type="number" placeholder="MM" min="0" max="59"
								id="minuteValue">
							<p>:</p>
							<input type="number" placeholder="SS" min="0" max="59"
								id="secondValue">
							<button id="start-button" class="btn"
								style="margin-bottom: 10px;">START⏱</button>
						</div>
						<div id="timeDisplay" style="display: none">
							<p id="hourDisplay"></p>
							<span>:</span>
							<p id="minuteDisplay"></p>
							<span>:</span>
							<p id="secondDisplay"></p>
						</div>
						<button class="hidden" id="pause-button">
							<i class="pausebtn2 fa fa-pause" aria-hidden="true"></i>
						</button>
						<button class="hidden" id="resume-button">
							<i class="fa-solid fa-play" aria-hidden="true"></i>
						</button>
						<button class="hidden" id="reset-button">
							<i class='stopbtn2 fa fa-stop' aria-hidden='true'></i>
						</button>
					</div>
				</div>
				<div class="col-lg-12 col-12">
					<div class="crawl-container-fluid">
						<h5>
							<i class="fa-solid fa-book-atlas"></i> 사전
						</h5>
						<p>
							모르는 단어도 스터디헬퍼에서 해결하세요<br> 화면 전환 없이도 기록하며 단어를 검색할 수 있습니다.
						</p>
						<div class="crawl-display">
							<!-- 여기에 검색결과 뜸 -->
						</div>
						<div class="crawl-input">
							<select id="languageSelect">
								<option value="en">영어</option>
								<option value="jp">일본어</option>
								<option value="cn">중국어</option>
							</select> <input type="text" name="queryInput" id="queryInput"
								style="width: 235px; height: 24px">
							<button type="button" id="queryBtn">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 타이머 시작 -->
	<div class="col-auto watchgroup">

		<div class="stdMsg">
			<p class="stdMsg">
				나는 폭풍이 두렵지 않다<br>나의 배로 항해하는 법을 배우고 있으니깐.
			</p>
			<br>-헬렌켈러-
		</div>
		<div class="basic stopwatch d-flex justify-content-center"></div>
		<div class="basic stopwatch d-flex justify-content-center"></div>
		<div class="basic stopwatch d-flex justify-content-center"></div>
		<div class="d-flex justify-content-center">
			<button type="button" class="btn btn-dark" id="result"
				style="margin-right: 20px; margin-left: 40px;">기록 저장</button>
			<button type="button" class="btn btn-dark" id="deletebtn"
				style="margin-right: 20px;">타이머 삭제</button>
			<button type="button" class="btn btn-light" id="deleteEndBtn"
				style="display: none; margin-right: 20px;">삭제 완료</button>
			<button type="button" class="btn btn-dark" id="addTimerBtn">타이머
				추가</button>
		</div>
	</div>
	<input type="text" value="${loginSession.mem_seq}"
		style="display: none" id="mem_seq">
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
    let docV = document.documentElement;
    let Stopwatch = function (elem, options) {
        deletebutton = createButton('<i class="fa-solid fa-circle-minus fa-lg" aria-hidden="true"></i>',click);
    let inputText = createText();
    let timer = createTimer(),
    	startButton = createButton('<i class="startbtn2 fa fa-play" aria-hidden="true"></i>', start),
        stopButton = createButton("<i class='pausebtn2 fa fa-pause' aria-hidden='true'></i>", stop),
        resetButton = createButton('<div class="resetbtn">', reset),
        offset,
        clock,
        interval;

      // default options
      options = options || {};
      options.delay = options.delay || 1;

      // append elements    
      elem.append(deletebutton) 
      elem.append(inputText);
      elem.appendChild(startButton);
      elem.appendChild(stopButton);
      elem.appendChild(resetButton);
      elem.appendChild(timer);
      function createText() {
        let input = document.createElement("input");
        input.type = "text";
        input.placeholder="과목 이름"
        input.className = "subjectName"; // set the CSS class
        return input;
      }
      // initialize
      reset();

      function click(){//타이머 하나씩 - 버튼 클릭시 삭제하기
        let dv = event.currentTarget;
        if($(".basic").length==1){
        	$("#alert2").fadeTo(2000, 400).slideUp(400, function () {
                $("#alert2").slideUp(400)
                })
        }else{
        	if(dv.parentNode.children[5].innerHTML=="00:00:00"){
                dv.parentNode.remove();
              }else{//타이머에 시분초 기록되어있을경우 modal창 띄워주기
                $("#myModal").show()
                $("#modalclose").on("click",function(){
                  $("#myModal").hide();
                });
                $("#modalokay").on("click",function(){
                  $("#myModal").hide();
                  dv.parentNode.remove();
                });
              } 
        }
        
      }

      // private functions
      function createTimer() {
        return document.createElement("span")
      }

      function createButton(action, handler) {
        let a = document.createElement("a");
        a.href = "#" + action;
        a.innerHTML = action;
        a.addEventListener("click", function (event) {
          handler();
          event.preventDefault();
        });
        return a;
      }
      function start() {
        if (!interval) {
          offset = Date.now();
          interval = setInterval(update, options.delay);
        }
      }

      function stop() {
        if (interval) {
          clearInterval(interval);
          interval = null;
        }
      }

      function reset() {
        clock = 0;
        render(0);
        stop();
      }

      function update() {
        clock += delta();
        render();
      }

      function render() {
        var h = Math.floor(clock / (1000 * 60 * 60)) % 24;
        var m = Math.floor(clock / (1000 * 60)) % 60;
        var s = Math.floor(clock / 1000) % 60;

        if (h < 10) {
          h = "0" + h;
        }
        if (m < 10) {
          m = "0" + m;
        }
        if (s < 10) {
          s = "0" + s;
        }

        return timer.innerHTML = h + ':' + m + ':' + s

      }
      function delta() {
        var now = Date.now(),
          d = now - offset;

        offset = now;
        return d;
      }

      this.start = start;
      this.stop = stop;
      this.reset = reset;
    };
    //전체화면 시작
    function openFullScreenMode() {
      if (docV.requestFullscreen)
        docV.requestFullscreen();
      else if (docV.webkitRequestFullscreen) // Chrome, Safari (webkit)
        docV.webkitRequestFullscreen();
      else if (docV.mozRequestFullScreen) // Firefox
        docV.mozRequestFullScreen();
      else if (docV.msRequestFullscreen) // IE or Edge
        docV.msRequestFullscreen();
    }

    // 전체화면 해제
    function closeFullScreenMode() {
      if (document.exitFullscreen)
        document.exitFullscreen();
      else if (document.webkitExitFullscreen) // Chrome, Safari (webkit)
        document.webkitExitFullscreen();
      else if (document.mozCancelFullScreen) // Firefox
        document.mozCancelFullScreen();
      else if (document.msExitFullscreen) // IE or Edge
        document.msExitFullscreen();
    }
    let elems = document.getElementsByClassName("basic");
    for (let i = 0, len = elems.length; i < len; i++) {
      new Stopwatch(elems[i]);
    }
    
    $("#result").on("click", function () {//시간 기록 버튼
      
    	  for (let i=0; i<5;i++){
    	        if($(".basic").children("span:eq("+i+")").html()!=="00:00:00"&& $(".basic").children(".subjectName:eq("+i+")").val()==""){
    	          $("#alert2").fadeTo(2000, 400).slideUp(400, function () {
    	          $("#alert2").slideUp(400)
    	          })
    	          return;
    	        }
    	        continue;
    	      }
    	      let list = [];
    	      let list2 = [];
    	      let bt1 = document.querySelectorAll(".basic");
    	      for (let i=0; i<bt1.length;i++){
    	        if($(".basic").children(".subjectName:eq("+i+")").val()!=""){
    	        	if($("#mem_seq").val().length == 0){//로그인세션값이 없을때 
    	        		$("#myModal5").show()
    	                $("#modalclose5").on("click",function(){//모달창 바꿀예정 
    	                  $("#myModal5").hide();
    	                });
    	                $("#modalokay5").on("click",function(){
    	                  $("#myModal5").hide();
    	                  location.href="/member/login"
    	                });
    	                return false;
    	        	}else{
    	        		let timeRecord = $(".basic").children("span:eq("+i+")").html()
    	    	          const [hours, minutes, seconds] = timeRecord.split(":");//00:00:00 seconds로 변환 
    	    	          const totalSeconds = (+hours) * 60 * 60 + (+minutes) * 60 + (+seconds);
    	    	          let data = {
    	    	        		   "time_subject" : $(".basic").children(".subjectName:eq("+i+")").val().trim(),
    	    	        		   "time_count"  : totalSeconds,
    	    	        		   "mem_seq":$("#mem_seq").val()
    	    	        		}
    	    	          list.push(data);
    	    	        }
    	        	}
    	      } 
    	      if(list.length>0){//공부기록 저장
    				$.ajax({
    					url : "/study/record"
    					, type: "post"
    					, data:JSON.stringify(list)
    					, contentType: "application/json"
    					, success:function(){
    						location.href="/study/toStudy"
    					}, error:function(e){
    						console.log(e);
    					}
    				})
    				$.ajax({//타이머 과목이름만 저장
    					url : "/study/recordSubject"
    					, type: "post"
    					, data:JSON.stringify(list)
    					, contentType: "application/json"
    					, success:function(){
    						location.href="/study/toStudy"
    					}, error:function(e){
    						console.log(e);
    					}
    				})
    			}else{
    				alert("저장할 기록이 없습니다.")
    			}   
    	      let bt = document.querySelectorAll(".resetbtn"); // get all buttons with the class 모든타이머00으로
    	      for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
    	        bt[i].click();
    	      }
    	      closeFullScreenMode();//전체화면닫기
    	  
    })
    function time(seconds) {
			var hour = parseInt(seconds/3600) < 10 ? '0'+ parseInt(seconds/3600) : parseInt(seconds/3600);
			var min = parseInt((seconds%3600)/60) < 10 ? '0'+ parseInt((seconds%3600)/60) : parseInt((seconds%3600)/60);
			var sec = seconds % 60 < 10 ? '0'+seconds % 60 : seconds % 60;
			return hour+":"+min+":" + sec;
			}	
    	document.getElementById("sumTime").innerText = time(${record});
        let seconds = ${record};
		let active = false;
        $(".startbtn2").parent().on('click', function (){ //시작버튼 누르면 다른 시작버튼은 눌리지 않게 막아둠
    	$(this).children(".startbtn2").css("color","red")
    	$(".startbtn2").parent().not(this).css({ 'pointer-events': 'none' });
    	$(".startbtn2").parent().not(this).next().css({ 'pointer-events': 'none' });
    	$(this).next().on('click',function(){
    		$('.startbtn2').parent().not(this).next().css({ 'pointer-events': 'auto' });
    		$('.startbtn2').parent().not(this).css({ 'pointer-events': 'auto' });
    		$(this).prev().children("i").css("color","blue");
    	})
    	openFullScreenMode();
    				if(active==false){
    					active = true;					
    			    	var timerID=0;
    			    	timerID = setInterval(function() {
    			    	 // 값 증가
    			    	seconds++;
    			    	 // 값을 출력
    				     document.getElementById("sumTime").innerText =
    				        time(seconds)
    				    }, 1000);
    				  }
    				$(".pausebtn2").click(function() {
    					active = false;
    		                clearInterval(timerID);
    			
    			});
    				    
    });
    
    $(document).ready(function () {//처음 로딩 됐을떄 - 버튼, alert들 다 감추고 시작
    	let bt = document.querySelectorAll(".fa-circle-minus"); // get all buttons with the class 모든타이머00으로
        for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
          bt[i].style.visibility="hidden";
        }
      i=0;
      	<c:forEach var="dto" items="${subjectlist}">//재 접속시 저장한 과목의 이름 보이게 
			$(".basic").children(".subjectName:eq("+(i++)+")").val("${dto.time_subject}")
			//$(".stopwatch").children("span:eq("+(i++)+")").html();
		</c:forEach> 
      $("#alert").hide();
      $("#alert2").hide();
    });
    // //11시58분에 타이머 초기화 alert 뜨게 하기 위한 시작
    let alarmTimer = null;
    function initAlarm() {
      if (alarmTimer != null) clearInterval(alarmTimer);
      let nowTime = new Date();

      $("#hour").val(nowTime.getHours())//시
      $("#min").val(nowTime.getMinutes())//분
      $("#sec").val(nowTime.getSeconds())//초
      alarmTimer = setInterval("countTime()", 1000);
    }
    //23시58분에 알람 맞춤
    function matchH() { return ($("#hour").val() == '23'); }
    function matchM() { return ($("#min").val() == '58'); }
    function matchS() { return ($("#sec").val() == '58'); }
    function countTime() {
      let nowTime = new Date();
      $("#hour").val(nowTime.getHours())
      $("#min").val(nowTime.getMinutes())
      $("#sec").val(nowTime.getSeconds())
      if (matchH() && matchM() && matchS()) {
        $("#alert").fadeTo(60000, 100).slideUp(100, function () { //1분후에 알람이 사라짐
          $("#alert").slideUp(500);
          var bt = document.querySelectorAll(".resetbtn"); // get all buttons with the class
          for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
            bt[i].click();//reset버튼 다 눌려서 초기화 됨
          }
        });
      }
    }
    onload = initAlarm;
    $("#deletebtn").on("click",function(){//삭제버튼 누르면 - 버튼 뜨게 함
    	let bt = document.querySelectorAll(".fa-circle-minus"); // get all buttons with the class 모든타이머00으로
        for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
          bt[i].style.visibility="visible";
          bt[i].style.pointerEvents="auto";
        }
      $("#deletebtn").hide();
      $("#deleteEndBtn").show();
    })
    $(".btn-close").on("click",function(){//모달엑스버튼
      $("#myModal").hide();
      $("#myModal5").hide();
    })
    $("#deleteEndBtn").on("click",function(){//삭제완료버튼
    	let bt = document.querySelectorAll(".fa-circle-minus"); // get all buttons with the class 모든타이머00으로
        for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
          bt[i].style.visibility="hidden";
        }
      $("#deletebtn").show();
      $("#deleteEndBtn").hide();
    })
    $("#addTimerBtn").click(function(){//타이머추가
      if(elems.length>=5){//타이머가 5개까지만 추가 될 수 있다
        $("#myModal2").show();
        $("#modalokay2").on("click",function(){
          $("#myModal2").hide();
        });
      }else{//basicdiv를 먼저 만들고 그 안에 타이머 추가
        let elems = document.getElementsByClassName("basic");
        let last = elems[elems.length-1];
        let div = document.createElement ("div");
        div.className="basic stopwatch d-flex justify-content-center"
        last.after(div);
        new Stopwatch(div);
        let last2 = elems[elems.length-1];
        last2.querySelector('.fa-circle-minus').style.visibility="hidden";
        last2.querySelector('a:nth-child(1)').style.pointerEvents="auto";
      }
    })
    
    // 사전 검색 ajax 요청
    	$("#queryInput").keyup(function(event) { //엔터키 누르면 검색되게 
    		if (event.keyCode === 13) {
        	$("#queryBtn").click();
    		}
		});
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
				alert("검색어를 입력해 주세요.")
			}
		})
		
		 const buttons = {
            startButton: document.querySelector("#start-button"),
            pauseButton: document.querySelector("#pause-button"),
            resumeButton: document.querySelector("#resume-button"),
            resetButton: document.querySelector("#reset-button"),
        };

        const inputValues = {
            hour: document.querySelector("#hourValue"),
            minute: document.querySelector("#minuteValue"),
            second: document.querySelector("#secondValue"),
        };

        const displayValues = {
            hour: document.querySelector("#hourDisplay"),
            minute: document.querySelector("#minuteDisplay"),
            second: document.querySelector("#secondDisplay"),
        };

        const form = document.querySelector("#form");
        const timeDisplay = document.querySelector("#timeDisplay");
        let isPause = false;
        let countDown = "";

        buttons.startButton.addEventListener("click", function (event) {//카운트 다운 스타트버튼
            form.style.display = "none";
            timeDisplay.style.display = "inline-block";
            this.classList.add("hidden");
            buttons.pauseButton.classList.remove("hidden");
            buttons.resetButton.classList.remove("hidden");

            for (let i = 0; i < 3; i++) {
                if (Object.values(inputValues)[i].value === "") {
                    Object.values(displayValues)[i].innerText = "00";
                    Object.values(inputValues)[i].value = "0";
                } else {
                    Object.values(displayValues)[i].innerText = (
                        "0" + Object.values(inputValues)[i].value
                    ).slice(-2);
                }
            }
            if(parseInt(inputValues.minute.value)>59 || parseInt(inputValues.second.value)>59){
            	$("#myModal4").show();
            	$("#reset-button").trigger("click");
                $("#modalokay4").on("click",function(){
                  $("#myModal4").hide();
            	})
            	return;
            }

            countDown = setInterval(function () {
                if (!isPause) {
                    if (
                        inputValues.hour.value === "0" &&
                        inputValues.minute.value === "0" &&
                        inputValues.second.value === "0"
                    ) {
                        displayValues.second.innerText === "0";
                        clearInterval(countDown);
                        $("#myModal3").show();
                        $("#modalokay3").on("click",function(){
                          $("#myModal3").hide();
                          isPause = false;
                          clearInterval(countDown);
                          buttons.resetButton.classList.add("hidden");
                          buttons.pauseButton.classList.add("hidden");
                          buttons.resumeButton.classList.add("hidden");
                          buttons.startButton.classList.remove("hidden");
                          form.style.display = "inline-block";
                          timeDisplay.style.display = "none";
                          reset();
                        });
                    } else {
                        if (
                            parseInt(inputValues.minute.value) > 0 &&
                            inputValues.second.value === "0"
                        ) {
                            inputValues.minute.value = parseInt(inputValues.minute.value) - 1;
                            displayValues.minute.innerText = (
                                "0" + inputValues.minute.value
                            ).slice(-2);

                            inputValues.second.value = "60";
                            displayValues.second.innerText = inputValues.second.value;
                        } else if (
                            parseInt(inputValues.hour.value) > 0 &&
                            inputValues.minute.value === "0" &&
                            inputValues.second.value === "0"
                        ) {
                            inputValues.hour.value = parseInt(inputValues.hour.value) - 1;
                            displayValues.hour.innerText = ("0" + inputValues.hour.value).slice(-2);

                            inputValues.minute.value = "59";
                            displayValues.minute.innerText = inputValues.minute.value;

                            inputValues.second.value = "60";
                            displayValues.second.innerText = inputValues.second.value;
                        }
                        inputValues.second.value = parseInt(inputValues.second.value) - 1;
                        displayValues.second.innerText = ("0" + inputValues.second.value).slice(-2);
                    }
                }
            }, 1000);
        });

        buttons.pauseButton.addEventListener("click", function () {
            isPause = true;
            this.classList.add("hidden");
            buttons.resumeButton.classList.remove("hidden");
        });

        buttons.resumeButton.addEventListener("click", function () {
            isPause = false;
            this.classList.add("hidden");
            buttons.pauseButton.classList.remove("hidden");
        });

        buttons.resetButton.addEventListener("click", function () {
            isPause = false;
            clearInterval(countDown);
            this.classList.add("hidden");
            buttons.pauseButton.classList.add("hidden");
            buttons.resumeButton.classList.add("hidden");
            buttons.startButton.classList.remove("hidden");
            form.style.display = "inline-block";
            timeDisplay.style.display = "none";
            reset();
        });

        function reset() {
            for (let input of Object.values(inputValues)) {
                input.value = "";
            }
            for (let display of Object.values(displayValues)) {
                display.innerText = "0";
            }
        }
  </script>
</body>
</html>