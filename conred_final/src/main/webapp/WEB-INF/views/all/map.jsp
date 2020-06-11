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
	#rightbox{z-index:10;background-color:lightblue;opacity:0.5; border-top-width:0px; border-bottom-width:0px; width:390px;height:auto;position:absolute;right:0px;}
	.storelist{z-index:10;background-color:white;width:auto;height:140px;border:1px solid grey;margin:10px;}
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
		$('#container').css("height",$bodyH);
		$('#mapbox').css("height",$bodyH);
		$('#show').css("height",$bodyH);
		
		var $bodyW = window.innerWidth-405;
		$('#mapbox').css("width",$bodyW);
	}
	$(document).ready(function(){
		divToFit();
		$(window).resize(function() {
			divToFit();
	    });
	});
// 	$(function() {
// 		divToFit();
// 	});
</script>
</head>
<body>
<div id="container">
	
	<div id="mapbox">
<!-- 	지도용 스크립트 -->
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	<script>
		var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
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
		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	    
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
		
		
		
	</script>
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
