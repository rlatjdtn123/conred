<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px; margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.cate{ float: left;width: 199.6px; height: 70px;background-color: #D8D8D8;text-align: center;vertical-align: middle !important; line-height: 70px;}
	a{font-size: 30px;color: #000; }
	a:link { color: black; text-decoration: none;}
 	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: underline;}
 	.md{margin-left: 100px; width: 800px; border: 1px solid black; height: 200px; clear: left;  }
 	span{font-size: 20px;}
	#md1{margin-top: 400px; position: relative;}
	
</style>      
</head>  
  

<body>    
<div id="container"> 
	<div class="tab-content">
		<div class="cate" id="home">
			<a href="user_mypage.do">마이페이지</a> 
		</div>
		<div class="cate">
			<a href="user_mypage_like.do">좋아요</a>
		</div>
		<div class="cate">
			<a href="user_mypage_reservation.do">내 예약</a>
		</div>
		<div class="cate">
			<a href="user_mypage_review.do">내 리뷰</a>
		</div>
		<div class="cate">
			<a href="user_mypage_qna.do">내 문의</a>
		</div>
	</div>
	<div class="md" id="md1">
		<span style="font-weight: bold;">??회원님 환영합니다.</span><br/><br/>
		<span>닉네임:??</span><br/>
		<span>핸드폰:???</span><br/>
	</div>
	<div class="md">
		
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 