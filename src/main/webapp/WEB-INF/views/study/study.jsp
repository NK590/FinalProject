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
	display: block;
	background-color: white;
	border: 1px solid #eee;
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

.fa {
	font-size: 20pt;
}

a:nth-child(5) {
	pointer-events: none;
}

.basic a:nth-child(1) {
	pointer-events: none;
}

#alert2 {
	position: relative;
	left: 360px;
	width: 600px;
	height: 150px;
}

#alert {
	position: relative;
	left: 450px;
	width: 400px;
	height: 170px;
}

.fa-play { /*재생버튼 스타일*/
	color: blue
}

.fa-pause { /*일시정지버튼 스타일*/
	color: blue
}

.fa-circle-minus {
	margin-top: 10px;
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
						<button type="button" class="btn btn-primary" id="modalokay2">확인</button>
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
				<h4 class="alert-heading">2분후 모든 타이머가 리셋 됩니다!</h4>
				<p>자정에 모든 타이머가 리셋됩니다. 그전에 공부시간을 저장하지 않으면 공부시간이 모두 사리집니다 서둘러
					공부시간을 저장해 주세요!!</p>
			</div>
		</div>
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
        		}
          let data2 = $(".basic").children(".subjectName:eq("+i+")").val()
          list.push(data);
          list2.push(data2);
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
    function matchM() { return ($("#min").val() == '57'); }
    function matchS() { return ($("#sec").val() == '59'); }
    function countTime() {
      let nowTime = new Date();
      $("#hour").val(nowTime.getHours())
      $("#min").val(nowTime.getMinutes())
      $("#sec").val(nowTime.getSeconds())
      if (matchH() && matchM() && matchS()) {
        $("#alert").fadeTo(12000, 400).slideUp(400, function () { //2분후에 알람이 사라짐
          $("#alert").slideUp(500);
          var bt = document.querySelectorAll(".resetbtn"); // get all buttons with the class
          for (var i = 0; i < bt.length; i++) { // newer browsers can use forEach
            bt[i].click();//reset버튼 다 눌려서 초기화 됨
          }
        });
      }
    }
    onload = initAlarm;
    $("#deletebtn").on("click",function(){//삭제튼 누르면 - 버튼 뜨게 함
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
  </script>
</body>
</html>