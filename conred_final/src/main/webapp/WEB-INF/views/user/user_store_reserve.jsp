<%@page import="com.hk.conred.dtos.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	List<MenuDto> list=(List<MenuDto>)request.getAttribute("list");
%>
<body>
<h1>매장->메뉴들(사용자가예약)</h1> 
<div class="infobox section">
		<div class="s_bold">메뉴</div>
		<br>
		<div id="s_menubox">
			<table id="s_menu" class="table">
				<col width="200px">
				<col width="500px">
				<col width="150px">
				<%for(int i=0; i<list.size()-1;i++){
					if(i==0){
						%>
							<tr>
								<td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
							</tr>
							<tr>
								<td class="active"><b>메뉴명</b></td>
								<td class="active"><b>설명</b></td>
								<td class="active"><b>가격</b></td>
							</tr>
						<%
					}
				}
				%>
				<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 -->
						<c:choose>
							<c:when test="${i==0}">
								<tr>
									<td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
								</tr>
								<tr>
									<td class="active"><b>메뉴명</b></td>
									<td class="active"><b>설명</b></td>
									<td class="active"><b>가격</b></td>
								</tr>
							</c:when>
							<c:when test="${list_menu[i-1].category_code != list_menu[i].category_code}">
								<tr>
									<td class="mname" colspan="3"></td>
								</tr>
								<tr>
									<td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
								</tr>
								<tr>
									<td class="active"><b>메뉴명</b></td>
									<td class="active"><b>설명</b></td>
									<td class="active"><b>가격</b></td>
								</tr>				
							</c:when>
						
						</c:choose>
						<tr>
							<td>${list_menu[i].menu_name}</td>
							<td>${list_menu[i].menu_content}</td>
							<td>${list_menu[i].menu_price}원</td>
						</tr>
								
	
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>