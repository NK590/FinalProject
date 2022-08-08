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
<!-- full calendar 언어 CDN -->
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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_green.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<!-- 툴팁 -->
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>

<title>플래너</title>
<style>
html, body {
	font-size: 14px;
	font-family: "AppleSDGothicNeoL.ttf";
}

/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}

.planContent {
	resize: none;
	height: 150px;
}

.inputRow {
	display: flex;
	justify-content: center;
}

.inputRow:first-child .label {
	justify-content: start;
}

.inputRow input {
	width: 470px;
}

.fc-day-sun a { /* 일요일 빨간색 */
	color: red;
	text-decoration: none;
}

.fc-day-sat a { /* 토요일 빨간색 */
	color: dodgerblue;
	text-decoration: none;
}

.fc-button {
	background-color: #2c2c6b !important;
	color: white !important;
	border-color: transparent !important;
}
.fc-daygrid-day-number,.fc-col-header-cell-cushion,.fc-list-day-side-text,.fc-list-day-text{
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	
	<!-- 플래너 -->
	<div class="container plannerContainer" id="calendar-container">
		<div class="row">
			<div id="calendar"></div>
		</div>
	</div>
	<!-- modal -->
	<div id='datepicker'></div>
	<form id="plannerForm">
		<div class="modal insertModal fade" tabindex="-1">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">일정 등록</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row inputRow">
							<label class="col label" for="title"><span>일정명</span></label> <input
								type="text" class="form-control col-6" id="title" name="title"
								placeholder="20자 이내로 입력해주세요.">
						</div>
						<div class="row">

							<label class="col label" for="eventType"><span>일정타입</span></label>
							<div class="col-12">
								<div class="form-check form-check-inline">
									<input class="form-check-input eventType" type="radio"
										name="eventType" id="study" value="#6666FF" checked> <label
										class="form-check-label" for="inlineRadio1"><span>📖</span> Study</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input eventType" type="radio"
										name="eventType" id="appointment" value="#24d1c3"> <label
										class="form-check-label" for="inlineRadio1"><span>💼</span> Appointment</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input eventType" type="radio"
										name="eventType" id="event" value="#f27718"> <label
										class="form-check-label" for="inlineRadio2"><span>🎉</span>Event</label>
								</div>
								<div class="form-check form-check-inline">
									<input class="form-check-input eventType" type="radio"
										name="eventType" id="important" value="#d6243f"> <label
										class="form-check-label" for="inlineRadio3"><span>💡</span>Important</label>
								</div>
							</div>
						</div>
						<div class="row inputRow">
							<label class="col label" for="start"><span>시작일</span></label> <input
								type="datetime-local" class="form-control col-6" id="start"
								name="start" placeholder="시작일 선택">
						</div>
						<div class="row inputRow">
							<label class="col label" for="end"><span>종료일</span></label> <input
								type="datetime-local" class="form-control col-6" id="end"
								name="end" placeholder="종료일 선택">
						</div>
						<div class="row inputRow">
							<label class="col label" for="content"><span>내용</span></label>
							<textarea id="content" class="planContent" name="content"
								placeholder="30자 이내로 입력해주세요."></textarea>
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
	</form>
	<!-- 수정삭제 모달 -->
	<div class="modal updateModal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">일정 등록</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row inputRow">
						<label class="col label" for="updateTitle"><span>일정명</span></label>
						<input type="text" class="form-control col-6" id="updateTitle"
							name="title" placeholder="15자 이내로 입력해주세요." readonly>
					</div>
					<div class="row">

						<label class="col label" for="updateEventType"><span>일정
								타입</span></label>
						<div class="col-12">
							<div class="form-check form-check-inline">
								<input class="form-check-input updateEventType" type="radio"
									name="updateEventType" id="updateStudy" value="#6666FF"
									disabled> <label class="form-check-label"
									for="inlineRadio1"><span>📖</span>Study</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input updateEventType" type="radio"
									name="updateEventType" id="updateAppointment" value="#24d1c3"
									disabled> <label class="form-check-label"
									for="inlineRadio1"><span>💼</span>Appointment</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input updateEventType" type="radio"
									name="updateEventType" id="updateEvent" value="#f27718"
									disabled> <label class="form-check-label"
									for="inlineRadio2"><span>🎉</span>Event</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input updateEventType" type="radio"
									name="updateEventType" id="updateImportant" value="#d6243f"
									disabled> <label class="form-check-label"
									for="inlineRadio3"><span>💡</span>Important</label>
							</div>
						</div>
					</div>
					<div class="row inputRow">
						<label class="col label" for="updateStart"><span>시작일</span></label>
						<input type="datetime-local" class="form-control col-6"
							id="updateStart" name="start" placeholder="시작일 선택" disabled>
					</div>
					<div class="row inputRow">
						<label class="col label" for="updateEnd"><span>종료일</span></label>
						<input type="datetime-local" class="form-control col-6"
							id="updateEnd" name="end" placeholder="종료일 선택" disabled>
					</div>
					<div class="row inputRow">
						<label class="col label" for="updateContent"><span>내용</span></label>
						<textarea id="updateContent" class="planContent" name="content"
							placeholder="30자 이내로 입력해주세요." readonly></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" id="updateCancel">취소</button>
					<button type="button" class="btn btn-default" id="updateBtn">수정</button>
					<button type="button" class="btn btn-primary d-none"
						id="completeBtn">완료</button>
					<button type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
					<input type="text" class="d-none" id="mem_seq"
						value="${loginSession.mem_seq}">
				</div>
			</div>
		</div>
	</div>
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
	
		(function() {
	
			// 공부시간 변환 
			$(function() {
				function time(seconds) {
			         var hour = parseInt(seconds/3600) < 10 ? '0'+ parseInt(seconds/3600) : parseInt(seconds/3600);
			         var min = parseInt((seconds%3600)/60) < 10 ? '0'+ parseInt((seconds%3600)/60) : parseInt((seconds%3600)/60);
			         var sec = seconds % 60 < 10 ? '0'+seconds % 60 : seconds % 60;
			         return hour+":"+min+":" + sec;
			         }   			
				
				// mem_seq 값
				 let mem = $("#mem_seq").val();			
				
				// calendar element 
				var calendarEl = document.getElementById('calendar'); //$('#calendar')[0];
				
				// full-calendar 생성하기
				var calendar = new FullCalendar.Calendar(
						calendarEl,
						{	
							timeZone: 'local',
							
							themeSystem : "bootstrap5",  // 부트스트랩 테마
							
							height : "800px", // calendar 높이 설정

							expandRows : true, // 화면에 맞게 높이 재설정

							slotMinTime : "05:00", // Day 캘린더에서 시작 시간

							slotMaxTime : "29:00", // Day 캘린더에서 종료 시간
						
							
							// title fotmat에 해당 월만 띄워주기
							 titleFormat: { 
							    month: 'long'		   
					  		},
							// 일정 추가 버튼 생성
							customButtons: {
							    myCustomButton: {
							      text: "+ 일정추가",
							      click: function() {
							    	  $(".insertModal").modal("show"); // 캘린더 클릭했을시 모달창 띄워주기									 
									
										} 
							      }
							    
							  },
							
							// 해더에 표시할 툴바

							headerToolbar : {

								left : 'prev,next today myCustomButton',

								center : 'title',

								right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek',
									
							},
							
							initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)

							navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크

							editable : true, // 수정 가능여부

							selectable : true, // 날짜 선택하면 title 작성 가능, 달력 일자 드래그 설정가능

							nowIndicator : true, // 현재 시간 마크

							dayMaxEvents : true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

							 locale : 'ko', // 한국어 설정 

							select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
							
							calendar.unselect();

							},
							unselect:function(){
								
							},
							eventDidMount:function(info){ // 툴팁 적용
								tippy(info.el,{
									content: "일정 : "+info.event.title, //+"시간 : "+info.event.start+" - "+info.event.end,
									placement: "bottom",
									maxWidth:"100"
								});
							}, 
							/* eventDidMount: function(event, element) {
							    $(element).popover({
							        placement : 'top',
							        html : true,
							        trigger : 'hover',
							        title : event.title ,
							        content : '<p>' + event.start + '</p><p>' + event.end + '<p>' + event.description + '</p>'
							  });
							}, */
															                
							eventClick : function(plan) { // 일정 수정 및 삭제
								if(!plan.event.allDay){
							console.log(plan);
									$(".updateModal").modal("show");
									let data = plan.event._def.publicId;
									$.ajax({
										url:"/planner/selectPublicId",
										type:"get",
										data:{"plan_seq":data},
										success:function(data){
											$("#updateTitle").val(data.plan_title);
											$(":radio[name='updateEventType'][value='"+data.plan_background+"']").attr("checked",true);
											$("#updateStart").val(data.plan_start);
											$("#updateEnd").val(data.plan_end);
											$("#updateContent").val(data.plan_content);
											$("#completeBtn").val(data.plan_seq);
											$("#updateBtn").val(data.mem_seq);
										},									
										error:function(e){
											console.log(e);
										}
									
									})
								}			
							},

 							eventAdd : function(plan) { // 일정추가
								console.log(plan);
								let event = new Object(); // json을 담기 위한 객체 선언
 								event.plan_title = 	plan.event._def.title; // 일정명 
 								event.plan_content = plan.event._def.extendedProps.description; // 일정 내용
 								event.plan_background = plan.event.backgroundColor; // 배경 색상
 								event.plan_start = plan.event._instance.range.start; // 시작 시간
								event.plan_end =  plan.event._instance.range.end; // 마치는 시간  
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
		                          			 $(".insertModal").modal("hide");
		                          			location.href="/planner/toPlanner?mem_seq="+mem;
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
		 								event.plan_title = 	plan.event._def.title; // 일정 내용 
		 								event.plan_content = plan.event._def.extendedProps.description; // 일정 내용
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
				                          		/* 	location.href="/planner/toPlanner?mem_seq="+mem; */
				                          		}else if(plan.event.allDay){
				                          			alert("공부기록은 변경할 수 없습니다.");
				                          			location.href="/planner/toPlanner?mem_seq="+mem;
				                          		}else{
				                          			alert("새로고침후 일정을 변경해주세요");
				                          		}
				                          	}
											, error : function(e){
												console.log(e);
											}
										})

							},

							eventRemove : function(plan) { // 이벤트가 삭제되면 발생하는 이벤트
								console.log(plan);
								plan.event.remove();
							},
							displayEventEnd: { // 종료시간 띄워주기
			                    month: false,
			                    basicWeek: true,
			                    "default": true
			                },

							// 등록된 이벤트 띄워주기

							events : [ 
									<c:forEach items="${list}" var="dto">
									{	
									id : "${dto.plan_seq}",  /* plan_seq id값에 담아주기 */
									<c:if test="${dto.plan_background == '#6666FF'}">
									title : '📖 '+"${dto.plan_title}",
									textColor : "white",
									</c:if>
									<c:if test="${dto.plan_background == '#24d1c3'}">
									title : '💼 '+"${dto.plan_title}",
									textColor : "white",
									</c:if>
									<c:if test="${dto.plan_background == '#f27718'}">
									title : '🎉 '+"${dto.plan_title}",
									textColor : "white",
									</c:if>
									<c:if test="${dto.plan_background == '#d6243f'}">
									title : '💡 '+"${dto.plan_title}",
									textColor : "white",
									</c:if>
									
									description : "${dto.plan_content}", 
									start :"${dto.plan_start}",
									end : "${dto.plan_end}",
									backgroundColor : "${dto.plan_background}",
									borderColor : "${dto.plan_background}",
									},
									</c:forEach>							
									<c:forEach items="${timeList}" var="timeDto">
									{
									title : '📚 '+"${timeDto.time_subject}"+" - "+ time("${timeDto.time_count}"),
									start : "${timeDto.time_date}",
									backgroundColor : "1e90ff",
									allDay : true
									},
									</c:forEach>
							],
							
						});
				// 캘린더 랜더링

				calendar.render();
				
				
				// datepicker 날짜 입력
				let config ={
						enableTime: true, 
					    dateFormat: "Y-m-d H:i"
					};

				flatpickr("input[type=datetime-local]",config);
				
				// 모달창이 사라지면 input창 비워두기
				$('.insertModal').on('hidden.bs.modal', function () {  
					 let title = $("#title").val("");
					 let start = $("#start").val("");
					 let end = $("#end").val("");
					 let content = $("#content").val("");
		    	});
				 
				// 저장 버튼을 클릭시 일정등록
			 $("#saveBtn").on("click",function(){
				 let title = $("#title").val();
				 let eventType = $(".eventType:checked").val();
				 let start = $("#start").val();
				 let end = $("#end").val();
				 let content = $("#content").val();				
				 let regexTitle = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,20}$/;
				let regexContent = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,50}$/;
			
				 
				 if(title == ""){
						alert("제목을 입력해주세요");
						return;
					}
					if(!regexTitle.test(title)){
						alert("일정명은 20자이내로 작성해주세요.");
						$("#title").val("");
						$("#title").focus();
						return;
					}if(start==""){
						alert("시작일을 등록해주세요.");
						$("#start").focus();
						return;
					}if(end ==""){
						alert("종료일을 등록해주세요.");
						$("#end").focus();
						return;
					}
					if(content==""){
						alert("내용을 입력해주세요.");
						return;
					}
					if(!regexContent.test(content)){
						alert("내용은 50자이내로 작성해주세요.");
						$("#content").val("");
						$("#content").focus();
						return;
					}
					if(title != ""){
						$("#start").focus();
					}if(start != ""){
						$("#end").focus();
					}if(end != ""){
						$("#content").focus();
					}
				
				 if(start>end){
							alert("올바른 종료일을 입력해주세요.");
							return;
				}
				
				 // 일정 등록
				 calendar.addEvent({

						title : title,
						
						backgroundColor : eventType,
						
						borderColor : eventType,
						
						description : content,

						start : start,
						
						end : end,

					}) 											
				
			 })
				// 수정 버튼을 클릭할 때
				$("#updateBtn").on("click",function(){
					$("#updateTitle").attr("readonly",false);
				 	$(".updateEventType").attr("disabled",false);
				 	$("#updateStart").attr("disabled",false);
				 	$("#updateEnd").attr("disabled",false);
					$("#updateContent").attr("readonly",false);
					$("#updateBtn").addClass("d-none");
					$("#completeBtn").removeClass("d-none");
					$("#updateTitle").focus();
				})
				// 모달창이 사라지면 readonly/disabled 걸어주기
				$('.updateModal').on('hidden.bs.modal', function () {  
					$("#updateTitle").attr("readonly",true);
				 	$(".updateEventType").attr("disabled",true);
				 	$("#updateStart").attr("disabled",true);
				 	$("#updateEnd").attr("disabled",true);
					$("#updateContent").attr("readonly",true);
					$("#updateBtn").removeClass("d-none");
					$("#completeBtn").addClass("d-none");
		    	});
				// 완료 버튼을 눌었을 때 
				$("#completeBtn").on("click",function(){
					let plan_title = $("#updateTitle").val();
					let plan_background = $(".updateEventType:checked").val();
					let plan_start = $("#updateStart").val();
					let plan_end = $("#updateEnd").val();
					let plan_content = $("#updateContent").val();
					let plan_seq = $("#completeBtn").val();
					let mem_seq = $("#updateBtn").val();
					
					 let regexTitle = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,20}$/;
						let regexContent = /^(?!\s*$)[a-zA-Zㄱ-힣0-9 ,\W\w]{1,50}$/;
					
						 
						 if(plan_title == ""){
								alert("제목을 입력해주세요");
								return;
							}
							if(!regexTitle.test(plan_title)){
								alert("일정명은 20자이내로 작성해주세요.");
								$("#title").val("");
								$("#title").focus();
								return;
							}if(plan_start==""){
								alert("시작일을 등록해주세요.");
								$("#start").focus();
								return;
							}if(plan_end ==""){
								alert("종료일을 등록해주세요.");
								$("#end").focus();
								return;
							}
							if(plan_content==""){
								alert("내용을 입력해주세요.");
								return;
							}
							if(!regexContent.test(plan_content)){
								alert("내용은 50자이내로 작성해주세요.");
								$("#content").val("");
								$("#content").focus();
								return;
							}
					if(plan_start>plan_end){
						alert("올바른 종료일을 입력해주세요.");
						return;
			 			} 	 
					$.ajax({
						url:"/planner/planUpdateModal"
						,type:"post"
						,data:{"plan_seq":plan_seq,"mem_seq":mem_seq,"plan_title":plan_title,"plan_background":plan_background,"plan_start":plan_start,"plan_end":plan_end,"plan_content":plan_content}
                      	,success : function(data){
                      		if(data=="success"){
                      			alert("일정이 변경되었습니다.");
                      			$(".updateModal").modal("hide");
                      			location.href="/planner/toPlanner?mem_seq="+mem; 
                      		}else{
                      			alert("일정 수정에 실패했습니다.");
                      		}
                      	}
						, error : function(e){
							console.log(e);
						}
					})
					
				})
				// 삭제 버튼을 눌렀을 때
				$("#deleteBtn").on("click",function(){
				 if(confirm("일정을 삭제하시겠습니까?")){
					let plan_seq = $("#completeBtn").val();
				 	console.log(plan_seq); 
				 	$.ajax({
						url:"/planner/planDelete"
						,type:"post"
						,data: {"plan_seq":plan_seq}
                      	,success : function(data){
                      		if(data=="success"){
                      			$(".updateModal").modal("hide");
                      			alert("일정이 삭제되었습니다.");
                      			 location.href="/planner/toPlanner?mem_seq="+mem; 
                      		}else{
                      			alert("일정 삭제에 실패했습니다.");
                      		}
                      	}
						, error : function(e){
							console.log(e);
						}
					}) 
	
				 }
				})
			});

		})
		
		();
	</script>
</body>
</html>























