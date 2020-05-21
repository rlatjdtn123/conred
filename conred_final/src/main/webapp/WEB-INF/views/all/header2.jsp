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
	header{border:1px solid grey;border-top-width:0px;border-bottom-color:lightgrey; height:70px;width:100%;}
	#logo{width:400px; display: block; margin: 0 auto;position:relative; top:13px;}
	#secondheader{border:1px solid grey;border-top-width:0px; height:71px;width:100%;box-shadow: 0px 0.5px 3px grey;position:relative;}
	#categorybox{margin:0 auto; width:548px;}
	.categories{border:1px solid grey; border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:5px;}
</style>
</head>
<body>
<header>
		<img id="logo" alt="logo2" src="./img/logo2.png">
</header>
<div id="secondheader">
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
</div>
</body>
</html>