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
	
	
	.store_img{width: 200px;height:300px;border: 1px solid black; float: left; margin-left: 100px;} 
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
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
			<div class="navis2 home" onclick="location.href='user_mypage_reservation.do'">
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
		<b>내 예약</b>
	</div>
	<div>
		<div class="store_img">
	 		<p>매장사진들어갈곳</p>
	 		<p>+매장명</p> 
	 	</div>
	 	<div class="mybox">
	 		<a>메뉴명 : ?????? </a><br><br>  
	 		<span>가격 정보 : 2000원 </span><br><br>
	 		<span>예약 날짜 : 2020년 5월 30일 </span><br><br>
	 		<span>주소 : 서울 영등포 </span><br><br>
	 		<div style="margin-left: 300px; margin-top: 80px;">
		 		<button>예약취소</button>&nbsp;&nbsp;       
		 		<button>결제하기</button>    
	 		</div>
	 	</div> 	 
	</div>   
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 