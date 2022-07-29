<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 제이쿼리 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<!-- full calendar cdn -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<!-- bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<link
	href='https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css'
	rel='stylesheet'>
	<!-- flat picker -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	
<title>플래너</title>
<style>
html, body {
	overflow: hidden;
	font-size: 14px;
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

a {
	text-decoration: none;
	color: black;
}
.planContent{
resize:none;
height:150px;
}
.inputRow:first-child{
	display:flex;
	justify-content:center;
}
.inputRow:first-child .label{
	justify-content : start;
}
.inputRow:first-child input{
	width:470px;
}
</style>
</head>
<body>
	<div class="container" id="calendar-container">
		<div class="row">
			<div id="calendar"></div>
		</div>
	</div>
	<!-- modal -->
	<div id='datepicker'></div>

	<div class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">일정 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row inputRow">
						<label class="col label" for="title"><span>일정명</span></label> <input
							type="text" class="form-control col-6" id="title" placeholder="15자 이내로 입력해주세요.">
					</div>
					<div class="inputRow">
						<label class="col-2 label" for="start"><span>시작일</span></label> <input
							type="datetime-local" class="form-control col-6" id="start" placeholder="시작일 선택">
					</div>
					<div class="inputRow">
						<label class="col-2 label" for="end"><span>종료일</span></label> <input
							type="datetime-local" class="form-control col-6" id="end" placeholder="종료일 선택">
					</div>
					<div class="row">
						<label class="col-2 label" for="content"><span>내용</span></label>
						<textarea id="content" class="planContent" placeholder="30자 이내로 입력해주세요."></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="cancel">취소</button>
					<button type="button" class="btn btn-primary" id="saveBtn">저장</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	
		(function() {
	
			
			$(function() {
				// calendar element 취득

				var calendarEl = $('#calendar')[0];

				// full-calendar 생성하기

				var calendar = new FullCalendar.Calendar(
						calendarEl,
						{	
							timeZone: 'local',
							
							themeSystem : "bootstrap5",  // 부트스트랩 테마
							
							height : "700px", // calendar 높이 설정

							expandRows : true, // 화면에 맞게 높이 재설정

							slotMinTime : "06:00", // Day 캘린더에서 시작 시간

							slotMaxTime : "30:00", // Day 캘린더에서 종료 시간

							// 해더에 표시할 툴바

							headerToolbar : {

								left : 'prev,next today',

								center : 'title',

								right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'

							},
							

							initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)

							navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크

							editable : true, // 수정 가능여부

							selectable : true, // 날짜 선택하면 title 작성 가능, 달력 일자 드래그 설정가능

							nowIndicator : true, // 현재 시간 마크

							dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

							locale : 'ko', // 한국어 설정

							select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
									
							$(".modal").modal("show"); // 캘린더 클릭했을시 모달창 띄워주기
							$('.modal').on('hidden.bs.modal', function () {  // 모달창이 사라지면 input창 비워두기
								 let title = $("#title").val("");
								 let start = $("#start").val("");
								 let end = $("#end").val("");
								 let content = $("#content").val("");
					    	});
							
								 $("#saveBtn").on("click",function(){
									 let title = $("#title").val();
									 let start = $("#start").val();
									 let end = $("#end").val();
									 let content = $("#content").val();
									 
									 console.log(title);
									 console.log(start);
									 console.log(end);
									 console.log(content);
									 
									 
								 })
								
 								/* let title = prompt("일정을 입력해주세요.");
								let str_space = /\s/;
								if(str_space.exec(title)|| title==""){
									alert("일정명을 입력해주세요."); return;
								}else if (title!=null){ */
	
									/* calendar.addEvent({

										title : title,

										start : arg.start,

										end : arg.end,

										allDay : arg.allDay,
										
										startStr : arg.startStr,
										
										endStr : arg.endStr

									}) */
								
								//}  console.log(arg);
														
								calendar.unselect()

							},
							unselect:function(){
								
							},
							
							eventClick : function(plan) { // 일정 삭제
								if (confirm("'"+plan.event.title+"' 일정을 삭제하시겠습니까?")) {
									plan.event.remove();
									let event = new Object(); // json을 담기 위한 객체 선언
	 								event.plan_title = 	plan.event._def.title; // 일정 내용 */
	 								event.plan_start = plan.event._instance.range.start; // 시작 시간
									event.plan_end =  plan.event._instance.range.end; // 마치는 시간
									event.plan_seq = plan.event._def.publicId; // 일정의 seq번호
									let jsonData = JSON.stringify(event);  
									console.log(jsonData);
									
									$.ajax({
										url:"/planner/planDelete"
										,type:"post"
										,data: jsonData
										,contentType:"application/json"
			                          	,success : function(data){
			                          		if(data=="success"){
			                          			alert("일정이 삭제되었습니다.");
			                          		}else{
			                          			alert("일정 삭제에 실패했습니다.");
			                          		}
			                          	}
										, error : function(e){
											console.log(e);
										}
									})

								}
								
							},

							eventAdd : function(plan) { // 일정추가
								console.log(plan);
								
								let event = new Object(); // json을 담기 위한 객체 선언
 								event.plan_title = 	plan.event._def.title; // 일정 내용 */
 								event.plan_start = plan.event._instance.range.start; // 시작 시간
								event.plan_end =  plan.event._instance.range.end; // 마치는 시간
								event.plan_allDay = plan.event._def.allDay; // 하루종일 여부  
								let jsonData = JSON.stringify(event);  // 객체를 json으로 변환하는 이유는ㄴ controller단에 날짜형식을 parse하기 위함이다
								console.log(event);
								console.log(jsonData);
								
								$.ajax({
									url:"/planner/planInsert"
									,type:"post"
									,data: jsonData
									,contentType:"application/json"
		                          	,success : function(data){
		                          		if(data=="success"){
		                          			alert("일정이 추가되었습니다.");
		                          			location.href="/planner/toPlanner"; 
		                          		}else{
		                          			alert("일정 등록에 실패했습니다.")
		                          		}
		                          	}
									, error : function(e){
										console.log(e);
									}
								})
								
								
							},

							eventChange : function(plan) { // 일정 수정
		                            console.log(plan);		                            	
		                            	let event = new Object(); // json을 담기 위한 객체 선언
		 								event.plan_title = 	plan.event._def.title; // 일정 내용 */
		 								event.plan_start = plan.event._instance.range.start; // 시작 시간
										event.plan_end =  plan.event._instance.range.end; // 마치는 시간
										event.plan_seq = plan.event._def.publicId; // 일정의 seq번호
										let jsonData = JSON.stringify(event); 
										console.log(event);
										console.log(jsonData);
										
										$.ajax({
											url:"/planner/planUpdate"
											,type:"post"
											,data: jsonData
											,contentType:"application/json"
				                          	,success : function(data){
				                          		if(data=="success"){
				                          			alert("일정이 변경되었습니다.");
				                          		}else{
				                          			alert("새로고침 후 일정을 변경해주세요.")
				                          		}
				                          	}
											, error : function(e){
												console.log(e);
											}
										})

							},

							eventRemove : function(plan) { // 이벤트가 삭제되면 발생하는 이벤트

								console.log(plan);

							},

							//이벤트 

							events : [ 
								<c:forEach items="${list}" var="dto">
									{	
									id : "${dto.plan_seq}",  /* plan_seq id값에 담아주기 */
									title : "${dto.plan_title}",
									start : "${dto.plan_start}",
									end : "${dto.plan_end}"
									/* color : '#' + Math.round(Math.random() * 0xffffff).toString(16)  */
									},
								</c:forEach>
							]
						});
				// 캘린더 랜더링

				calendar.render();

				let config ={
						enableTime: true, 
					    dateFormat: "Y-m-d H:i",
					    defaultDate: "today"
					}

				flatpickr("input[type=datetime-local]",config);
				
			});

		})();


	</script>
</body>
</html>










