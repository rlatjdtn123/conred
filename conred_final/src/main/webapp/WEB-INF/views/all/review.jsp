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
	.test{margin:0 auto; background-color: grey; width:100px;height:100px;}
</style>
</head>
<body>
<div id="container">
<h1>(공통)review 페이지</h1>
<div class="test">
</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />