<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#tle1{width: 380px; height: 500px;}
	
	#tle2{width: 380px; height: 500px;}
	
	.fo{float: left; margin-left: 80px;}
	
	#user{border: 1px solid black; height:470px; border-radius: 10px; padding: 50px 0px 50px 0px;}
	
	#owner{border: 1px solid black;height:470px; border-radius: 10px; padding: 50px 0px 50px 0px;}
	
	.hd{margin-left: 90px;} 
	
	input{width: 300px; height: 50px; margin-left: 35px; margin-top: 20px;} 
	 
</style>
</head>
<body>
<div id="container">
	<form action="user_login.do" method="post">
		<div id="tle">
			<div id="tle1" class="fo">
				<h1 class="hd">사용자 로그인</h1>
				<div id="user">
					<input type="text" /><br/>
					<input type="text" /><br/>
					<input type="submit" value="로그인"/><br/>
					<input type="button" value="회원가입"/><br/>
					<input type="button" value="네이버 아이디로 로그인"/>
				</div>
			</div>
		</div>
	</form>
	<form action="owner_login.do" method="post">
		<div id="tle2" class="fo">
			<h1 class="hd">점주 로그인</h1>
			<div id="owner">
				<input type="text" /><br/>
				<input type="text" /><br/>
				<input type="submit" value="로그인"/><br/>
				<input type="button" value="회원가입"/><br/>
				<input type="button" value="네이버 아이디로 로그인"/>
			</div>
		</div>
	</form>
</div>
<input>
</body>
</html>
<jsp:include page="../all/footer.jsp" />