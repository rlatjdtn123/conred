<%@page import="com.hk.conred.dtos.UDto"%>
<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	UDto ldto=(UDto)session.getAttribute("ldto");
%>
<h1>메인 페이지</h1>
<body>
	<a>예약관리</a>
	<a>좋아요</a>
	<a >마이페이지</a>
	<a>로그아웃</a>
</body>
</html>
<jsp:include page="../all/footer.jsp" />