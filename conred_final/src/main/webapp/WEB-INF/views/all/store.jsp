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
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:1800px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#photozone{width:100%; height:400px;border:1px solid grey;}
	
	.section{width:900px;display: inline-block;}
	#infobox1{ height:250px;margin-top:40px;}
	#infobox2{ height:200px;border:0px solid grey;border-top-width: 0.5px;}
	.info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;}
	.info2{width:449.5px;height:100%; text-align: right;float: right;margin-bottom: 0px; }
	.seroline{border-left: 1px solid grey }
	ul{list-style: none;padding-left:0px;}
	.icons{width:35px;}
	.medal{width:30px;padding-bottom:13px}
	#s_state{font-size:15px;color:#3ADF00;font-weight: bold;display: inline-block;}
	#s_title{font-size:30px;display: inline-block;}
	#s_tinfo{padding-top:10px;padding-bottom:10px;font-size:15px;display:block;}
	#s_star{font-size:25px;display: inline-block;}
	#s_review{font-size:15px;display: inline-block;background-color: #F2F2F2;padding:0px 5px; border-radius: 10px;text-align: center;}
	.s_phone{font-size:15px;}
	.s_cate{float:left; font-size:12px;width:60px;text-align: center;}
	hr{width:900px;border:0.5px solid grey;}
	li{overflow: auto;}
</style>
</head>
<body>
<div id="container">
	<div id="photozone">
	carousel
	</div>
	<div id="infobox1" class="section">
		<ul class="info1" >
			<li><span id="s_state">영업중</span></li>
			<li><img class="medal" alt="" src="./img/gold.png"> <span id="s_title">댕댕미용실</span><span> | 미용실, 애견용품</span></li>
			<li>
				<div class="s_cate">
					<img class="icons" alt="" src="./img/profile_default.png">
					<div>미용실</div>
				</div>
				<div class="s_cate">
					<img class="icons" alt="" src="./img/profile_default.png">
					<div>동물병원</div>
				</div>
				<div class="s_cate">
					<img class="icons" alt="" src="./img/profile_default.png">
					<div>애견글램핑</div>
				</div>
			</li>
			<li id="s_star">★★★★☆ 4.7<span>/5</span></li>
			<li id="s_review"><span>리뷰 | 999+</span></li>
			<li id="s_tinfo">고양이도 개처럼 만들어주는 댕댕미용실</li>
		</ul>
		<ul class="info2" >
			<li><span  class="s_phone">매장번호 :</span><span>02-111-1111</span></li>
			<li><span class="s_phone">담당자번호 :</span><span>010-1111-1111</span></li>
		</ul>
	</div>
<!-- 	<hr> -->
	<div id="infobox2" class="section">
		<ul class="info1" >
			<li>영업시간</li>
			<li>평일</li>
			<li>토요일</li>
			<li>매주 월요일, 일요일 휴무</li>
		</ul>
		<ul class="info2 seroline" >
			<li>주소</li>
			<li>한경한경시 한경구 한경동</li>
			<li>한경빌딩 404호</li>
		</ul>
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />