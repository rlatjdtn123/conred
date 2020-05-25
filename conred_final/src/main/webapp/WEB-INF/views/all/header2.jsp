<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	body{margin:0;}
	header{border:1px solid grey;border-top-width:0px;border-bottom-color:lightgrey; height:70px;width:100%;}
	#logo{width:400px; display: block; margin: 0 auto;position:relative; top:13px;}
	#logo:hover{cursor: pointer;}
	#secondheader{background-color:#fff; z-index:1;border:1px solid grey;border-top-width:0px; height:71px;width:100%;box-shadow: 0px 0.5px 2px grey;position:sticky;top:0px;}
	#categorybox{margin:0 auto; width:548px;}
	.categories{border:1px solid grey; border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:5px;}
	#profilebox{width:200px;height:30px;float:right;position: relative; bottom:22px;left:-10px;}
	.profile{float:right; height:100%;line-height: 23px;padding-right:10px;}
	#navibox{float:right;width:380px;height:30px; padding-right:15px;clear:both;position: relative; bottom:40px;}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 50px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;}
	#profilepic{width:30px;float:right;padding-right:10px;}
	
	#search{padding-top:18px;width:25%;position:absolute;left:20px;}
	#searchbar{width:80%;}
	#searchbtn{padding:3px;width:40px;height:35px;}
	#magnifyglass{width:20px;}
</style>
</head>
<body>
<header>
	<img id="logo" alt="logo2" src="./img/logo2.png" onclick="location.href='index.jsp'"><!-- 나중에 세션에따라 이동되는페이지 달라지게 바꾸기 -->
	<div id="profilebox">
		<!--????부분에는 회원이름 출력-->
		<!--뒷부분에는 삼항식으로 '회원님,사장님,관리자님' 출력/ -->
		<div id="tologin" class="profile">김성수<span>관리자님</span></div>
		<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
	</div>
</header>
<div id="secondheader">
			<form id="search">
			  <input type="text" id="searchbar" class="form-control pull-left" placeholder="지역명, 지하철역, 매장명으로 검색">
			  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
			</form>

	<div id="categorybox">
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
		<div class="categories"></div>
	</div>


	<div id="navibox">
<!-- 		비회원 -->
<!-- 		<div id="toregist" class="navis">회원가입</div> -->
<!-- 		<div id="tologin" class="navis">로그인</div> -->
<!-- 		점주 --> 
		<div id="logout" class="navis">로그아웃</div>
		<div id="o_info" class="navis">나의정보</div>
		<div id="o_tore" class="navis">매장관리</div>
		<div id="o_storeinfo" class="navis">매장정보</div>
		<div id="o_reserve" class="navis">예약</div>
<!-- 		사용자 -->
<!-- 		<div id="logout" class="navis">로그아웃</div> -->
<!-- 		<div id="u_info" class="navis">나의정보</div> -->
<!-- 		<div id="u_mypage" class="navis">마이페이지</div> -->
<!-- 		<div id="u_like" class="navis">좋아요</div> -->
<!-- 		<div id="u_reserve" class="navis">내 예약</div> -->
<!-- 		관리자 -->
<!-- 		<div id="logout" class="navis">로그아웃</div> -->
<!-- 		<div id="a_mypage" class="navis">나의정보</div> -->
<!-- 		<div id="a_site" class="navis">사이트관리</div> -->
	</div>
</div>
</body>
</html>