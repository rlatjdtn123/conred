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
<h1>사용자</h1>
	<ul>
		<li><%=ldto.getUser_id()%></li>	
		<li><a href="user_mypage_reservation.do">예약관리</a></li>
		<li><a href="user_mypage_like.do">좋아요</a></li>
		<li><a href="user_mypage.do">마이페이지</a></li>
		<li><a href="user_logout.do">로그아웃</a></li>
	</ul>
<h1>점주</h1>
	<ul>
		<li><a href="">로그아웃</a></li>
		<li><a href="">나의정보</a></li>
		<li><a href="">매장관리</a></li>
		<li><a href="">매장정보</a></li>
		<li><a href="">예약</a></li>
	</ul>
	
	<div id="logout" class="navis">로그아웃</div> -->
<!-- 			<div id="o_info" class="navis">나의정보</div>ㄹㄹ -->
<!-- 			<div id="o_tore" class="navis">매장관리</div> -->
<!-- 			<div id="o_storeinfo" class="navis">매장정보</div> -->
<!-- 			<div id="o_reserve" class="navis">예약</div> -->
</body>
</html>
<jsp:include page="../all/footer.jsp" />