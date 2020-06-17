<%@page import="com.hk.conred.dtos.UDto"%>
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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px;  width:1000px;margin: 0 auto; }/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;text-align: center;line-height: 40px;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:20px;display: inline-block;height: 40px;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:800px;height:200px; margin:0 auto; margin-top: 20px;}
	.myboxmargin{margin-top:30px;}
	.mybox_info{width: 130px;height: 100px; float: left; margin-left: 100px;text-align: center;font-size: 20px; margin-top: 20px;}
	.mybox_info1{width: 130px;height: 100px;  float: left; margin-left: 170px;text-align: center;font-size: 20px; margin-top: 20px;}
    .stats_result{color: #A4A4A4; font-size: 30px;}
    a{color: gray; font-size: 50px;}
	a:hover{text-decoration: none; color:rgb(0, 255, 0);cursor: pointer;}
	.mybox_info_header{font-weight: bold; font-size: 20px;} 
	#footprint1{width: 50px;height: 40px;border-radius: 15px;background-color: #EFFBFB;}
	.point{color: gray; font-size: 50px;} 
	.bottom_info{margin-bottom: 100px;}  
	 
</style>             
</head>                
<% 
	UDto uldto=(UDto)session.getAttribute("uldto"); 
	UDto dto=(UDto)request.getAttribute("dto");  
%>  
<body> 
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2 home" onclick="location.href='user_mypage.do'">
				마이페이지
			</div>
			<div class="navis2" onclick="location.href='user_mypage_like.do'">
				좋아요
			</div>
			<div class="navis2" onclick="location.href='user_mypage_reservation.do'">
				내 예약
			</div>
			<div class="navis2" onclick="location.href='user_mypage_review.do'">
				내 리뷰
			</div>
			<div class="navis2" onclick="location.href='user_mypage_qna.do'">
				내 문의
			</div>
		</div> 
	</div> 
	<div id="pagename">  
		<img src="img/icon/icon_foot.png" id="footprint1"> 
		<b><%=uldto.getUser_name()%></b>님 환영합니다, 즐거운 하루!!<br>
		<span>이메일 : <%=uldto.getUser_email()%></span><br><br>
	</div>    
	<div class="mybox">   
		<div class="mybox_info_header" >내 통계</div><br/>
			<div class="mybox_info"> 
			 	<span class="stats_result"><a onclick="location.href='user_mypage_reservation.do'"><%=dto.getReserve_count()%></a></span><br/>
			 	<span><b>예약수</b></span> 
			</div>  
			<div class="mybox_info">  
		        <span class="stats_result"><a onclick="location.href='user_mypage_like.do'"><%=dto.getLike_count()%></a></span><br/>
		        <span><b>좋아요</b></span> 
			</div>     
			<div class="mybox_info">  
			  	<span class="stats_result point"><%=dto.getUser_point()%></span><br/>
			  	<span><b>포인트</b></span> 
			</div>
	</div>    
	<div class="mybox">  
		<div class="mybox_info_header">내가 쓴 글</div><br/>
		<div class="mybox_info1">
			  <span class="stats_result"><a onclick="location.href='user_mypage_qna.do'"><%=dto.getQna_count()%></a></span><br/>
			  <span><b>문의수</b></span> 
		</div>
		<div class="mybox_info1">
			  <span class="stats_result"><a onclick="location.href='user_mypage_review.do'"><%=dto.getReply_count()%></a></span><br/>
			  <span><b>리뷰수</b></span> 
		</div>
	</div> 
	<div class="mybox">
		<div class="mybox_info_header" >내 관심사</div><br/>
		<div class="mybox_info">
			  
		</div>
		<div class="mybox_info">
			  
		</div>
		<div class="mybox_info">
			  
		</div>
	</div>
	<div class="mybox bottom_info">
		<div class="mybox_info_header" >최근본 매장</div><br/>
		<div class="mybox_info">
			  
		</div>
		<div class="mybox_info">
			  
		</div>
		<div class="mybox_info">
			  
		</div>
	</div> 
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 