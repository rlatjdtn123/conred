<%@page import="com.hk.conred.dtos.SDto"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{z-index:200;position: sticky; top:71px;}
	#navi2{width:999px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.7px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{transition:all .3s;border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#photozone{width:100.1%; height:400px;border:1px solid grey;}
	
	.s_bold{font-size:20px;font-weight: bold;display:block;}
	.s_bold2{font-size:15px;font-weight: bold;}
	.s_week{font-size:15px;width:70px;display: inline-block;}
	.redfont{color:red;}

	.section{width:900px;display: inline-block;}
	#infobox_title{ height:290px;}
/* 	#infobox_timeaddr{ height:230px;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;} */
	#infobox_timeaddr{ height:auto;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;}
	
/* 	#infobox_intro{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
/* 	#infobox_menu{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
	
	.infobox{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	.infobox:last-child{text-align: left; border-bottom-width: 0px;height:auto;padding:30px 15px 80px;}
	
	.info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;padding:30px 15px;}
	.info2{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px; padding:30px 15px;}
	.width1{width:650px}
	.width2{width:250px}
	.seroline{border-right: 1px solid grey }
	
	#s_state{font-size:15px;color:#3ADF00;font-weight: bold;display: inline-block;}
	.medal{width:30px;padding-bottom:13px}
	#s_title{font-size:30px;display: inline-block;}
	#s_intro_small{height:60px;font-size:15px;display:inline-block;}

	#s_cates{overflow: auto;}
	.s_cate{float:left; font-size:12px;width:45px;text-align: center;}
	.icons{width:35px;padding-bottom: 12px;}

	#s_reviews{width:auto;}
	#s_star{font-size:25px;display:block;width:190px;}
	.s_btn{height:28px;line-height:28px;font-size:15px;display: inline-block; width:190px;background-color: #F2F2F2;padding:0px 5px; border-radius: 5px;text-align: center;}
	.s_btn:hover{cursor: pointer;background-color: lightgrey}
	
	#addr{height:60px;font-size:15px;}
	.s_mapbtn{z-index:0;}
	.s_phone{font-size:15px;}
	
	#s_menubox{height:auto;}
	#s_menu{text-align: center;}
	
	.replyqna{height: 250px; width:410px; background-color: #f2f2f2;border-radius: 5px;margin-top: 20px;}
	.marginleft{margin-left: 50px;}
	
	.flleft{float: left;}
	.flright{float: right;}
	.clrboth{clear: both;}
	
	hr{width:900px;border:0.5px solid grey;}
	
	#reserve_btn{position: sticky; bottom:0px;width:1000px;height:60px;background-color: #D8D8D8;margin:0 auto;border:1px solid grey;border-radius: 10px 10px 0px 0px;border-bottom: 0px;}
	#reserve_btn:hover{background-color: white;cursor: pointer;height:80px; transition:all .3s;}
	#reserve_btn:hover #reserve_text{font-size:25px; transition:all .3s;}
	#reserve_text{width:300px;margin:0 auto;text-align: center;line-height: 60px;font-size:20px;}

	.mname{border-top-width: 0px !important;font-size:18px;height:30px;text-align: left;}
	.mnametext{background-color: #f5f5f5;border-radius: 5px 5px 0px 0px;padding: 11px 31px 11px;border: 1px solid #ddd;border-bottom-width: 0px;}
</style>
</head>
<body>
<%
	//내 (세션)sldto.getStore_seq()와 이 (파라미터)sdto.getStore_seq()가 맞는지
	// 	SDto sdto =  >>>>>>스크립트릿에서하는법이뭐더라 jstl로 하자. 
	
//		뿌려줄 값 model 이름들
//			store_detail// 영업시간
// 			list_stime// 영업시간
// 			cmain// 대분류카테고리
// 			list_clist// 소분류카테고리
// 			list_menu// 메뉴

//		내 매장인지/타인 매장인지 여부 확인용
// 			s_seq//현재 매장 번호
// 			sldto//로그인중인 사람의 매장정보 (세션)
%>
<div id="container">
	<c:if test="${sldto!=null}"> <!-- 매장을 가지고 있지 않으면(로그인 안되어있으면) -->
		<c:if test="${s_seq eq sldto.store_seq}"> <!-- 내 매장과 이 매장이 같으면(로그인 안되어있으면) -->
			<div id="sticky">
				<div id="navi2">
					<div class="navis2 home" onclick="location.href='store.do'">
						매장 홈
					</div>
					<div class="navis2" onclick="location.href='owner_mystore_update.do'">
						매장정보 수정
					</div>
					<div class="navis2" onclick="location.href='owner_mystore_reservation.do'">
						예약관리
					</div>
					<div class="navis2" onclick="location.href='owner_mystore_review.do'">
						리뷰관리
					</div>
					<div class="navis2" onclick="location.href='owner_mystore_qna.do'">
						문의관리
					</div>
				</div>
			</div>
		</c:if>
	</c:if>
	
	<div id="photozone">
	carousel
	</div>
	<div id="infobox_title" class="section">
		<div class="info1 width1" >
			<div><span id="s_state">영업중</span></div>
			<div>
				<img class="medal" alt="" src="./img/gold.png">
<!-- 				<span id="s_title">댕댕미용실 -->
				<span id="s_title">${store_detail.store_name}
				</span>
			</div>
			<div id="s_cates">
				<div class="s_cate">
					<img class="icons" title="미용실" src="./img/profile_default.png">
				</div>
				<div class="s_cate">
					<img class="icons" title="애견용품" src="./img/profile_default.png">
				</div>
				<div class="s_cate">
					<img class="icons" title="애견카페" src="./img/profile_default.png">
				</div>
			</div>
<!-- 			<div id="s_intro_small">고양이도 개처럼 만들어주는 댕댕미용실</div> -->
			<div id="s_intro_small">${store_detail.store_intro_simple}</div>
			<div id="s_reviews">
				<div id="s_star">★★★★☆ 4.7<span>/5</span></div>
				<div class="s_btn" onclick="location.href='review.do'">리뷰 | 999+</div>
			</div>
		</div>
		<div class="info2 width2" >
			<br>
<!-- 			<div><span  class="s_phone">매장번호 :</span><span>02-111-1111</span></div> -->
<!-- 			<div><span class="s_phone">담당자번호 :</span><span>010-1111-1111</span></div> -->
			<div><span  class="s_phone">매장번호 :</span><span>${store_detail.store_phone}</span></div>
			<div><span class="s_phone">담당자번호 :</span><span>${store_detail.store_phone_manager}</span></div>
		</div>
	</div>
<!-- 	<hr> -->
	<div id="infobox_timeaddr" class="section">
		<div class="info1 seroline" >
			<div class="s_bold">영업시간</div>
			<br>
			<c:forEach var="i" begin="0" end="7" step="1">
				<div>
					<span class="s_week">${list_stime[i].store_time_day}</span>
					<c:choose>
						<c:when test="${list_stime[i].store_time_open.indexOf('00:00')!=-1&&list_stime[i].store_time_close.indexOf('00:00')!=-1}">
							<span>24시간 영업중</span>
						</c:when>
						<c:otherwise>
							<span>${list_stime[i].store_time_open}</span>~<span>${list_stime[i].store_time_close}</span>
						</c:otherwise>
					</c:choose>
				</div>
			</c:forEach>
			
			<div class="s_bold2 redfont"><br>${store_detail.store_time_other}</div>
		</div>
		<div class="info1" >
			<div class="s_bold">주소</div>
			<br>
			<div id="addr">
				<span>${store_detail.store_address}</span><br>
				<span>${store_detail.store_address_detail}</span>
			</div>
			<div id="addr_detail"></div>
			<div class="s_btn s_mapbtn" onclick="location.href='map.do'">
				지도 바로가기
			</div>
		</div>
	</div>
	<div class="infobox section">
		<div class="s_bold">매장소개</div>
		<br>
		<div class="s_intro_big">
			${store_detail.store_intro}
		</div>
	</div>
	<div class="infobox section">
		<div class="s_bold">메뉴</div>
		<br>
		<div id="s_menubox">
		
<!-- 		대분류 갯수만큼 돌리되 -->
<!-- 		if A면 동물병원div 출력 후 밑에 테이블 생성 해서 A인 애들만 출력  -->
<!-- 		흠.. 차라리 컨트롤러에서 대분류별로 나눠주고 addattribute해보자  -->
<!-- 			<table id="s_menu" class="table"> -->
<%-- 				<col width="200px"> --%>
<%-- 				<col width="500px"> --%>
<%-- 				<col width="150px"> --%>
				
<!-- 						<tr> -->
<!-- 							<td class="mname" colspan="3">동물병원 메뉴</td> -->
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<td class="active"><b>메뉴명</b></td> -->
<!-- 							<td class="active"><b>설명</b></td> -->
<!-- 							<td class="active"><b>가격</b></td> -->
<!-- 						</tr> -->
<%-- 						<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 --> --%>
<!-- 							<tr> -->
<%-- 								<td>${list_menu[i].menu_name}</td> --%>
<%-- 								<td>${list_menu[i].menu_content}</td> --%>
<%-- 								<td>${list_menu[i].menu_price}원</td> --%>
<!-- 							</tr> -->
<%-- 						</c:forEach> --%>

<!-- 			</table> -->
			<table id="s_menu" class="table">
				<col width="200px">
				<col width="500px">
				<col width="150px">
					
				<c:forEach var="i" begin="0" end="${list_menu.size()-1}" step="1"><!-- 얘는 리스트 사이즈 -->
						<c:choose>
							<c:when test="${i==0}">
								<tr>
									<td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
								</tr>
								<tr>
									<td class="active"><b>메뉴명</b></td>
									<td class="active"><b>설명</b></td>
									<td class="active"><b>가격</b></td>
								</tr>
							</c:when>
							<c:when test="${list_menu[i-1].category_code != list_menu[i].category_code}">
								<tr>
									<td class="mname" colspan="3"></td>
								</tr>
								<tr>
									<td class="mname" colspan="3"><span class="mnametext">${list_menu[i].category_name} 메뉴</span></td>
								</tr>
								<tr>
									<td class="active"><b>메뉴명</b></td>
									<td class="active"><b>설명</b></td>
									<td class="active"><b>가격</b></td>
								</tr>				
							</c:when>
						
						</c:choose>
	
						<tr>
							<td>${list_menu[i].menu_name}</td>
							<td>${list_menu[i].menu_content}</td>
							<td>${list_menu[i].menu_price}원</td>
						</tr>
								
	
				</c:forEach>
			</table>
		</div>
	</div>
	<div class="infobox section">
		<div class="s_bold flleft">리뷰</div>
		<div class="s_btn flright" onclick="location.href='review.do'">전체보기</div>
			<div id="s_reviews" class="clrboth">
				<div id="s_star">★★★★☆ 4.7<span>/5</span></div>
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
		<div class="info1 replyqna flleft clrboth">
		</div>
		<div class="info1 replyqna marginleft flright">
		</div>
	</div>
	<div class="infobox section">
		<div class="s_bold flleft">문의</div>
		<div class="s_btn flright" onclick="location.href='qna.do'">전체보기</div>
		<div class="info1 replyqna flleft clrboth">
		</div>
		<div class="info1 replyqna marginleft flright">
		</div>
	</div>
</div>
	<div id="reserve_btn"><div id="reserve_text">예약하러가기</div></div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />