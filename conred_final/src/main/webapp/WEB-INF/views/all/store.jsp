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
	#container{text-align:center; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:999px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.7px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#photozone{width:100.1%; height:400px;border:1px solid grey;margin-top:19px;}
	
	.s_bold{font-size:20px;font-weight: bold;display:block;}
	.s_bold2{font-size:15px;font-weight: bold;}
	.s_week{font-size:15px;width:70px;display: inline-block;}
	.redfont{color:red;}

	.section{width:900px;display: inline-block;}
	#infobox_title{ height:290px;}
	#infobox_timeaddr{ height:230px;border:0px solid grey;border-top-width: 0.5px;border-bottom-width: 0.5px;}
	
/* 	#infobox_intro{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
/* 	#infobox_menu{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;} */
	
	.infobox{text-align: left; height:auto;border:0px solid grey;border-bottom-width: 0.5px;padding:30px 15px;}
	.infobox:last-child{text-align: left; border-bottom-width: 0px;height:auto;padding:30px 15px 80px;}
	
	.info1{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px;padding:30px 15px;}
	.info2{width:449.5px;height:100%; text-align: left;float: left;margin-bottom: 0px; padding:30px 15px;}
	.width1{width:650px}
	.width2{width:250px}
	.seroline{border-left: 1px solid grey }
	
	#s_state{font-size:15px;color:#3ADF00;font-weight: bold;display: inline-block;}
	.medal{width:30px;padding-bottom:13px}
	#s_title{font-size:30px;display: inline-block;}
	#s_tinfo{height:60px;font-size:15px;display:inline-block;}

	#s_cates{overflow: auto;}
	.s_cate{float:left; font-size:12px;width:45px;text-align: center;}
	.icons{width:35px;padding-bottom: 12px;}

	#s_reviews{width:auto;}
	#s_star{font-size:25px;display:block;width:190px;}
	.s_btn{height:28px;line-height:28px;font-size:15px;display: inline-block; width:190px;background-color: #F2F2F2;padding:0px 5px; border-radius: 5px;text-align: center;}
	.s_btn:hover{cursor: pointer;background-color: lightgrey}
	
	#addr{height:60px;font-size:15px;}
	.s_mapbtn{float: right;margin-top: 40px;position:relative;bottom: 0px;}
	.s_phone{font-size:15px;}
	
	#s_menubox{height:auto;}
	#s_menu{text-align: center;}
	
	.replyqna{height: 250px; width:410px; background-color: #f2f2f2;border-radius: 5px;margin-top: 20px;}
	.marginleft{margin-left: 50px;}
	
	.flleft{float: left;}
	.flright{float: right;}
	.clrboth{clear: both;}
	hr{width:900px;border:0.5px solid grey;}
	
	
</style>
</head>
<body>
<div id="container">
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

	<div id="photozone">
	carousel
	</div>
	<div id="infobox_title" class="section">
		<div class="info1 width1" >
			<div><span id="s_state">영업중</span></div>
			<div>
				<img class="medal" alt="" src="./img/gold.png">
				<span id="s_title">댕댕미용실
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
			<div id="s_tinfo">고양이도 개처럼 만들어주는 댕댕미용실</div>
			<div id="s_reviews">
				<div id="s_star">★★★★☆ 4.7<span>/5</span></div>
				<div class="s_btn" onclick="location.href='review.do'">리뷰 | 999+</div>
			</div>
		</div>
		<div class="info2 width2" >
			<br>
			<div><span  class="s_phone">매장번호 :</span><span>02-111-1111</span></div>
			<div><span class="s_phone">담당자번호 :</span><span>010-1111-1111</span></div>
		</div>
	</div>
<!-- 	<hr> -->
	<div id="infobox_timeaddr" class="section">
		<div class="info1" >
			<div class="s_bold">영업시간</div>
			<br>
			<div>
				<span class="s_week">평일</span>
				<span>09:00</span>~<span>17:00</span>
			</div>
			<div>
				<span class="s_week">토요일</span>
				<span>10:00</span>~<span>13:00</span>
			</div>
			<div class="s_bold2 redfont">매주 월요일, 일요일 휴무</div>
		</div>
		<div class="info1 seroline" >
			<div class="s_bold">주소</div>
			<br>
			<div id="addr">
				<span>한경한경시 한경구 한경동</span><br>
				<span>한경한경시 한경구 한경동</span><br>
				<span>경빌딩 404호</span>
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
		<div class="s_content">고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼
		 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고
		 양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 
		 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼
		  만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양이도 개처럼 만들어주는 댕댕미용실고양
		  이도 개처럼 만들어주는 댕댕미용실</div>
	</div>
	<div class="infobox section">
		<div class="s_bold">메뉴</div>
		<br>
		<div id="s_menubox">
			<table id="s_menu" class="table">
				<col width="200px">
				<col width="500px">
				<col width="150px">
				<tr>
					<td class="active"><b>메뉴명</b></td>
					<td class="active"><b>설명</b></td>
					<td class="active"><b>가격</b></td>
				</tr>
				<tr>
					<td>댕댕컷트</td>
					<td>어떤 동물이든 댕댕이가 되는 컷트입니다</td>
					<td>60000원</td>
				</tr>
				<tr>
					<td>냥냥컷트</td>
					<td>어떤 동물이든 냥이가 되는 컷트입니다</td>
					<td>60000원</td>
				</tr>
				<tr>
					<td>성수컷트</td>
					<td>어떤 동물이든 성수가 되는 컷트입니다</td>
					<td>850000원</td>
				</tr>
				<tr>
					<td>개파마</td>
					<td>개파마입니다</td>
					<td>80원</td>
				</tr>
				
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
</body>
</html>
<jsp:include page="../all/footer.jsp" />