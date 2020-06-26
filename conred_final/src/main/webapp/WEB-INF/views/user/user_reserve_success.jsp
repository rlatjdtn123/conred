<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:1px; border-bottom-width:0px;height:1200px; width:1000px;margin: 0 auto;}
	.bigtle{width: 600px; height:300px; border-bottom: 3px solid grey;margin: 0 auto; margin-bottom: 35px;margin-top: 15px;text-align: center;}
	.main_home{transition: all ease 0.5s;width: 250px;height: 100px; border: 2px solid grey;float: left;margin-left: 177px;text-align: center;font-size: 50px;font-size: 50px;padding-top: 10px;margin-top: 35px;}	
	.bigtle02{width: 600px; height: 200px; margin: 0 auto;}
	.check{background: url("img/reserve_success02.png");width: 200px;height: 160px;background-size: 200px 160px;margin-left: 200px;margin-top: 5px;}
	
	.main_home:hover{cursor: pointer;transform: scale( 1.1, 1.1 );}
	th,td{padding: 10px;}
	table{font-size: 25px;}
	
</style> 

</head>
<%
	ReserveDto dto=(ReserveDto)request.getAttribute("dto");
%>
<body>
<!-- <h2>아이디,예약한시간,예약금액,예약시작일/예약끝나는일(상품 기간),가게이름,메뉴이름</h2> -->
<div id="container">
	<div class="bigtle">
		<div class="check"></div>
		<h1><%=dto.getUser_id()%>,님의 결제가 <b>완료</b> 되었습니다</h1>
	</div>
	<div class="bigtle02">
		<table>
			<tr>
				<th>ㆍ 매장이름:</th>
				<td><%=dto.getStore_name()%></td>
			</tr>
			<tr>
				<th>ㆍ 이용상품:</th>
				<td><%=dto.getMenu_name()%></td>
			</tr>
			<tr>
				<th>ㆍ 결제금액:</th>
				<td style="color: #FF8000"><%=dto.getReserve_price()%></td>
			</tr>
			<%
			if(dto.getReserve_edate()==null){
			%>
			<tr>
				<th>ㆍ 이용날짜:</th>
				<td><%=dto.getReserve_sdate()%> / <%=dto.getReserve_time()%></td>
			</tr>
			<%	
			}else{
			%>
			<tr>
				<th>ㆍ 이용날짜:</th>
				<td><%=dto.getReserve_sdate()%> ~ <%=dto.getReserve_edate()%></td>
			</tr>
			<%	
			}	
			%>
			<tr>
				<th>ㆍ 문의번호:</th>
				<td><%=dto.getStore_phone()%></td>
			</tr>
		</table>
		<div onclick="location.href='index.jsp'" class="main_home">
			홈으로  
		</div>
	</div>
</div> 
</body>
</html> 
<jsp:include page="../all/footer.jsp" />