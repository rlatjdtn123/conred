<%@page import="com.hk.conred.dtos.ReserveDto"%>
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
	#container{ border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/	
	#sticky{z-index:200;position: sticky; top:71px;display: inline-block;}
	#navi2{box-shadow: 0px 0.5px 2px #5882FA;width:1000px;clear:both;position:relative;top:0px;text-align: center;line-height: 50px;display: inline-block;border-bottom: 1px solid #5882FA;}
	.navis2{ font-size:18px; float:left;width:200px;height:50px;color: #000;background-color: #fff;}
	.navis2:hover{color:#2F3376;transition:all .3s;cursor:pointer;border-bottom:5px solid #5882FA ;}
	.home{background-color: white;color:black;border-bottom:5px solid #5882FA ;text-decoration: none;border-left-width: 0;border-right-width: 0;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:25px;margin-bottom:30px;display: inline-block;}
	#photozone{width:100%; height:400px;border:1px solid grey;}
	
	
	
	.mybox{padding:25px;border-bottom:1px solid #BDBDBD;border-top:1px solid #BDBDBD; width:720px;height:180px; font-size: 15px; margin-left: 100px;margin-bottom: 40px;}
	
</style>
</head>
<%
	List<ReserveDto> list=(List<ReserveDto>)request.getAttribute("list");
%>
<body>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='store.do?store_seq=${sdto.store_seq}'">
				매장 홈
			</div>
			<div class="navis2" onclick="location.href='owner_toReupdate_store.do'">
				매장정보 수정
			</div>
			<div class="navis2 home" onclick="location.href='owner_mystore_reserve.do?store_seq=<%=list.get(0).getStore_seq()%>'">
				예약관리
			</div>
			<div class="navis2" onclick="location.href='review.do?store_seq=<%=list.get(0).getStore_seq()%>'">
				리뷰관리
			</div>
			<div class="navis2" onclick="location.href='qna.do?store_seq=<%=list.get(0).getStore_seq()%>'">
				문의관리
			</div>
		</div>
	</div>
	<div id="pagename">
		<b>내 예약</b>
	</div>
	<%
	for(ReserveDto dto:list){
	%>
	<div class="mybox">
	 	<div class="reserve_info"> 
	 		<span>ID : <%=dto.getUser_id()%> </span><br>  
	 		<span>EMAIL : <%=dto.getUser_email()%> </span><br> 
	 		<span>메뉴명: <%=dto.getMenu_name()%></span><br>
	 		<%
	 		if(dto.getReserve_edate()==null){
	 		%>	
	 		<span>예약 날짜 : <%=dto.getReserve_sdate()%></span><br>
	 		<span>예약 시간 : <%=dto.getReserve_time()%></span><br>
	 		<%
	 		}else{
 			%>	
 			<span>예약 날짜 : <%=dto.getReserve_sdate()%> ~ <%=dto.getReserve_edate()%> </span><br>
	 		<%	
	 		}
	 		%>		 				
 		</div>
 	</div> 
	<%	
	}
	%>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />