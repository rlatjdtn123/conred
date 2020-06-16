<jsp:include page="../all/header_map.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
 <script src="//code.jquery.com/jquery-1.12.4.js"></script>
 <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
	body{margin:0px;padding:0px;}
	#container{height:100%;overflow: auto;}
	#mapbox{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:100%;height:100%;position:absolute;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#show{z-index:10;width:408.5px;height:90.5%;position:absolute;right:0px;overflow: auto;}
	#rightbox{z-index:10;background-color: rgba( 255, 255, 255, 1 ); border:0px solid grey;border-top-width: 1px;border-left-width:1px; width:390px;height:auto;min-height:100%;position:absolute;top:35px;border-radius: 10px 10px 0px 0px;}
	.storelist{z-index:9;background-color:rgba( 255, 255, 255, 1);width:auto;height:170px;border:1px solid #dedede;margin:10px;position: relative;padding:10px;}
	.storelist:hover{cursor: pointer;background-color: #f2f2f2;border:1px solid black;}
	.righthider{position:fixed;	width: 390px; display: inline-block; height: 36px; right: 19px; border:1px solid grey;
    border-top-width:0px; background-color: rgba( 255, 255, 255, 1 ); top:90px; cursor: pointer; border-radius: 0px 0px 10px 10px; z-index:50;}
	.righthider2{position:fixed; width: 85px; display: inline-block; height: 100px; right: 408px; border:1px solid grey;
    border-right-width:0px; background-color: rgba( 255, 255, 255, 1 ); top:101px; cursor: pointer; border-radius: 20px 0px 0px 20px; z-index:50;}
	.righthider:hover{border:1px solid black;border-right-width:0px;border-top-width:0px;}

/* 	.arrow_next{margin-top:42px;margin-left: 13px;background: url("./img/next.png");} */
	.arrow_down{margin:0 auto;margin-top:5px;background: url("./img/down.png");background-size: contain; width: 25px;height: 25px;}
	.arrow_up{margin:0 auto;margin-top:5px;background: url("./img/up.png");background-size: contain; width: 25px;height: 25px;}
	.right_hide{}
	.right_show{}
	
	#mapbarbox{background-color:white; z-index:10;box-shadow: 0px 0.5px 1.5px grey;overflow:auto; width:300px;height:200px;border:1px solid grey;position:absolute;left:20px;top:20px;}
	#search{padding:10px;width:280px;position:absolute;left:8px;}
	#searchbar{width:220px;}
	#searchbtn{padding:3px;width:40px;height:35px;}
	#magnifyglass{width:20px;}
	#mapcategory{top:50px;position:relative;}
	#categorybox{margin:0 auto; width:280px; overflow:auto;overflow-y: hidden; padding:10px;}
	.categories:first-child{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:0px;}
	.categories{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:20px;}

	.photobox{box-shadow: 1px 1.5px 2px grey;background-color: grey;width:140px; height:105px;float: left;margin-right:2px;
	background-size: cover; 
/* 	background-size: 140px 100px; */
	background-repeat: no-repeat;}
	.storestate{display: inline-block;width: 40px;height: 25px; float: right;font-size: 12px;text-align: right;}
	.storename{display: inline-block;width: 155px;height: 25px; float: left;font-size: 20px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
	}
/* 	.storename:hover{white-space: nowrap;} */
	span.tooltiptext {
		visibility: hidden;
		opacity:0;
		transition:visibility 0.2s linear,opacity 0.2s linear;
		transition-delay: 1s;
		width: 300px;
		background-color: #fff;
		border: 1px solid #f2f2f2;
		box-shadow:0px 1px 1px grey;
		color:#000;
		text-align: center;
		border-radius: 6px;
		padding: 5px 0;
		position: absolute;
		z-index: 1;
		transform: translate(-50%, -50%);
		bottom: 65%;
		left: 50%;
	}
	.storename:hover span.tooltiptext {
	  visibility: visible;
	   opacity:1;
	}
	.medal{display: inline-block;width: 25px;height: 23px; float: left;font-size: 11px;margin-top:2px;}
	.star{display: inline-block;width: 25px;height: 23px; float: left;margin-top:1px;}
	.review{display: inline-block;width: 60px;height: 25px; float: left;font-size: 20px;margin-top:2px;}
	.cate_big{display: inline-block;width: 205px;;height: 18px; float: left;font-size: 15px;margin-top:2px;font-weight:bold;}
	.cate_small{display: inline-block;width: 205px;height: 29px; float: left;font-size: 11px;margin-top:2px;}
	
	.intro{display: inline-block;width: 345px;height: 17px; float: left;font-size: 13px;margin-top:2px;}
	.storephone{display: inline-block;width: 80px;height: 15px; float: right;font-size: 12px;margin-top:5px;text-align: right;}
	.address{display: inline-block;width: 250px;height: 15px; float: left;font-size: 13px;margin-top:5px;}
	.storetime{display: inline-block;width: 200px;height: 20px; float: left;font-size: 14px;margin-top:5px;}
	.reservebtn{z-index:100;display: inline-block;width: 60px;height: 20px; float: right;font-size: 14px;margin-top:5px;text-align: center;background-color: #9FF781;border-radius: 10px;color:white;transition: all 0.3s;line-height: 20px;}
	.reservebtn:hover{background-color: #58D3F7;font-size: 16px;line-height: 20px}
	.storetime_today{z-index:100;display: inline-block;position: absolute;left: 80px;width:150px;border-radius:5px;padding-left:5px;}
	.storetime_today:hover{background-color: #fff;}
	.storetime_other{visibility:hidden;background-color: #fff;display: inline-block;position: absolute; right: 0px; bottom: 2px;width: 145px;border: 1px solid #f2f2f2;border-radius: 5px;padding: 5px;box-shadow: 0px 1px 2px grey;}
/* 	visibility:hidden; */
	.s_state_color1{color:#3ADF00;}
	.s_state_color2{color:#FF8000;}
	.s_state_color3{color:#FE2E2E;}
/* 	맵 */
	.markerbox{height:100px;width:200px;border:1px solid grey; border-radius:8px;}
	.icon_info{
	display: inline-block;
    position: relative;
    background-color: #f2f2f2;
    width: 170px;
    height: 80px;
    border-radius: 5px;
    padding: 5px;
    border: 1px solid grey;}
	.icon_text{} 

</style>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bc283bd41dff040b5403d29f3172b43a&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

	function divToFit() {
		var $bodyH = window.innerHeight-90;
// 		$('#container').css("height",$bodyH);
		$('#mapbox').css("height",$bodyH);
		$('#show').css("height",$bodyH);
		
// 		var $bodyW = window.innerWidth-405;
		var $bodyW = window.innerWidth-19;
// 		$('#container').css("width",$bodyW);
		$('#mapbox').css("width",$bodyW);
// 		$(".righthider").css("top",$bodyH/2+45);
	} 
	$(document).ready(function(){
		
		
		ajax_cate();
		kakao.maps.event.addListener(map, 'dragend', function () {       
			ajax_cate();
		});
		
		function ajax_cate() {
			
// 		(2번방법)	영역정보를 ajax로 전달해서 모든세부값 가져오기	
	    var bounds = map.getBounds();// 지도 영역정보를 얻어옵니다 
	    var sw = bounds.getSouthWest();// 영역정보의 남서쪽 정보를 얻어옵니다 
	    var ne = bounds.getNorthEast();// 영역정보의 북동쪽 정보를 얻어옵니다 
	    var nelat=ne.getLat();
	    var nelng=ne.getLng();
	    var swlat=sw.getLat();
	    var swlng=sw.getLng();
// 	    alert(nelat);
// 	    alert(nelng);
// 	    alert(swlat);
// 	    alert(swlng);
	    var category_code = '<c:out value="${category_code}"/>';
// 	    alert("카테고리 : "+category_code);
	// 		드래그끝나면 실행1
			$.ajax({
				url:"searchCateAll_ajax.do",
				method:"post",
				dataType: "json",
				async: false,
				data:{"category_code":category_code,"nelat":nelat,"nelng":nelng,"swlat":swlat,"swlng":swlng},
				success:function(obj) {
// 					if('' || null || undefined || 0 || NaN){

					if(obj.list!=null){
					console.log(obj);
					var store_lists = obj.list;
					var photo_lists = obj.photolist;
					var cate_lists = obj.catelist;
					var stime_lists = obj.stimelist;
					var sloca_lists = obj.slocalist;
					var today = obj.today;
					var store_detail;
					var rb =$("#rightbox");
					
					$(".storelist").remove();
						$.each(store_lists, function(i){
							var store_state="";
							if (store_lists[i].store_state==='O') {
								store_state='<div class="storestate s_state_color1"><b>영업중</b></div>';
							}else if (store_lists[i].store_state==='B') {
								store_state='<div class="storestate s_state_color2"><b>휴업중</b></div>';
							}else if (store_lists[i].store_state==='C') {
								store_state='<div class="storestate s_state_color3"><b>폐점</b></div>';
							}
							store_detail=
								'<div class="storelist" onclick="event.stopPropagation(); location.href=\'store.do?store_seq='+store_lists[i].store_seq+'\'">'+
											'<div class="photobox" style="'+
											'background: url(\'./upload_sphoto/'+photo_lists[i].store_photo_stored+'\');'+
											'background-size: 140px 105px;'+
// 											'background-size: contain;'+
										    'background-repeat: no-repeat;"></div>'+//사진:단일
											store_state+
											'<div class="storename">'+store_lists[i].store_name+'<span class="tooltiptext">'+store_lists[i].store_name+'</span></div>'+
											'<div class="review"><img class="star" alt="" src="./img/star_fill.png">'+photo_lists[i].all_avg+'</div>'+//평균(매장사진이랑 같이 가져오기)
											'<div class="medal"><img class="medal" alt="" src="./img/gold.png"></div>'+
											'<div class="cate_big">'+store_lists[i].category_name+'</div>'+//대표카테고리
											'<div class="cate_small">'+cate_lists[i]+'</div>'+//세부카테고리--------------따로1
											'<div class="storephone">'+store_lists[i].store_phone+'</div>'+//전화번호
											'<div class="address">'+store_lists[i].store_address+'</div>'+//주소
											'<div class="storetime">영업시간:'+
												'<div class="storetime_today"></div>'+
												'<div class="storetime_other"></div>'+
											'</div>'+//영업시간--------------따로2
											'<div class="reservebtn" onclick="event.stopPropagation(); location.href=\'user_store_reserve.do?store_seq='+store_lists[i].store_seq+'&store_name='+store_lists[i].store_name+'\'">예약</div>'+
										'</div>';
							
							rb.append(store_detail);
							
						});
						$.each(store_lists, function(i){//매장 개수
							var stime="";
							var stimeArray= new Array();
							$.each(stime_lists, function(j) {//전체 요일 개수
								if (stime_lists[j].store_seq==store_lists[i].store_seq) {
									var stime=""
									stime=
									stime_lists[j].store_time_day+' '+
									stime_lists[j].store_time_open+' ~ '+
									stime_lists[j].store_time_close
									stimeArray.push(stime);
								}
							});
							console.log(i+"번째 매장"+stimeArray);
							$(".storelist").eq(i).find($(".storetime_today")).append(stimeArray[today===0?7:today-1]);
							$(".storelist").eq(i).find($(".storetime_other")).append(stimeArray);
							
// 							$(".storetime_today").eq(i).hover(function() {
// //					 			$(".storetime_other").slideDown(500);
// 								$(".storetime_other").eq(i).removeAttr("style");
// 								$(".storetime_other").eq(i).css("visibility","visible");
// 								$(".storetime_today").eq(i).css("z-index","0");
// 							}, function() {
// // 								$(".storetime_today").eq(i).removeAttr("style");
// 								$(".storetime_today").eq(i).css("z-index","100");
// 								$(".storetime_other").eq(i).css({"visibility":"hidden","z-index":"100"});
// 							});
							$(".storetime_today").eq(i).mouseover(function() {
//					 			$(".storetime_other").slideDown(500);
								$(".storetime_other").eq(i).removeAttr("style");
								$(".storetime_other").eq(i).css("visibility","visible"); 
								$(".storetime_today").eq(i).css("z-index","0");
							});
							$(".storetime_today").eq(i).mouseout(function() {
// 								$(".storetime_today").eq(i).removeAttr("style");
								$(".storetime_today").eq(i).css("z-index","100");
								$(".storetime_other").eq(i).css({"visibility":"hidden","z-index":"100"});
							});
						});
						
	// 				alert("성공쓰");
					
					
					// 주소-좌표 변환 객체를 생성합니다
// 					var geocoder = new kakao.maps.services.Geocoder();
					
					for (var i = 0; i < store_lists.length; i++) {
					     var coords = new kakao.maps.LatLng(sloca_lists[i].store_latitude, sloca_lists[i].store_longitude);
					 		
					     // 마커 이미지의 이미지 주소입니다
// 	 					 var imageSrc = './img/icon/icon_map_'+store_lists[i].category_code+'.png'; 
	 					 var imageSrc = './img/icon/temp2.png'; 
// 	 					 var imageSrc = './img/icon/icon_'+store_lists[i].category_code+'.png'; 
							
//	 					 // 마커 이미지의 이미지 크기 입니다
	 					 var imageSize = new kakao.maps.Size(45, 45); 
// 	 					 var imageSize = new kakao.maps.Size(24, 35); 
							    
//	 					 // 마커 이미지를 생성합니다    
					     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
							 
					     
					     // 마커를 생성합니다
					     var marker = new kakao.maps.Marker({
					         map: map, // 마커를 표시할 지도
					         position: coords, // 마커를 표시할 위치
					         image : markerImage // 마커 이미지 
					     });
					     marker.setMap(map);
					     
					     var content = '<div class="icon_info"><span class="icon_text">'+store_lists[i].store_name+'</span></div>';
					     var customOverlay = new kakao.maps.CustomOverlay({
					    	    position: coords,
					    	    content: content,
					    	    xAnchor: 0.5,
					    	    yAnchor: 1.5,
					    	    clickable: true
					    	});
						// 커스텀 오버레이를 지도에 표시합니다
						 customOverlay.setMap(map);
// 						 customOverlay.setMap(null);
						 customOverlay.setVisible(false);
						
// 						 var closeOverlay = function() {
// 							    overlay.setMap(null);
// 							};

						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
//						    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
//						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, customOverlay));
						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(customOverlay));
// 						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
// 						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
						}	
						
// 						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
// 						function makeOverListener(map, marker, customOverlay) {
// 						    return function() {
// // 						    	customOverlay.open(map, marker);
// 						    	selectedOverlay.setMap(map);
// 						    };
// 						}
						
// 						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
// 						function makeOutListener(customOverlay) {
// 						    return function() {
// // 						    	customOverlay.close();
// 						    	customOverlay.close();
// 						    };
// 						}
					
					// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
// 						var positions = [
// 						    {
// 						        content: '<div>'+store_lists[i].store_name+'</div>', //여기에 매장명
// 						        latlng: new kakao.maps.LatLng(37.52715863724557, 126.89070453681288)
// 						    },
// 						    {
// 						        content: '<div>냥냥병원</div>', 
// 						        latlng: new kakao.maps.LatLng(37.526069654538986,126.89204104672005)
// 						    },
// 						    {
// 						        content: '<div>댕대카페</div>', 
// 						        latlng: new kakao.maps.LatLng(37.52412298508234,126.89148953463733)
// 						    },
// 						    {
// 						        content: '<div>냥냥카페</div>',
// 						        latlng: new kakao.maps.LatLng(37.52433501365076,126.88699811386819)
// 						    }
// 						];
						
// 						// 마커 이미지의 이미지 주소입니다
// 						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						
// 						for (var i = 0; i < positions.length; i ++) {
// 						 // 마커 이미지의 이미지 크기 입니다
// 						    var imageSize = new kakao.maps.Size(24, 35); 
						    
// 						    // 마커 이미지를 생성합니다    
// 						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    
// 						    // 마커를 생성합니다
// 						    var marker = new kakao.maps.Marker({
// 						        map: map, // 마커를 표시할 지도
// 						        position: positions[i].latlng, // 마커를 표시할 위치
// 						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
// 						        image : markerImage // 마커 이미지 
// 						    });
// 						    // 마커에 표시할 인포윈도우를 생성합니다 
// 						    var infowindow = new kakao.maps.InfoWindow({
// 						        content: positions[i].content // 인포윈도우에 표시할 내용
// 						    });

// 						    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
// 						    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
// 						    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
// 						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
// 						    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
// 						}	
						
// 						// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
// 						function makeOverListener(map, marker, infowindow) {
// 						    return function() {
// 						        infowindow.open(map, marker);
// 						    };
// 						}
						
// 						// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
// 						function makeOutListener(infowindow) {
// 						    return function() {
// 						        infowindow.close();
// 						    };
// 						}
					}else if (obj.list==null){
						$(".storelist").remove();
						$("#rightbox").append("<div class='storelist' style='height:100%'>----------현재 지역에서 검색되는 결과가 없습니다----------</div>");
					}
	
				},
				error: function(request,error) {
					$(".storelist").remove();
					$("#rightbox").append("<div class='storelist' style='height:100%'>----------현재 지역에서 검색되는 결과가없습니다----------</div>");
					alert("서버통신실패!!"+request.status+","+error);
				}
			});
		}
	
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, customOverlay) {
		    return function() {
// 		    	$(".storelist").removeAttr("style");
// 			    	customOverlay.open(map, marker);
// 		    	customOverlay.setMap(map);
// 				setTimeout(function() {
		    		customOverlay.setVisible(true);
		    		var icon_name=customOverlay.a.innerText;
		    		for (var i = 0; i < $(".storelist").length; i++) {
						var right_name =$(".storelist").eq(i).find(".storename").find(".tooltiptext").text();		    			
						if(right_name===icon_name){
							$(".storelist").eq(i).css({"background-color":"#f2f2f2","border":"1px solid black"});
// 					        var offset = $(".storelist").eq(i).offset();
					        var position = $(".storelist").eq(i).position();
// 					        $('html, body').animate({scrollTop : offset.top}, 400);
// 					        $("#rightbox").animate({scrollTop : position.top}, 400);
					        $("#show").stop().animate({scrollTop : position.top}, 400);
						}
					}
		    		console.log(customOverlay.a.innerText);
		    		console.log(customOverlay);
// 			    }, 350 );
// 		    	customOverlay.setVisible(true);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(customOverlay) {
		    return function() {
//			    	customOverlay.close();
// 		    	customOverlay.setMap(null);
// 				setTimeout(function() {
		    		customOverlay.setVisible(false);
		    		$(".storelist").removeAttr("style");
// 					$(".storelist").css({"background-color":"rgba( 255, 255, 255, 1)","border":"1px solid #dedede"});
// 					$(".storelist:hover").css({"background-color":"#f2f2f2","border":"1px solid black"});
// 			    }, 350 );
// 		    	customOverlay.setVisible(false);
		    };
		}
		
		function makeOverListener2(map, marker, customOverlay){
		    return function() {
		    	customOverlay.setVisible(true);
		    };
	    }
		function makeOutListener2(customOverlay){
		    return function() {
		    	customOverlay.setVisible(false);
		    };
	    }
		
		$(".storelist").hover(function() {
		}, function() {
// 			alert("ㅇ");
		});
	    /*  실패한버전 (1번방법)
	    var bounds = map.getBounds();// 지도 영역정보를 얻어옵니다 
	    var sw = bounds.getSouthWest();// 영역정보의 남서쪽 정보를 얻어옵니다 
	    var ne = bounds.getNorthEast();// 영역정보의 북동쪽 정보를 얻어옵니다 
	    var lb = new kakao.maps.LatLngBounds(sw, ne);//영역저보 저장
		
	    var inbound = new Object();
	    var list1 = new Array();
	    <c:forEach items="${list}" var="item" varStatus="i">
 			list1=[];
	    	list1.push("${item.store_seq}");
	    	list1.push("${item.category_code}");
	    	list1.push("${item.store_address}");
	    	inbound["num_${i.index}"] = list1;
	    </c:forEach>
	    
		var store_seq;
		var category_code;
		var store_address;
	    for(i in inbound){
// 	    	console.log(inbound[i][0]);
// 	    	console.log(store_seq);
// 	    	console.log(inbound[i][1]);
// 	    	console.log(inbound[i][2]);
			var store_seq=inbound[i][0];
			var category_code=inbound[i][1];
			var store_address=inbound[i][2];
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			var bool=false;
//         	console.log(inbound[i][0]+inbound[i][2]);

			// 주소로 좌표를 검색합니다
	// 		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
			geocoder.addressSearch(inbound[i][2], function(result, status) {
				
        	console.log(inbound[i][0]+inbound[i][2]);
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        //한번씩 돌면서 contain을 실행해서 true인 것만 반환해서 배열에 저장
			        if(lb.contain(coords)==true){//지역에대한 좌표를 뽑아오는건 된다.
// 						console.log(coords);	//하지만 geocoder밖에서의 정보들은 날아가있다. 
												//geocoder실행 안과 밖이 이어지질 않는다.
			        }
			    } 
			});
	    }
		 */

		
		divToFit();
		$(window).resize(function() {
			divToFit();
	    });
		
		$(".righthider").click(function() {
			$("#rightbox").toggle( "fold", 500 );
			if($(".arrow_down").length){
				$("#show").css("height",window.innerHeight-90);
				setTimeout(function() {
					$(".arrow_down").addClass('arrow_up');
					$(".arrow_down").removeClass('arrow_down');
			    }, 350 );
			}else if($(".arrow_up").length){
				setTimeout(function() {
				$(".arrow_up").addClass('arrow_down');
				$(".arrow_up").removeClass('arrow_up');
					$("#show").css("height","36px");
			    }, 350 );
			}
// 			$("#rightbox").toggle(
// 				function(){$("#rightbox").addClass('right_hide')}, //클릭하면 show클래스 적용되서 보이기
// 				function(){$("#rightbox").addClass('right_show')} //한 번 더 클릭하면 hide클래스가 숨기기
// 	        );
		});
	});
</script>
</head>
<body>
<div id="container">

<!-- 	<div id="mapbox" style="width:1500px;height:830px;"> 아직미정 -->
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
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script>
		var container = document.getElementById('mapbox'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
// 			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			center: new kakao.maps.LatLng(37.525026023695375, 126.8888353907293), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
		
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		//마커이미지관련정보
// 		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
// 	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
// 	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
		// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
// 		var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	    // 마커가 표시될 위치입니다 
// 		var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
// 		var markerPosition  = new kakao.maps.LatLng(37.525026023695375, 126.8888353907293); 
	    
		// 마커를 생성합니다
// 		var marker = new kakao.maps.Marker({
// 		    position: markerPosition, 
// 		    image: markerImage // 마커이미지 설정
// 		});

		// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
// 		var iwContent = '<div class="markerbox" style="padding:5px;">댕댕미용실</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
// 		    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

		// 인포윈도우를 생성합니다
// 		var infowindow = new kakao.maps.InfoWindow({
// 		    content : iwContent,
// 		    removable : iwRemoveable
// 		});
		    
		  
		// 마커에 마우스오버 이벤트를 등록합니다
// 		kakao.maps.event.addListener(marker, 'mouseover', function() {
// 		  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
// 		    infowindow.open(map, marker);
// 		});

		// 마커에 마우스아웃 이벤트를 등록합니다
// 		kakao.maps.event.addListener(marker, 'mouseout', function() {
// 		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
// 		    infowindow.close();
// 		});
		
		// 마커에 클릭이벤트를 등록합니다
// 		kakao.maps.event.addListener(marker, 'click', function() {
// 				alert("이거 누르면 옆에 리스트에서 해당 매장의 백그라운드컬러가 변하게");
// 		      // 마커 위에 인포윈도우를 표시합니다
// 		      infowindow.open(map, marker);  
// 		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
// 		marker.setMap(map);
		
// 		function getInfo() {
		    
// 		    var center = map.getCenter(); // 지도의 현재 중심좌표를 얻어옵니다 
// 		    var level = map.getLevel(); // 지도의 현재 레벨을 얻어옵니다
// 		    var mapTypeId = map.getMapTypeId(); // 지도타입을 얻어옵니다
// 		    var bounds = map.getBounds();// 지도의 현재 영역을 얻어옵니다 
// 		    var swLatLng = bounds.getSouthWest(); // 영역의 남서쪽 좌표를 얻어옵니다 
// 		    var neLatLng = bounds.getNorthEast();  // 영역의 북동쪽 좌표를 얻어옵니다 
// 		    var boundsStr = bounds.toString(); // 영역정보를 문자열로 얻어옵니다. ((남,서), (북,동)) 형식입니다
// 		    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
// 		    message += '경도 ' + center.getLng() + ' 이고 <br>';
// 		    message += '지도 레벨은 ' + level + ' 입니다 <br> <br>';
// 		    message += '지도 타입은 ' + mapTypeId + ' 이고 <br> ';
// 		    message += '지도의 남서쪽 좌표는 ' + swLatLng.getLat() + ', ' + swLatLng.getLng() + ' 이고 <br>';
// 		    message += '북동쪽 좌표는 ' + neLatLng.getLat() + ', ' + neLatLng.getLng() + ' 입니다';
		    
// 		    alert(message);
// 		    console.log(message);
// 		}

		
		// 		드래그끝나면 실행1
// 		kakao.maps.event.addListener(map, 'dragend', function () {        
// 		});

// 		드래그끝나면 실행2
// 		kakao.maps.event.addListener(map, 'dragend', getInfo, true);             

// 		중심 좌표나 확대 수준이 변경되면 실행2
// 		kakao.maps.event.addListener(map, 'idle', getInfo, true);             
		kakao.maps.event.addListener(map, 'idle',  function() {
			map.relayout();
 		});
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
// 		kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);
	
// 		function displayMarker() {
		    
// 		    // 마커의 위치를 지도중심으로 설정합니다 
// 		    marker.setPosition(map.getCenter()); 
// 		    marker.setMap(map); 
	
// 		    // 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
// 		    // 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
// 		    // kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
// 		}
		
	    
	</script>

	<div id="show">
		<div class="righthider">
			<div class="arrow_up">
				
			</div>
		</div>
		<div id="rightbox">
										<!-- location.href='store.do?store_seq=__'<- 원래 여기는 화면안의 seq를 각각 넣어줘야한다. -->
			<div class="storelist" onclick="location.href='store.do?store_seq=24'">
			(임시 윤호가 테스트로 쓰는 매장 seq24)
			</div>
			<div class="storelist" onclick="location.href='store.do?store_seq=1'">
<!-- 			(임시 1번사장의 매장) -->
				<div class="photobox">사진</div>
				<div class="storestate">영업중</div>
<!-- 				<div class="storename">테스트테스트테스테스트트</div> -->
				<div class="storename">테스트테스트테스테스트트<span class="tooltiptext">테스트테스트테스테스트트</span></div>
				<div class="review"><img class="star" alt="" src="./img/star_fill.png"> 4.5</div>
				<div class="medal"><img class="medal" alt="" src="./img/gold.png"></div>
				<div class="cate_big">돌봄서비스</div>
				<div class="cate_small">소분류 | 소분류 | 소분류</div>
<!-- 				<div class="intro">우리매장은 멍멍멍멍댕댕동동우리매장입니다.</div> -->
				<div class="storephone">02-0000-0000</div>
				<div class="address">양평구 양평동 양평빌딩 양평1호(지번주소)</div>
				<div class="storetime">영업시간: 월요일 09:00 ~ 18:00</div>
				<div class="reservebtn">예약</div>
			</div>
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=2'"> -->
<!-- 			(임시 2번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=3'"> -->
<!-- 			(임시 3번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=4'"> -->
<!-- 			(임시 4번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=5'"> -->
<!-- 			(임시 5번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=6'"> -->
<!-- 			(임시 6번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=7'"> -->
<!-- 			(임시 7번사장의 매장) -->
<!-- 			</div> -->
<!-- 			<div class="storelist" onclick="location.href='store.do?store_seq=8'"> -->
<!-- 			(임시 8번사장의 매장) -->
<!-- 			</div> -->
		</div>
	</div>
</div>
</body>
</html>
