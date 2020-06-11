<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#message1{width:500px;text-align: center; margin:0 auto;padding-top:80px;font-size:22px; font-weight: bold}
	#footprint1{width:30px;padding-left: 5px;padding-bottom: 8px;}

	#search{width:550px;margin:0 auto;padding-top:60px;padding-bottom: 10px;}
	#searchbar{width:500px;}
	#magnifyglass{width:20px;}
	
	#category{padding-top:50px; height:auto;width:100%;position:relative;}
	.categorybox{overflow:auto; margin:0 auto; width:665px;padding-bottom: 50px;overflow-y: hidden;}
	.categorybox:last-child{overflow:auto; margin:0 auto; width:665px;padding-bottom: 40px;padding-top: 40px;overflow-y: hidden;}
	.categories{border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;border:0.5px solid #E6E6E6;}
	.categories:hover{cursor:pointer;box-shadow: 0px 0.5px 3px #E6E6E6; } 
	.categories_invisible{border-radius: 10px; width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;}
	.categories_last{width:60px; height:60px;position:relative;top:4px;float: left;margin-left:60px;}
	.categories_last{cursor:pointer;}
	#mylocation{width:60px;}
	.mylocationtext{font-size:14px; padding-left:5px;padding-top:10px;display:inline-block}
	.catetext{font-size:12px;padding-left:4px;padding-top:65px;display:inline-block;}
	
	#slidebar{margin-bottom:20px;margin-top:80px; height:auto;width:100%;position:relative;}
	.slidetitle{padding-top:30px;width:550px;margin-left:220px;font-size:18px; }
	.slidebars{border:1px solid lightgrey; width:550px; margin-left:220px;margin-top:20px; height:200px;position:relative;}


	#category_icon_a{background: url("img/icon/icon_A.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_b{background: url("img/icon/icon_B.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_c{background: url("img/icon/icon_C.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_d{background: url("img/icon/icon_D.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_e{background: url("img/icon/icon_E.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_f{background: url("img/icon/icon_F.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_g{background: url("img/icon/icon_G.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_h{background: url("img/icon/icon_H.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_i{background: url("img/icon/icon_I.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 
/*
	#category_icon_a{background: url("img/icon/icon_A.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_b{background: url("img/icon/icon_B.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_c{background: url("img/icon/icon_C.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_d{background: url("img/icon/icon_D.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_e{background: url("img/icon/icon_E.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_f{background: url("img/icon/icon_F.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_g{background: url("img/icon/icon_G.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_h{background: url("img/icon/icon_H.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
	#category_icon_i{background: url("img/icon/icon_I.png");width: 60px; height: 60px; border-radius: 50%; background-size: 40px;background-position: center;background-repeat: no-repeat;}
*/

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body>

<div style="position:absolute;left:0px;top:0px;">
<h1><a href="login.do">로그인</a></h1>
<h1><a href="home.do">테스트</a></h1>
<h1><a href="sungsu.do">성수입장</a></h1>
<h1><a href="yoonho.do">윤호입장</a></h1>
<h1><a href="haekang.do">해강입장</a></h1>
</div>

<div id="container">
	<div id="message1">더 넓은 세상을 선물하세요<img id="footprint1" src="./img/footprint1.png"></div>
	
	<form id="search">
	  <input type="text" id="searchbar" class="form-control pull-left" placeholder="지역명, 지하철역, 매장명으로 검색">
	  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
	</form>
	
	<div id="category">
		<div class="categorybox">
			<div class="categories" onclick="location.href='map.do'"><span class="catetext">&emsp;전체</span></div>
			<div class="categories" id="category_icon_a"><span class="catetext">동물병원</span></div>
			<div class="categories" id="category_icon_b"><span class="catetext">카페/식당</span></div>
			<div class="categories" id="category_icon_c"><span class="catetext">식품/용품</span></div>
			<div class="categories" id="category_icon_d"><span class="catetext">동반숙박</span></div>
		</div>
		<div class="categorybox">
			<div class="categories" id="category_icon_e"><span class="catetext" style="font-size: 10.5px;padding-left:2px">돌봄서비스</span></div>
			<div class="categories" id="category_icon_f"><span class="catetext">미용/목욕</span></div>
			<div class="categories" id="category_icon_g"><span class="catetext">체험/활동</span></div>
			<div class="categories" id="category_icon_h"><span class="catetext">교배/분양</span></div>
			<div class="categories" id="category_icon_i"><span class="catetext">&emsp;장례</span></div>
		</div>
		<div class="categorybox">
			<div class="categories_invisible"></div>
			<div class="categories_invisible"></div>
			<div class="categories_last">
				<img id="mylocation" src="./img/icon/mylocation2.png" />
				<span class="mylocationtext">내 주변</span>
			</div>
			<div class="categories_invisible"></div>
			<div class="categories_invisible"></div>
		</div>
	</div>

		<div id="slidebar">
			<div class="slidebarbox">
				<div class="slidetitle"
					style="border: 1px solid white; border-top-color: lightgrey; border-top-width: 1px; padding-top: 70px;">이런곳은
					어떠세요?</div>
				<div class="slidebars">
					<a href="user_interests_recommended.do">검색하자테스트</a>
					<form action="user_interests_recommended.do" method="post">
						<table border="1">
							<tr>
								<td>
								<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan="10">---추천 상점 AI를 로딩중이다냥---</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="dto">
												<tr>
												    <td>${dto.store_name}</td>
													<td>${dto.store_seq}</td>
													
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<div class="slidebarbox">
				<div class="slidetitle">동물병원 랭킹~</div>
				<div class="slidebars">이안에매장들</div>
			</div>
			<div class="slidebarbox">
				<div class="slidetitle">신난ㄷ나</div>
				<div class="slidebars">이안에매장들</div>
			</div>
		</div>

	</div>



</body>
<footer> 
	<div id="main1"> 
		<div id="f1">
			<img alt="" src="./img/logo1.png" style="width: 140px;">
		</div>
		<div id="f2">
			(주)어디가개|대표이사:신윤호|사업자 등록번호 :220-87-42885|통신판매업신고:양평동 000호 <br/>
			메일:syhnz1102@gmail.com|관광사업자 등록번호:제2016-31호|주소:서울 양평동 한경닷컴 401호<br/>
			호스팅서비스 제공자:주식회사 어디가개|고객센터 :1644-1346(오전 9시~익일 새벽3시)<br>
			<br>
			(주)어디가개는 통신판매 중개자로서 통신판매의 당사자가 아니며<br>
			상품의 예약, 이용 및 환불 등과 관련한 의무와 책임은 각 판매자에게 있습니다.
		</div>
	</div> 
</footer>
</html>
