<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"
></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"
></script>
<title>통계</title>
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

.container {
	width: 1000px;
	
}

/* 바디 영역 */
.bodyContainer .row {
	margin-top: 20px;
}

.totalDiv>* {
	font-family: "AppleSDGothicNeoB.ttf";
	font-size: 24px;
}

.totalDiv>span {
	font-size: 23px;
	color: rgb(8, 0, 83);
	font-family: "AppleSDGothicNeoL.ttf";
}

#viewTime {
	width: 20%;
}

.message_box {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

.sbujectTime {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 20px;
	margin-left:-80px;
	padding-top:30px;
}

.weekTime {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 20px;
	padding-top:30px;
}
#chartDiv{
	background-color: rgb(3, 0, 58);
	color:white;
	border-radius:15px;

}
</style>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="study_banner">
			<p class="main_text">나의 공부시간🕒</p>
		</div>
		<p class="message_box">
			스터디헬퍼에서 공부하면 나의 누적 공부시간을 확인할 수 있어요<br> 과목별로 공부한 시간을 확인해서 부족한 과목 공부를 체크하고, 이번주엔 얼마나 공부했는지 확인할
			수 있어요. <br>
		</p>
		<br>
	</div>
	<!-- 바디 시작 -->
	<div class="container">
		<div class="row bodyContainer">
			<select class="form-select" id="viewTime">
				<option value="hour">시간으로 보기</option>
				<option value="min">분으로 보기</option>
				<option value="sec" selected>초로 보기</option>
				<option value="totalToday">시 분 초로 보기</option>
			</select>
			<div class="row" id="recordDiv">
				<div class="col-12 col-lg-5 totalDiv" id="todayDiv">
					<h3>오늘 총 공부시간</h3>
					<c:choose>
						<c:when test="${empty countList}">
							<span id="todaySpan">오늘 공부한 기록이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<span id="todaySpan">${dayTotalTime} 초</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-12 col-lg-7 totalDiv" id="weekDiv">
					<h3>이번주 총 공부시간</h3>
					<c:choose>
						<c:when test="${empty weekList}">
							<span id="weekSpan">이번주에 공부한 기록이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<span id="weekSpan">${weekTotalTime} 초</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row" id="chartDiv">
				<div class="col-12 col-lg-5 text-center" id="pieDiv">
					<p class="sbujectTime">과목별 공부시간📚</p>
					<canvas id="chartPie"></canvas>
				</div>
				<div class="col-12 col-lg-7 text-center" id="lineDiv">
					<p class="weekTime">주간 공부 그래프📈</p>
					<canvas id="chartLine" height="200"></canvas>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script>
		$(document).ready(function(){
			let weekList = "${weekList}";
			weekList = weekList.replace(/[\[\]]/g, "");
			weekList = weekList.split(",");
			/* console.log(weekList); */
			
			let lastWeekList = "${lastWeekList}";
			lastWeekList = lastWeekList.replace(/[\[\]]/g, "");
			lastWeekList = lastWeekList.split(",");
			
			let subjectList = "${subjectList}";
			/* console.log(subjectList); */
			subjectList = subjectList.replace(/[\[\]]/g, "");
			subjectList = subjectList.split(",");
			/* console.log(subjectList); */
			
			let countList = "${countList}";
			/* console.log(countList); */
			countList = countList.replace(/[\[\]]/g, "");
			countList = countList.split(",");
			/* console.log(countList); */
			
			if(subjectList.length == 1 && subjectList[0] == ""){
				subjectList = ["공부시간 없음"];
			}
			
			if(countList.length == 1 && countList[0] == ""){
				countList = [1];
			}
			
			// make random color
			let getColor = function() {
				var rgb1 = Math.floor(Math.random() * (255 + 1));
				var rgb2 = Math.floor(Math.random() * (255 + 50));
				var rgb3 = Math.floor(Math.random() * (255 + 1));
				var strRGBA = 'rgba(' + rgb1 + ',' + rgb2 + ',' + rgb3 + ',0.3)';
				/* console.log(strRGBA); */
				return strRGBA;
			}
			
			let getColor2 = function() {
				var rgb1 = Math.floor(Math.random() * (255 + 1));
				var rgb2 = Math.floor(Math.random() * (255 + 50));
				var rgb3 = Math.floor(Math.random() * (255 + 1));
				var strRGBA = 'rgba(' + rgb1 + ',' + rgb2 + ',' + rgb3 + ',0.6)';
				/* console.log(strRGBA); */
				return strRGBA;
			}
			
			
			// random colorList
			let colorList = new Array();
			for(let i=0; i < ${subjectList.size()}; i++){
				colorList.push(getColor());
			}
			if(colorList.length == 0){
				colorList = ["rgba(255, 150, 90, 0.5)"];
			}
			
			// Pie
			// pie data
			let dataPie = {
				labels : subjectList,
				datasets : [ {
					label : '과목별 공부 시간',
					data : countList,
					backgroundColor : colorList,
					borderWidth : 2
				} ]
			}
			
			// pie option
			var optionPie = { // 파이 옵션들
				plugins: {
				    datalabels: { // data 마다 label
				        formatter: function (value, context) {
				            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
				        },
				        color: 'white',
				        font: {
				        	size: "15"
				        },
				        align: 'top',
				    },
				    tooltip: { // 마우스 호버 툴팁
				    	callbacks: { // 호버했을때 콜백
				    		label: (context) =>{
				    			if(subjectList[0] == "공부시간 없음"){
				    				return context.label;
				    			}
				    			return context.label+": "+context.formattedValue+"초";
				    		},
				    	}
				    },
				    legend: {
				    	labels: {
				    		usePointStyle: true,
				    		boxWidth: 20,
				    		fontSize: 12,
				    	},
				    	position: "right"
				    }
				}
			}

			// pie config
			var configPie = {
				type : 'pie',
				data : dataPie,
				options : optionPie,
				plugins: [ChartDataLabels]
			}
			
			// pie rander init pie
			var ctx = document.getElementById("chartPie").getContext("2d");
			const chartPie = new Chart(ctx,
					configPie);
			
			// line
			// line data
			var dataLine = {
					labels: ["월요일" , "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
					datasets : [{
						label: "이번주",
						data: weekList,
						fill: false,
						borderColor: getColor2(),
						tension: 0.4
						
					},{
						label: "저번주",
						data: lastWeekList,
						fill: false,
						borderColor: getColor2(),
						tension: 0.4
					}]
			}
			
			// line option
			var optionLine = {
					plugins: {
						legend: {
							labels: {
								usePointStyle: true,
								pointStyle: 'line',
								boxWidth: 30,
								fontSize: 12,
								fontColor: '#ffffff'
							}
						},
						tooltip: { // 마우스 호버 툴팁
					    	callbacks: { // 호버했을때 콜백
					    		label: (context) =>{
					    			return context.label+": "+context.formattedValue+"분";
					    		},
					    	}
					    },
					},
					scales: {
						y: {
							ticks: {
								min: 0,
								stepSize: 1
							}
						}
					}
			}
			
			// config
			var configLine = {
					type : "line",
					data : dataLine,
					options : optionLine
			}
			
			// line rander init line
			var ctx = document.getElementById("chartLine").getContext("2d");
			const chartLine = new Chart(ctx, configLine);
			
		})
		
		// 시 분 초로보기
		let secToday = ${dayTotalTime}
		let minToday = (secToday/60).toFixed(2);
		let hourToday = (secToday/(60*60)).toFixed(2);
		let secWeek = ${weekTotalTime};
		let minWeek = (secWeek/60).toFixed(2);
		let hourWeek = (secWeek/(60*60)).toFixed(2);
		
		
		$("#viewTime").on("change", function(){
			let value = this.value;
			if(value === "hour"){
				$("#todaySpan").html(hourToday+" 시간");
				$("#weekSpan").html(hourWeek+" 시간");
			} else if (value === "min") {
				$("#todaySpan").html(minToday+" 분");
				$("#weekSpan").html(minWeek+" 분");
			} else if (value === "sec") {
				$("#todaySpan").html(secToday+" 초");
				$("#weekSpan").html(secWeek+" 초");
			} else if (value === "totalToday"){
				$("#todaySpan").html(getTime(secToday));
				$("#weekSpan").html(getTime(secWeek));
			}
		})
		
		let getTime = function getTimeSeconds(seconds){
			let hour, min, sec
			
			hour = parseInt(seconds/3600);
			min = parseInt((seconds%3600)/60);
			sec = seconds%60;
			
			if(hour.toString().length == 1){
				hour = "0"+hour;
			}
			if(min.toString().length == 1){
				min = "0"+min;
			}
			if(sec.toString().length == 1){
				sec = "0"+sec;
			}
			
			return hour + ":" + min + ":" + sec;
		}
	</script>

</body>
</html>