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
	header{border:1px solid grey;border-top-width:0px;box-shadow: 0px 0.5px 3px grey; height:200px;width:100%;}
	#logo{width:200px; display: block; margin: 0 auto;position:relative; top:40px;}
	#profilebox{width:150px;height:40px;float:right;position: relative; bottom:-10px;left:-10px;}
	.profile{float:right; height:100%;line-height: 40px;}
	#navibox{width:380px;height:30px;float:right;position: relative; bottom:-50px;left:150px;}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 50px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;}
	#profilepic{width:40px;padding-left: 5px;}
</style>
</head>
<body>
<header>
		<img id="logo" alt="logo1" src="./img/logo1.png">
		
		<div id="profilebox">
			<div id="tologin" class="profile">김성수회원님</div>
			<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
		</div>
		<div id="navibox">
<!-- 		비회원 -->
<!-- 			<div id="toregist" class="navis">회원가입</div> -->
<!-- 			<div id="tologin" class="navis">로그인</div> -->
<!-- 		점주 --> 
<!-- 			<div id="tologin" class="navis">로그아웃</div> -->
<!-- 			<div id="tologin" class="navis">나의정보</div> -->
<!-- 			<div id="tologin" class="navis">매장관리</div> -->
<!-- 			<div id="tologin" class="navis">매장정보</div> -->
<!-- 			<div id="tologin" class="navis">예약</div> -->
<!-- 		사용자 -->
			<div id="tologin" class="navis">로그아웃</div>
			<div id="tologin" class="navis">나의정보</div>
			<div id="tologin" class="navis">마이페이지</div>
			<div id="tologin" class="navis">좋아요</div>
			<div id="tologin" class="navis">내 예약</div>
<!-- 		관리자 -->
			<div id="tologin" class="navis">좋아요</div>
			<div id="tologin" class="navis">내 예약</div>
		</div>
</header>
</body>
</html>