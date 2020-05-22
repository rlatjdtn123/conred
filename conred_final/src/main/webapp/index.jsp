<jsp:include page="WEB-INF/views/all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
</style>
</head>
<body>

<div style="position:absolute;left:0px;top:0px;">
<h1><a href="login.do">로그인</a></h1>
<h1><a href="home.do">테스트</a></h1>
<h1><a href="sungsu.do">성수입장</a></h1>
<h1><a href="yoonho.do">윤호입장</a></h1>
</div>

<div id="container">
	
</div>


</body>
</html>
<jsp:include page="WEB-INF/views/all/footer.jsp" />