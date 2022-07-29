<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
@font-face {
	src: url("/resources/fonts/GothicA1-Regular.ttf");
	font-family: "GothicA1-Regular.ttf";
}
.empty{
	margin: 30px;
}
.total>a,.total>span{
	font-size: 20px;
	color: rgb(126, 183, 247);
}
.total>h4{
	margin-top: 10px;
}
.total>a{
	text-decoration : none;
}

.total>a:hover{
	font-weight: bolder;
}


#memTotalSpan{
	color: gray;
	font-size: 12px;
}
#chartDoughnut{
	width: 320px;
	height: 320px;
}
.chartDiv>h5{
	margin: 0;
}
.chartDiv{
	height: 370px;
}

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/adminHeader.jsp"%>
	<div class="container">
		<!-- 상단 방문자 틀 -->
		<div class="row">
			<div class="col-12 col-md-3 total">
				<h4>오늘 방문자 수</h4>
				<span>${totalMap.visitToday} 명</span>
			</div>
			<div class="col-12 col-md-3 total"> 
				<h4>누적 방문자 수</h4>
				<span>${totalMap.visitTotal} 명</span>
			</div>
			<div class="col-12 col-md-3 total">
				<h4>신고 목록</h4>
				<a id="reportNum" href="/admin/toBlacklist?curPage=1">${totalMap.reportTotal} </a><span>개</span>
			</div>
		</div>
		<!-- 방문자끝 -->
		<div class="empty"></div>
		<!-- 차트 시작 -->
		<div class="row">
			<div class="col-12 col-md-6 chartDiv" id="barDiv">
				<h5>회원가입 통계</h5>
				<span id="memTotalSpan">최근 1주일 기준</span>
				<canvas id="chartBar"></canvas>
			</div>
			<div class="col-12 col-md-3 chartDiv" id="doughnutDiv">
				<h5>그룹 카테고리</h5>
				<canvas id="chartDoughnut"></canvas>
			</div>
		</div>
		<!-- 차트 끝 -->
	</div>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	
	<script>
		$(document).ready(function(){
			
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
			let colorListBar = new Array();
			for(let i=0; i < ${memberJoinCount.length()}; i++){
				colorListBar.push(getColor());
			}
			if(colorListBar.length == 0){
				colorList = ["rgba(159, 150, 90, 0.5)"];
			} 
			
			let countArray = new Array();
			let memSign = new Array();
			console.log(${memberJoinCount});
			for(let joinCount of ${memberJoinCount}){
				countArray.push(joinCount.count);
				memSign.push((joinCount.mem_sign).substr(3,7));
			}
			
			// bar data
			let dataBar = {
				labels : memSign
				,datasets : [{
					label : '최근 1주일 회원가입 수'
					,data : countArray
					,backgroundColor : colorListBar
					,borderColor : colorListBar
					,borderWidth: 1
				}]	
			}
			
			// bar option
			let optionBar = {
				scales: {
					y: {
						beginAtZero: true,
						ticks: {
							stepSize: 1
						}
					}
				}
			}
			
			// bar config
			let configBar = {
				type : 'bar',
				data : dataBar,
				options : optionBar
			}
			
			var ctx = document.getElementById("chartBar").getContext("2d");
			const chartBar = new Chart(ctx, configBar);
			
			
			// doughnut 과목별 분포도
			// doughnut data
			let groupCategoryCount = ${groupCategoryCount};
			let groupCountA = new Array();
			let groupName = new Array();
			for(let groupCount of groupCategoryCount){
				groupCountA.push(groupCount.count);
				groupName.push(groupCount.std_key);
			}
			if(${groupCategoryCount.length()} == 0) {
				groupCountA.push(1);
				groupName.push("그룹없음");
			}
			
			// random colorList
			let colorListDoughnut = new Array();
			for(let i=0; i < ${groupCategoryCount.length()}; i++){
				colorListDoughnut.push(getColor());
			}
			if(groupCategoryCount.length == 0){
				colorListDoughnut = ["rgba(159, 150, 90, 0.5)"];
			} 
			
			 let dataDoughnut = {
				labels : groupName,
				datasets : [ {
					label : '카테고리 분포도',
					data : groupCountA,
					backgroundColor : colorListDoughnut,
					borderWidth : 2
				} ]
			} 
			
			// doughnut option
			var optionDoughnut = { // 도넛 옵션들
				plugins: {
					legend: {
						labels: {
							usePointStyle: true,
							boxWidth: 20,
							fontSize: 12
						},
						position: "right"
					},
					tooltip: {
						callbacks: {
							label: (context) => {
								return context.label+": "+context.formattedValue.toString().toLocaleString("ko-KR")+"개";
							}
						}
					},
					datalabels: { // data 마다 label
				        formatter: function (value, context) {
				            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
				        },
				        color: 'black',
				        font: {
				        	size: "15"
				        },
				        align: 'top',
				    }
				}
			}

			// doughnut config
			var configDoughnut = {
				type : 'doughnut',
				data : dataDoughnut,
				options : optionDoughnut,
				plugins: [ChartDataLabels]
			}
			
			// doughnut rander init pie
			var ctx = document.getElementById("chartDoughnut").getContext("2d");
			const chartPie = new Chart(ctx,
					configDoughnut);
			
		})
		
	</script>
	
</body>
</html>