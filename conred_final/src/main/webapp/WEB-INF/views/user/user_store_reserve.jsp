<%@page import="com.hk.conred.dtos.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey;border-bottom-width:0.1px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.mname{border-top-width: 0px !important;font-size:18px;height:30px;text-align: left;}
	.mnametext{background-color: #f5f5f5;border-radius: 5px 5px 0px 0px;padding: 11px 31px 11px;border: 1px solid #ddd;border-bottom-width: 0px;}
	.s_bold{font-size:20px;font-weight: bold;display:block; margin-top: 50px;margin-bottom: 50px;}
	#s_menubox{height:auto;}
	#s_menu{text-align: center;}
	.bigtle{width: 800px; margin: 0 auto; margin-bottom: 400px;}
	.reserve_btn{background-color: #F2F2F2; border: 0;}
	.reserve_btn:hover {background-color: lightgrey;cursor: pointer;}

	
	 
</style> 
</head>
<%
	List<MenuDto> list_menu=(List<MenuDto>)request.getAttribute("list_menu");
%>
<body> 
<div id="container">
	<div class="bigtle">
		<div class="infobox section">
			<div class="s_bold">${store_name}의 예약가능 메뉴</div>
			<br>
			<div id="s_menubox"> 
				<table id="s_menu" class="table">
					<col width="150px">
					<col width="450px"> 
					<col width="100px">  
					<col width="150px">	
					<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 -->
						<c:if test="${list_menu[i].menu_state ne 'N'}">
							<c:choose>
								<c:when test="${i==0}">
									<tr>
										<td class="mname" colspan="4"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
									</tr>
									<tr>
										<td class="active"><b>메뉴명</b></td>
										<td class="active"><b>설명</b></td>
										<td class="active"><b>가격</b></td>
										<td class="active">예약하기</td>
									</tr>
								</c:when>
								<c:when test="${list_menu[i-1].category_code != list_menu[i].category_code}">
									<tr>
										<td class="mname" colspan="4"></td>
									</tr>
									<tr>
										<td class="mname" colspan="4"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
									</tr>
									<tr>
										<td class="active"><b>메뉴명</b></td> 
										<td class="active"><b>설명</b></td>
										<td class="active"><b>가격</b></td>
										<td class="active">예약하기</td>
									</tr>				
								</c:when>
							
							</c:choose>
		
							<tr>
								<td>${list_menu[i].menu_name}</td> 
								<td>${list_menu[i].menu_content}</td>
								<td>${list_menu[i].menu_price}원</td>
								<td><input type="button" onclick="location.href='user_reserve_time_select.do?menu_seq=${list_menu[i].menu_seq}&menu_state=${list_menu[i].menu_state}&store_seq=${list_menu[i].store_seq}'" value="예약하러가기" class="reserve_btn"/></td>									
							</tr>
						</c:if>
					</c:forEach>					
				</table>
			</div>
		</div>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 