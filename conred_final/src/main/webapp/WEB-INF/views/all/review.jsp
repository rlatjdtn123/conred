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
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:800px;height:300px; margin:0 auto;}
	.myboxmargin{margin-top:30px;}
	#main{width: 850px;height: 250px;margin: 0 auto; padding-top: 50px; margin-bottom: 100px;}
	#main1{font-size: 20px;}
	#main2{}
	img{float: left; width: 40px;height: 40px;}     
</style>  
</head>  
<body>   
<div id="container"> 
<!-- 	<div id="sticky">  -->
		
<!-- 	</div>    -->
	<div id="main">
		<span id="main1">리뷰 ★★★★★ &nbsp;<b style="font-size: 25px;">4.7</b>/5 &nbsp; &nbsp; &nbsp;후기2343개|답변2033개</span><br/><br/>
		<span>최근6개월 누적평점</span>
		<table>
				<col width="50px;">
					<tr>
						<td><span>서비스</span></td>
						<td>★★★★☆ 4.5<span>/5</span></td>
					</tr>
					<tr>
						<td><span>가격</span></td>
						<td>★★★★☆ 4.5<span>/5</span></td>
					</tr>
					<tr>
						<td><span>청결도</span></td>
						<td>★★★★☆ 4.5<span>/5</span></td>
					</tr>
				</table>  
	</div>
	
	<div class="mybox"> 
		<div>
			<img src="./img/profile_default.png"/>&nbsp;<span>★★★★★</span>
		</div>
		<span>닉네임:??</span><br/>
	</div>
	<div class="mybox myboxmargin">
		<span style="font-weight: bold;">??회원님 환영합니다.</span><br/><br/>
		<span>닉네임:??</span><br/>
		<span>핸드폰:???</span><br/>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 