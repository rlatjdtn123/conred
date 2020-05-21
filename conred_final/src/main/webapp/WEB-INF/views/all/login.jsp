<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#tle1{width: 380px; height: 500px;}
	
	#tle2{width: 380px; height: 500px;}
	
	.fo{float: left; margin-left: 80px;}
	
	#user{border: 1px solid black; height:400px; border-radius: 10px; padding: 50px 0px 50px 0px;}
	
	#owner{border: 1px solid black;height:400px; border-radius: 10px; padding: 50px 0px 50px 0px;}
	
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
					<input type="submit" /><br/>
					<input type="button" /><br/>
					<input type="button" />
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
				<input type="submit" /><br/>
				<input type="button" /><br/>
				<input type="button" />
			</div>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />