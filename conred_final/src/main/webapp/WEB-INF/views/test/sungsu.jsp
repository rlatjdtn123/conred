<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		margin: 0px;
	}
	footer{
		height: 300px;
		background-color: #E6E6E6;
	}
	#main1{
		position:relative;
		top:20px; 
		width: 800px;
		margin: 0 auto;
		height: 260px;
		border:1px solid black;
	}
	#f1{
		position:absolute;
		left:20px;
		top:100px;
		width:200px;
		border: 1px solid black;
	}
	#f2{
		position: absolute;
		left: 220px;
		top:100px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<h1>푸터</h1>
</body>
<footer>
	<div id="main1">
		<div id="f1">
			<span style="background-color: white;">어디가냥?<br>저기가게!</span>
		</div>
		<div id="f2">
			(주)어디가개|대표이사:신윤호|사업자 등록번호 :220-87-42885|통신판매업신고:양평동 000호 <br/>
			메일:syhnz1102@gmail.com
		</div>
	</div>
</footer>
</html>