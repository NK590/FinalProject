<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<title>통계</title>
</head>
<style>
@font-face {
	src: url("/resources/fonts/GothicA1-Regular.ttf");
	font-family: "GothicA1-Regular.ttf";
}

.container {
	width: 1000px;
}

/* 바디 영역 */
.bodyContainer .row {
	margin-top: 20px;
}


.totalDiv>*{
font-family: "GothicA1-Regular.ttf";
}

.totalDiv>span{
font-size: 25px;
color: orange;
}


</style>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	<div class="container">
		<!-- 바디 시작 -->
		<div class="row bodyContainer">
			<div class="row" id="recordDiv">
				<div class="col-12 col-lg-5 totalDiv">
					<h3>오늘 총 공부시간</h3>
					<c:choose>
						<c:when test="${empty countList}">
							<span>오늘 공부한 기록이 없습니다.</span>
						</c:when>
						<c:otherwise>
							<span>${dayTotalTime} 분</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-12 col-lg-7 totalDiv">
					<h3>이번주 총 공부시간</h3>
					<c:choose>
						<c:when test="${empty weekList}">
							<h3>이번주에 공부한 기록이 없습니다.</h3>
						</c:when>
						<c:otherwise>
							<span>${weekTotalTime} 분</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row" id="chartDiv">
				<div class="col-12 col-lg-5 text-center" id="pieDiv">
					<h4>과목별 공부시간</h4>
					<canvas id="chartPie"></canvas>
				</div>
				<div class="col-12 col-lg-7 text-center" id="lineDiv">
					<h4>주간 공부 그래프</h4>
					<canvas id="chartLine"></canvas>
				</div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
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
				        color: 'black',
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
				    			return context.label+": "+context.formattedValue+"분";
				    		},
				    	}
				    },
				    legend: {
				    	labels: {
				    		usePointStyle: true,
				    		boxWidth: 20,
				    		fontSize: 12
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
								fontSize: 12
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
								min: 0
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
		
		
	</script>

</body>
</html>