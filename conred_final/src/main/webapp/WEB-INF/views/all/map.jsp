<jsp:include page="../all/header_map.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mapbox{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1150px;height:630px;position:absolute;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#rightbox{background-color:lightblue;opacity:0.5; border-top-width:0px; border-bottom-width:0px; width:400px;height:630px;position:absolute;right:0px;}
	.storelist{width:auto;height:140px;border:1px solid grey;margin:10px;}
	#mapbarbox{overflow:auto; width:350px;height:200px;border:1px solid grey;position:absolute;left:20px;top:20px;}
	#mapbar{}
	#search{margin:10px;width:330px;position:absolute;}
	#searchbar{width:280px;}
	#magnifyglass{width:20px;}
</style>
</head>
<body>

<div id="mapbox">
	<div id="mapbarbox">
	
		<form id="search">
		  <input type="text" id="searchbar" class="form-control pull-left" placeholder="검색">
		  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
		</form>
	
		<div id="mapcategory"></div>
	</div>

</div>
<div id="rightbox">
	<div class="storelist">
	</div>
	<div class="storelist">
	</div>
	<div class="storelist">
	</div>
	<div class="storelist">
	</div>
</div>
</body>
</html>
