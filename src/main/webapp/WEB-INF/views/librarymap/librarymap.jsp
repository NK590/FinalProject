<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3f6aa455ded38307d18f5f1d95699ff&libraries=services"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<form onsubmit="searchPlaces(); return false;">
		<input type="text" id="keyword" name="keyword" size="15">
		<button type="submit">검색</button>
	</form>
	<div id="map" style="width: 100%; height: 500px;"></div>
</body>
<script>
	//json에서 데이터 가져오기
	$(function() {
		$.getJSON("/resources/전국도서관표준데이터파싱.json",
						function(data) {
							var arr = data['result'];
							for (let i = 0; i < arr.length; i++) {
								var name = arr[i]['도서관명'];
								var addr = arr[i]['소재지도로명주소'];
								var lat = arr[i]['위도'];
								var lng = arr[i]['경도'];
								console.log(name + "" + addr + "" + lat + ""+ lng);
								//지도에 마커 표시하기
								var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
								var imageSize = new kakao.maps.Size(20, 30);
								var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
								var latlng = new kakao.maps.LatLng(lat, lng);
								var marker = new kakao.maps.Marker({
									map : map,
									position : latlng, //마커 표시할 위치
									title : name, //마커가 위치된 도서관 명(커서를 올렸을 때 표시되도록할 예정!)
									image : markerImage//마커 이미지
								})
							}
						});
		var mapContainer = document.getElementById("map");
		var mapOption = {
			center : new kakao.maps.LatLng(37.55667866460624,126.91952714001684),
			level : 8
		}
		var map = new kakao.maps.Map(mapContainer, mapOption);
	});
</script>
</html>