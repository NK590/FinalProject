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
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>공부하기</title>
<style>
.stopwatch {
	display: inline-block;
	background-color: white;
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
	display:none;
	position: relative;
	left: 360px;
	width: 600px;
	height: 150px;
}

#alert {
	display:none;
	position: relative;
	left: 450px;
	width: 400px;
	height: 170px;
}

.fa-play { /*스탑워치의 재생버튼 스타일*/
	color: blue;
	font-size: 20pt;
}

.fa-pause { /*스탑워치의 일시정지버튼 스타일*/
	color: blue;
	font-size: 20pt;
}
.fa-stop { /*스탑워치의정지버튼 스타일*/
	color: blue;
	font-size: 20pt;
}
.fa-circle-minus {
	margin-top: 10px;
}

body {
	box-sizing: border-box;
}

.crawl-container {
	display: inline-block;
	padding-top: 50px;
	width: 350px;
	height: 300px;
}

.crawl-display {
	width: 350px;
	height: 200px;
	border: 1px solid black;
	overflow: scroll;
	overflow-x: auto;
	margin-top: 10px;
	padding:10px;
}

#queryBtn {
	border: none;
	background-color:white;
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

#pause-button {/*일시정지버튼 스타일*/
	background-color: white;
	border: none;
}

#resume-button {/*재생버튼 스타일*/
	background-color: white;
	border: none;
}

#reset-button {/*정지버튼 스타일*/
	background-color: white;
	border: none;
}

.countdown {
	border: 1px solid black;
	width: 380px;
}

#hourDisplay {
	font-size: x-large
}

#minuteDisplay {
	font-size: x-large
}

#secondDisplay {
	font-size: x-large
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<input type="text" id="hour" style="display: none;">
	<input type="text" id="min" style="display: none;">
	<input type="text" id="sec" style="display: none;">
	<div class="container">
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
						<button type="button" class="btn btn-primary" id="modalokay">확인</button>
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
						<button type="button" class="btn btn-success" id="modalokay2">확인</button>
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
						<button type="button" class="btn btn-success" id="modalokay3">확인</button>
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
						<button type="button" class="btn btn-success" id="modalokay4">확인</button>
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
				<p>자정에 모든 타이머가 리셋됩니다. 그전에 공부시간을 저장하지 않으면 공부시간이 모두 사리집니다 서둘러
					공부시간을 저장해 주세요!!</p>
			</div>
		</div>
		<div class="row row-cols-2">
			<div class="col-lg-4 col-12">
				<div class="crawl-container">
					<h4><i class="fa-solid fa-book-atlas"></i> 사전</h4>
					<div class="crawl-display">
						<!-- 여기에 검색결과 뜰 예정 -->
					</div>
					<div class="crawl-input">
						<select id="languageSelect">
							<option value="en">영어</option>
							<option value="jp">일본어</option>
							<option value="cn">중국어</option>
						</select> <input type="text" name="queryInput" id="queryInput"
							style="width: 235px; height:24px" >
						<button type="button" id="queryBtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</div>
				<h4 style="margin-top: 40px;">
					<i class="fa-solid fa-stopwatch"></i> 타이머
				</h4>
				<div class="countdown text-center" style="padding-top: 20px;">
					<div id="form">
						<input type="number" placeholder="HH" min="0" id="hourValue">
						<p>:</p>
						<input type="number" placeholder="MM" min="0" max="59"
							id="minuteValue">
						<p>:</p>
						<input type="number" placeholder="SS" min="0" max="59"
							id="secondValue">
						<button id="start-button" class="btn btn-primary"
							style="margin-bottom: 10px;">START</button>
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

			<div class="col-lg-8 col-auto">
				<div class="basic stopwatch d-flex justify-content-center"></div>
				<div class="basic stopwatch d-flex justify-content-center"></div>
				<div class="basic stopwatch d-flex justify-content-center"></div>
				<div class="basic stopwatch d-flex justify-content-center"></div>
				<div class="basic stopwatch d-flex justify-content-center"></div>
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-success" id="result"
						style="margin-right: 20px; margin-left: 40px;">기록 저장</button>
					<button type="button" class="btn btn-success" id="deletebtn"
						style="margin-right: 20px;">타이머 삭제</button>
					<button type="button" class="btn btn-success" id="deleteEndBtn"
						style="display: none; margin-right: 20px;">삭제 완료</button>
					<button type="button" class="btn btn-success" id="addTimerBtn">타이머
						추가</button>
				</div>
			</div>
		</div>
		<input type="text" value="${loginSession.mem_seq}"
			style="display: none" id="mem_seq">
	</div>
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

      function click(){
        let dv = event.currentTarget;
        console.log(dv.parentNode.children[1].value);
        console.log(dv.parentNode.children[5].innerHTML);
        if(dv.parentNode.children[5].innerHTML=="00:00:00"){
          dv.parentNode.remove();
        }else{
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
          $("#alert2").fadeTo(5000, 400).slideUp(400, function () {
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
          let timeRecord = $(".basic").children("span:eq("+i+")").html()
          const [hours, minutes, seconds] = timeRecord.split(":");//00:00:00 seconds로 변환 
          const totalSeconds = (+hours) * 60 * 60 + (+minutes) * 60 + (+seconds);
          let data = {
        		   "time_subject" : $(".basic").children(".subjectName:eq("+i+")").val(),
        		   "time_count"  : totalSeconds
        		   //"mem_seq":$("#mem_seq").val()
        		}
          list.push(data);
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
      console.log(list2)    
      let bt = document.querySelectorAll(".resetbtn"); // get all buttons with the class 모든타이머00으로
      for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
        bt[i].click();
      }
      closeFullScreenMode();//전체화면닫기
    })
    

    let bt1 = document.querySelectorAll(".startbtn2"); // get all buttons with the class
    for (var i = 0; i < bt1.length; i++) { // newer browsers can use forEach
      bt1[i].onclick = function () { // assign anonymous handler
        openFullScreenMode()
      }
    }
    $(document).ready(function () {//처음 로딩 됐을떄 - 버튼, alert들 다 감추고 시작
    	let bt = document.querySelectorAll(".fa-circle-minus"); // get all buttons with the class 모든타이머00으로
        for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
          bt[i].style.visibility="hidden";
        }
      i=0;
      <c:forEach var="dto" items="${subjectlist}">//재 접속시 저장한 과목의 이름 보이게 
  			$(".basic").children(".subjectName:eq("+(i++)+")").val("${dto.time_subject}")
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
        console.log(last);
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

        buttons.startButton.addEventListener("click", function (event) {
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