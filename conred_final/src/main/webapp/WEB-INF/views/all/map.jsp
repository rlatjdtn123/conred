<jsp:include page="../all/header_map.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body{margin:0px;padding:0px;}
	#container{height:100%;overflow: auto;}
	#mapbox{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:100%;height:100%;position:absolute;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#show{z-index:10;width:407.5px;height:90.5%;position:absolute;right:0px;overflow: auto;}
	#rightbox{z-index:10;background-color: rgba( 255, 255, 255, 0.8 ); border-top-width:0px; border-bottom-width:0px; width:390px;height:auto;position:absolute;right:0px;}
	.storelist{z-index:9;background-color:white;width:auto;height:140px;border:1px solid #dedede;margin:10px;position: relative;padding:10px;}
	.storelist:hover{cursor: pointer;}
	
	#mapbarbox{background-color:white; z-index:10;box-shadow: 0px 0.5px 1.5px grey;overflow:auto; width:300px;height:200px;border:1px solid grey;position:absolute;left:20px;top:20px;}
	#search{padding:10px;width:280px;position:absolute;left:8px;}
	#searchbar{width:220px;}
	#searchbtn{padding:3px;width:40px;height:35px;}
	#magnifyglass{width:20px;}
	#mapcategory{top:50px;position:relative;}
	#categorybox{margin:0 auto; width:280px; overflow:auto;overflow-y: hidden; padding:10px;}
	.categories:first-child{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:0px;}
	.categories{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:20px;}

/* 	맵 */
	.markerbox{height:100px;width:200px;border:1px solid grey; border-radius:8px;}
</style>
<script type="text/javascript">
	function divToFit() {
		var $bodyH = window.innerHeight-90;
// 		$('#container').css("height",$bodyH);
		$('#mapbox').css("height",$bodyH);
		$('#show').css("height",$bodyH);
		
// 		var $bodyW = window.innerWidth-405;
		var $bodyW = window.innerWidth;
// 		$('#container').css("width",$bodyW);
		$('#mapbox').css("width",$bodyW);
	}
	$(document).ready(function(){
		divToFit();
		$(window).resize(function() {
			divToFit();
	    });
	});
</script>
</head>
<body>
<div id="container">

<!-- 	<div id="mapbox" style="width:1500px;height:830px;"> -->
	<div id="mapbox">
		<div id="mapbarbox">
		
			<form id="search">
			  <input type="text" id="searchbar" class="form-control pull-left" placeholder="지역명, 지하철역, 매장명 검색">
			  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
			</form>
			
			<div id="mapcategory">
				<div id="categorybox">
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
				</div>
				<div id="categorybox">
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
					<div class="categories"><input type="checkbox"></div>
				</div>
			</div>
		</div>
	</div>
<!-- 	<div id="mapbox"> -->
<!-- 	지도용 스크립트 -->
<!-- 	<div id="map" style="width:2000px;height:800px;"></div> -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
// 			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			center: new kakao.maps.LatLng(37.525026023695375, 126.8888353907293), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		//마커이미지관련정보
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    // 마커가 표시될 위치입니다 
// 		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
		var markerPosition  = new kakao.maps.LatLng(37.525026023695375, 126.8888353907293); 
	    
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition, 
		    image: markerImage // 마커이미지 설정
		});

		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
		var iwContent = '<div class="markerbox" style="padding:5px;">댕댕미용실</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : iwContent,
		    removable : iwRemoveable
		});
		    
		  
		// 마커에 마우스오버 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseover', function() {
		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
		    infowindow.open(map, marker);
		});

		// 마커에 마우스아웃 이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		
		// 마커에 클릭이벤트를 등록합니다
		kakao.maps.event.addListener(marker, 'click', function() {
				alert("이거 누르면 옆에 리스트에서 해당 매장의 백그라운드컬러가 변하게");
		      // 마커 위에 인포윈도우를 표시합니다
		      infowindow.open(map, marker);  
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		function getInfo() {
		    // 지도의 현재 중심좌표를 얻어옵니다 
		    var center = map.getCenter(); 
		    
		    // 지도의 현재 레벨을 얻어옵니다
		    var level = map.getLevel();
		    
		    // 지도타입을 얻어옵니다
		    var mapTypeId = map.getMapTypeId(); 
		    
		    // 지도의 현재 영역을 얻어옵니다 
		    var bounds = map.getBounds();
		    
		    // 영역의 남서쪽 좌표를 얻어옵니다 
		    var swLatLng = bounds.getSouthWest(); 
		    
		    // 영역의 북동쪽 좌표를 얻어옵니다 
		    var neLatLng = bounds.getNorthEast(); 
		    
		    // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
		    var boundsStr = bounds.toString();
		    
		    
		    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
		    message += '경도 ' + center.getLng() + ' 이고 <br>';
		    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
		    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
		    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
		    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
		    
		    
		    alert(message);
		    console.log(message);
		    // 개발자도구를 통해 직접 message 내용을 확인해 보세요.
		    // ex) console.log(message);
		}

		// 		드래그끝나면 실행1
// 		kakao.maps.event.addListener(map, 'dragend', function () {        
// 		});

// 		드래그끝나면 실행2
		kakao.maps.event.addListener(map, 'dragend', getInfo, true);             

// 		영역 변경시 실행1 -->해당영역안에 가게가 있을경우 보여주는 기능 할 때 쓰자
// 		kakao.maps.event.addListener(map, 'bounds_changed', function() {             
// 		});

// 		클릭시 실행1 -->클릭으로 손쉽게 db에 넣어줄 주소 가져와주자 ★그외엔아마 필요없을듯★
// 		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
// 		});
		
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latlng = mouseEvent.latLng;
	    
	    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
	    message += '경도는 ' + latlng.getLng() + ' 입니다';
	    
	    var resultDiv = document.getElementById('result'); 
// 	    resultDiv.innerHTML = message;
	    alert(message);
// 	    37.525140657539495 이고, 경도는 126.89099029962803 
	});
	
	// 타일 로드가 완료되면 지도 중심에 마커를 표시합니다
	kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);

	function displayMarker() {
	    
	    // 마커의 위치를 지도중심으로 설정합니다 
	    marker.setPosition(map.getCenter()); 
	    marker.setMap(map); 

	    // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
	    // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
	    // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
	}
	</script>

	<div id="show">
		<div id="rightbox">
										<!-- location.href='store.do?store_seq=__'<- 원래 여기는 화면안의 seq를 각각 넣어줘야한다. -->
			<div class="storelist" onclick="location.href='store.do?store_seq=23'">
			(임시 윤호가 테스트로 쓰는 매장 seq23)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=1'">
			(임시 1번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=2'">
			(임시 2번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=3'">
			(임시 3번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=4'">
			(임시 4번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=5'">
			(임시 5번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=6'">
			(임시 6번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=7'">
			(임시 7번사장의 매장)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=8'">
			(임시 8번사장의 매장)
			</div>
		</div>
	</div>
</div>
</body>
</html>
