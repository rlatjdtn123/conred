<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="java.util.List"%>
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
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
</style>
</head> 
<%
List<UDto>list=(List<UDto>)request.getAttribute("list"); 
%>
<body>
<div id="container">
<form action="admin_user_search.do" method="post">
		<table border="0" cellpadding="0" cellspacing="0" width="1206" align="center">
			<tr>
<!-- 			검색창은 임시로 했어... -->
				<td align="left">
					<select	name="userSearch">
						<option value="keyWord">키워드 검색</option> 
						<option value
">테스트</option> 
					</select>
					<input name="searchWord" type="text" style="width:300px">
					<input type="image" src="img/dogicon1.png" ></td>
			</tr>
			</table>
		</form>
<table border="0" align="center">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>이메일</th>
		<th>생년월일</th>
		<th>성별</th>
		<th>가입일자</th>
		<th>약관동의여부</th>
		<th>탈퇴여부</th>
		<th>블랙여부</th>
		<th>유저등급</th>
		<th>포인트</th>
	</tr>
<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='8'>"
			         +"---회원이 존재하지 않습니다.---</td></tr>");
		}else{
			for(UDto dto:list){
				%>
				<tr>
					<td><%=dto.getUser_id()%></td>
					<td><%=dto.getUser_password()%></td>
					<td><%=dto.getUser_name()%></td>
					<td><%=dto.getUser_email()%></td>
					<td><%=dto.getUser_birth()%></td>
					<td><%=dto.getUser_sex()%></td>
					<td><%=dto.getUser_regdate()%></td>
					<td><%=dto.getUser_agreement()%></td>
					<td><%=dto.getUser_out()%></td>
					<td><%=dto.getUser_black()%></td>
					<td><%=dto.getUser_role()%></td>
					<td><%=dto.getUser_point()%></td>
				</tr>
				<%
			}
		}
	%>	
</table>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />