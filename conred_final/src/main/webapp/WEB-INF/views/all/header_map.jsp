<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{margin:0;}
	header{border:1px solid grey;border-top-width:0px; height:90px;width:100%;box-shadow: 0px 0.5px 3px grey;}
	#logo{width:400px; display: block; margin: 0 auto;position:relative; top:20px;}
	#profilebox{width:200px;height:40px;float:right;position: relative; bottom:35px;left:-10px;}
	.profile{float:right; height:100%;line-height: 40px;padding-right:10px;}
	#navibox{width:380px;height:30px;float:right;position: relative; padding-right:5px;left:190px;bottom:-10px}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 50px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;}
	#profilepic{width:40px;float:right;padding-right:10px;}
</style>
</head>
<body>
<header>
		<img id="logo" alt="logo2" src="./img/logo2.png">
		
		<div id="profilebox">
			<!--????부분에는 회원이름 출력-->
			<!--뒷부분에는 삼항식으로 '회원님,사장님,관리자님' 출력/ -->
			<div id="tologin" class="profile">김성수<span>관리자님</span></div>
			<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
		</div>
		<div id="navibox">
<!-- 		비회원 -->
			<div id="toregist" class="navis">회원가입</div>
			<div id="tologin" class="navis">로그인</div>
<!-- 		점주 --> 
<!-- 			<div id="logout" class="navis">로그아웃</div> -->
<!-- 			<div id="o_info" class="navis">나의정보</div> -->
<!-- 			<div id="o_tore" class="navis">매장관리</div> -->
<!-- 			<div id="o_storeinfo" class="navis">매장정보</div> -->
<!-- 			<div id="o_reserve" class="navis">예약</div> -->
<!-- 		사용자 -->
<!-- 			<div id="logout" class="navis">로그아웃</div> -->
<!-- 			<div id="u_info" class="navis">나의정보</div> -->
<!-- 			<div id="u_mypage" class="navis">마이페이지</div> -->
<!-- 			<div id="u_like" class="navis">좋아요</div> -->
<!-- 			<div id="u_reserve" class="navis">내 예약</div> -->
<!-- 		관리자 -->
<!-- 			<div id="logout" class="navis">로그아웃</div> -->
<!-- 			<div id="a_mypage" class="navis">나의정보</div> -->
<!-- 			<div id="a_site" class="navis">사이트관리</div> -->
		</div>
</header>

</body>
</html>