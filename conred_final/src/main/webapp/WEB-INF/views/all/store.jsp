<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:1800px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#photozone{width:100%; height:400px;border:1px solid grey;}
	
	.s_bold{font-size:20px;font-weight: bold;}
	.s_bold2{font-size:15px;font-weight: bold;}
	.s_week{font-size:15px;width:70px;display: inline-block;}
	.redfont{color:red;}

	.section{width:900px;display: inline-block;}
	#infobox_title{ height:290px;margin-top:20px;}
	#infobox_timeaddr{ height:230px;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;}
	#infobox_intro{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	#infobox_menu{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	.info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;padding:30px 15px;}
	.info2{width:449.5px;height:100%; text-align: right;float: right;margin-bottom: 0px; padding:30px 15px;}
	.width1{width:650px}
	.width2{width:250px}
	.seroline{border-left: 1px solid grey }
	
	#s_state{font-size:15px;color:#3ADF00;font-weight: bold;display: inline-block;}
	.medal{width:30px;padding-bottom:13px}
	#s_title{font-size:30px;display: inline-block;}
	#s_tinfo{height:60px;font-size:15px;display:inline-block;}

	#s_cates{overflow: auto;}
	.s_cate{float:left; font-size:12px;width:45px;text-align: center;}
	.icons{width:35px;padding-bottom: 12px;}

	#s_reviews{width:auto;}
	#s_star{font-size:25px;display:block;width:190px;}
	.s_btn{font-size:15px;display: block; width:190px;background-color: #F2F2F2;padding:0px 5px; border-radius: 10px;text-align: center;}
	.s_btn:hover{cursor: pointer;background-color: lightgrey}
	
	#addr{height:60px;font-size:15px;}
	.s_mapbtn{float: right;margin-top: 40px;position:relative;bottom: 0px;}
	.s_phone{font-size:15px;}
	
	
	hr{width:900px;border:0.5px solid grey;}
	
	
</style>
</head>
<body>
<div id="container">
	<div id="photozone">
	carousel
	</div>
	<div id="infobox_title" class="section">
		<div class="info1 width1" >
			<div><span id="s_state">영업중</span></div>
			<div>
				<img class="medal" alt="" src="./img/gold.png">
				<span id="s_title">댕댕미용실
				</span>
			</div>
			<div id="s_cates">
				<div class="s_cate">
					<img class="icons" title="미용실" src="./img/profile_default.png">
				</div>
				<div class="s_cate">
					<img class="icons" title="애견용품" src="./img/profile_default.png">
				</div>
				<div class="s_cate">
					<img class="icons" title="애견카페" src="./img/profile_default.png">
				</div>
			</div>
			<div id="s_tinfo">고양이도 개처럼 만들어주는 댕댕미용실</div>
			<div id="s_reviews">
				<div id="s_star">★★★★☆ 4.7<span>/5</span></div>
				<div class="s_btn">리뷰 | 999+</div>
			</div>
		</div>
		<div class="info2 width2" >
			<br>
			<div><span  class="s_phone">매장번호 :</span><span>02-111-1111</span></div>
			<div><span class="s_phone">담당자번호 :</span><span>010-1111-1111</span></div>
		</div>
	</div>
<!-- 	<hr> -->
	<div id="infobox_timeaddr" class="section">
		<div class="info1" >
			<div class="s_bold">영업시간</div>
			<br>
			<div>
				<span class="s_week">평일</span>
				<span>09:00</span>~<span>17:00</span>
			</div>
			<div>
				<span class="s_week">토요일</span>
				<span>10:00</span>~<span>13:00</span>
			</div>
			<div class="s_bold2 redfont">매주 월요일, 일요일 휴무</div>
		</div>
		<div class="info2 seroline" >
			<div class="s_bold">주소</div>
			<br>
			<div id="addr">
				<span>한경한경시 한경구 한경동</span><br>
				<span>한경한경시 한경구 한경동</span><br>
				<span>경빌딩 404호</span>
			</div>
			<div id="addr_detail"></div>
			<div class="s_btn s_mapbtn">지도 바로가기</div>
		</div>
	</div>
	<div id="infobox_intro" class="section">
		<div class="s_bold">매장소개</div>
		<br>
		<div class="s_content">고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼
		 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고
		 양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 
		 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼
		  만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양
		  이도 개처럼 만들어주는 댕댕미용실</div>
	</div>
	<div id="infobox_menu" class="section">
		<div class="s_bold">메뉴</div>
		<br>
		<div id="s_menu">
			<div class="s_menus"> 
				<div>
				</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />