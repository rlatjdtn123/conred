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
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#photozone{width:100%; height:400px;border:1px solid grey;}
	.section{width:900px;margin-top:40px;display: inline-block;}
	#infobox1{ height:200px;}
	#info1{width:449px;background-color:lightblue; text-align: left;float: left; }
	#info2{width:449px;background-color:lightpink;text-align: right;float: right; }
	ul{list-style: none;padding-left:0px;}
	.icons{width:30px;}
	# state
</style>
</head>
<body>
<div id="container">
	<div id="photozone">
	carousel
	</div>
	<div id="infobox1" class="section">
		<ul id="info1" >
			<li><span id="state">영업중</span></li>
			<li><span>댕댕미용실</span><span>|미용실</span></li>
			<li>고양이도 개처럼 만들어주는 댕댕미용실</li>
			<li>
				<img class="icons" alt="" src="./img/profile_default.png">
				<img class="icons" alt="" src="./img/profile_default.png">
				<img class="icons" alt="" src="./img/profile_default.png">
			</li>
			<li>★★★★☆<span>4.7</span>/5</li>
			<li>리뷰 | 999+</li>
		</ul>
		<ul id="info2" >
			<li>영업중</li>
			<li><span>댕댕미용실</span><span>|미용실</span></li>
			<li>고양이도 개처럼 만들어주는 댕댕미용실</li>
			<li>
				<img class="icons" alt="" src="./img/profile_default.png">
				<img class="icons" alt="" src="./img/profile_default.png">
				<img class="icons" alt="" src="./img/profile_default.png">
			</li>
			<li>★★★★☆<span>4.7</span>/5</li>
			<li>리뷰 | 999+</li>
		</ul>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />