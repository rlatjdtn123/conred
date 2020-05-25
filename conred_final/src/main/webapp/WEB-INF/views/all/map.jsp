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
	#container{width:100%;height:700px;}
	#mapbox{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:100%;height:auto;position:absolute;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#show{width:407.5px;height:90.5%;background-color: blue;position:absolute;right:0px;overflow: auto;}
	#rightbox{background-color:lightblue;opacity:0.5; border-top-width:0px; border-bottom-width:0px; width:390px;height:auto;position:absolute;right:0px;}
	.storelist{width:auto;height:140px;border:1px solid grey;margin:10px;}
	.storelist:hover{cursor: pointer;}
	
	#mapbarbox{box-shadow: 0px 0.5px 1.5px grey;overflow:auto; width:300px;height:200px;border:1px solid grey;position:absolute;left:20px;top:20px;}
	#search{padding:10px;width:280px;position:absolute;left:8px;}
	#searchbar{width:220px;}
	#searchbtn{padding:3px;width:40px;height:35px;}
	#magnifyglass{width:20px;}
	#mapcategory{top:50px;position:relative;}
	#categorybox{margin:0 auto; width:280px; overflow:auto;overflow-y: hidden; padding:10px;}
	.categories:first-child{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:0px;}
	.categories{border:1px solid grey; border-radius: 10px; width:50px; height:50px;position:relative;float: left;margin-left:20px;}
</style>
</head>
<body>
<div id="container">
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
	<div id="show">
		<div id="rightbox">
			<div class="storelist" onclick="location.href='store.do'">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
			<div class="storelist">
			</div>
		</div>
	</div>
</div>
</body>
</html>
