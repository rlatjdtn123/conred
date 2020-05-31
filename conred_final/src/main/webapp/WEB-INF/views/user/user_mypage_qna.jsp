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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{}   
	.contents{display:inline-block; width: 450px;height:40px;text-overflow: ellipsis; overflow: hidden;}     
	.info2{background-color: #F2F2F2; margin-top: 10px; height: 100px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 450px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.store_img{width: 200px;height:300px;border: 1px solid black; float: left; margin-left: 100px;} 
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:500px;height:300px; font-size: 15px; margin-left: 300px;}
	.myboxmargin{margin-top:30px;} 
</style>
</head>
<body>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='user_mypage.do'">
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
			<div class="navis2 home" onclick="location.href='user_mypage_qna.do'">
				내 문의
			</div>
		</div>
	</div>
	<div id="pagename">
		<b>작성한 문의</b>
	</div>
	<div>
	 	<div class="store_img">
	 		<p>매장사진들어갈곳</p>
	 		<p>+매장명</p> 
	 	</div>      
		<div class="mybox">   
			<img src="./img/profile_default.png" class="pf"/>
			<div class="info">  
				<a style="margin-left: 340px;" id="md" onclick="mdTest()">자세히 보기</a>
				<span>닉네임:?? &nbsp;| 가격문의 </span><br><br><br>   
				<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd
		 		ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   
			</div> 
			<div class="info2">     
				<span style="font-weight: bold;">가게답변</span><br>
				<span>dddddddddddddddddddddddddddddddddd</span>
			</div>
		</div>
	</div>  
	<br><br>
	<div>
	 	<div class="store_img">
	 		<p>매장사진들어갈곳</p>
	 		<p>+매장명</p> 
	 	</div>      
		<div class="mybox">   
			<img src="./img/profile_default.png" class="pf"/>
			<div class="info">
				<a style="margin-left: 340px;" id="md" onclick="mdTest()">자세히 보기</a>
				<span>닉네임:?? &nbsp;| 가격문의  </span><br><br><br>   
				<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd
				ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   
			</div>  
			<div class="info2">     
				<span style="font-weight: bold;">가게답변</span><br>
				<span>dddddddddddddddddddddddddddddddddd</span>
			</div>
		</div>
	</div>  
	<br><br>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 