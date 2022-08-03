<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous"
>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=349d86361dd700855e6b4d0b28aacfa9&libraries=clusterer"
	></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<title>지역별 도서관 찾기</title>
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

.map_banner {
	font-family: "AppleSDGothicNeoL.ttf";
	font-size: 17px;
}

.main_text {
	font-size: 25px;
	font-family: "AppleSDGothicNeoB.ttf";
}

body {
	box-sizing: border-box;
	overflow-x: hidden;
}

#map {
	width: 100%;
	height: 500px;
	text-align: center;
	margin-top: 20px;
}

.message_box {
	font-size: 17px;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div class="container">
		<div class="map_banner">
			<p class="main_text">지역별 도서관 찾기📚</p>
		</div>
		<p class="message_box">
			공부하기에 최적의 장소인 도서관 정보를 찾아드려요 <br>지역을 확대하거나 클릭하면 해당 위치의 도서관의 정보를 볼 수 있습니다.
		</p>
	</div>
	<div id="map"></div>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

	<script>
					const url = "/resources/map/lib.json";
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center: new kakao.maps.LatLng(37.5663, 126.9779), // 지도의 중심좌표
							level: 12, // 지도의 확대 레벨
							mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
						};
					// 지도를 생성한다 
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 마커 클러스터러를 생성합니다 
					var clusterer = new kakao.maps.MarkerClusterer({
						map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
						averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
						minLevel: 10 // 클러스터 할 최소 지도 레벨 
					});
				
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
						return function () {
							infowindow.open(map, marker);
						};
					}

					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function () {
							infowindow.close();
						};
					}
					fetch(url)
						.then((res) => res.json())
						.then((myJson) => {
							var markers = []; //마커 담는 객체 생성 
							const position = myJson.position;
							for (var i = 0; i < position.length; i++) {
								var marker = new kakao.maps.Marker({
									position: new kakao.maps.LatLng(
										position[i]["lat"],
										position[i]["lng"]
									),
								});
								//인포윈도우를 생성합니다
								var iwRemoveable = true;
								var infowindow = new kakao.maps.InfoWindow({
									removable: iwRemoveable,
									content: position[i]["name"] +
										"<br>" +
										position[i]["addr"] +
										"<br>" +
										"휴관일 : "+
										position[i]["closedDay"] +
										"<br>" +
										"평일운영시간 : " +
										position[i]["weekdayStart"] +
										"~" +
										position[i]["weekdayEnd"] +
										"<br>" +
										"토요일운영시간 : " +
										position[i]["satStart"] +
										"~" +
										position[i]["satEnd"] +
										"<br>" +
										"<br>"

								});
								markers.push(marker);
								kakao.maps.event.addListener(
									marker,
									"mouseover",
									makeOverListener(map, marker, infowindow)
								);
								kakao.maps.event.addListener(
									marker,
									"mouseout",
									makeOutListener(infowindow)
								);
							}
							clusterer.addMarkers(markers);
						});
				</script>
</body>
</html>