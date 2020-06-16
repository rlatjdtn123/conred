<%@page import="com.hk.conred.dtos.SDto"%>
<%@page import="com.hk.conred.dtos.ODto"%>
<%@page import="com.hk.conred.dtos.UDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image⁄x-icon" href="./img/footprint1.png">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>어디가개!? 반려동물과 함께하는 모든 곳</title>
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
	body{margin:0;}
	header{border:1px solid grey;border-top-width:0px;border-bottom-color:lightgrey; height:70px;width:100%;}
	#logo{width:400px; display: block; margin: 0 auto;position:relative; top:13px;}
	#logo:hover{cursor: pointer;}
	#secondheader{background-color:#fff; z-index:1;border:1px solid grey;border-top-width:0px; height:71px;width:100%;box-shadow: 0px 0.5px 2px grey;position:sticky;top:0px;text-align:center;}
	#categorybox{width:655px;display: inline-block;padding:5px;}
	.categories{background-color:#fff;border:1px solid grey; border-radius: 10px; width:60px; height:60px;position:relative;float: left;margin-left:5px;border:0.5px solid #E6E6E6;}
	.categories_first{border:1px solid grey; border-radius: 10px; width:60px; height:60px;position:relative;float: left;border:0.5px solid #E6E6E6;}
	.categories:hover{cursor:pointer;box-shadow: 0px 1px 2px #000;}
	.categories_first:hover{cursor:pointer;box-shadow: 0px 1px 2px #000;}
	#profilebox{width:200px;height:30px;float:right;position: absolute; top: 25px; right: 12px;}
	.profile{float:right; height:100%;line-height: 23px;padding-right:10px;}
	#navibox{float:right;width:380px;height:30px; padding-right:15px;clear:both;position: absolute; bottom: 20px; right: 0px;}
	.navis{float:right; padding-right: 5px;padding-left: 5px;height:100%;line-height: 30px;border-radius: 3px;}
	.navis:hover{cursor: pointer; background-color: lightgrey;transition:all .3s;}
	#profilepic{width:30px;float:right;padding-right:10px;}
	
	#search{padding-top:18px;width:25%;position:absolute;left:20px;min-width: 322px;}
	#searchbar{width:280px;}
	#searchbtn{padding:3px;width:40px;height:35px;float: left;}
	#magnifyglass{width:20px;}
	.display_none{display: none;}
	
	#category_icon_a{background: url("./img/icon/icon_A.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_b{background: url("./img/icon/icon_B.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_c{background: url("./img/icon/icon_C.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_d{background: url("./img/icon/icon_D.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_e{background: url("./img/icon/icon_E.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_f{background: url("./img/icon/icon_F.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_g{background: url("./img/icon/icon_G.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_h{background: url("./img/icon/icon_H.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 	#category_icon_i{background: url("./img/icon/icon_I.png");width: 60px; height: 60px; border-radius: 10px; background-size: 50px;background-position: center;background-repeat: no-repeat;} 
 
</style>
</head>
<body>
<header>
	<%
		UDto uldto=(UDto)session.getAttribute("uldto");
		ODto oldto=(ODto)session.getAttribute("oldto");
		SDto sdto=(SDto)session.getAttribute("sdto");
	%>
	
	<img id="logo" alt="logo2" src="./img/logo2.png" onclick="location.href='index.jsp'"><!-- 나중에 세션에따라 이동되는페이지 달라지게 바꾸기 -->
	
	
	<%
		if(uldto==null&&oldto==null){/* 어떤 등급도 로그인이 되어있지 않으면 */
	%>
			<!-- 비회원 -->
			<div id="profilebox">
				<div id="tologin" class="profile">비회원<span>입니다.</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("user")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==user인 경우 */
	%>
			<!-- 사용자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>회원님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
	<%
		}else if(uldto==null&&oldto!=null){/*사용자는 비로그인, 점주는 로그인인 경우 */
	%>
			<!-- 점주 --> 
			<div id="profilebox">
				<div id="tologin" class="profile"><%=oldto.getOwner_name() %><span>사장님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("admin")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==admin인 경우 */
	%>
			<!-- 관리자 -->
			<div id="profilebox">
				<div id="tologin" class="profile"><%=uldto.getUser_name() %><span>관리자님</span></div>
				<img id="profilepic" src="./img/profile_default.png"/><!-- 해당 유저의 프로필사진 -->
			</div>
	<%
		}
	%>
</header>
<div id="secondheader">
			<form id="search">
			  <input type="text" id="searchbar" class="form-control pull-left" placeholder="지역명, 지하철역, 매장명으로 검색">
			  <button type="submit" id="searchbtn" class="btn"><img id="magnifyglass" src="./img/magnifyglass.png"></button>
			</form>

	<div id="categorybox">
		<div class="categories_first" title="전체카테고리 검색"></div>
		<div id="category_icon_a" class="categories" title="동물병원"></div>
		<div id="category_icon_b" class="categories" title="카페/식당"></div>
		<div id="category_icon_c" class="categories" title="식품/용품"></div>
		<div id="category_icon_d" class="categories" title="숙박(글램핑,카라반,팬션,풀빌라,동반가능호텔)"></div>
		<div id="category_icon_e" class="categories" title="돌봄서비스(호텔,펫시터,유치원,펫택시)"></div>
		<div id="category_icon_f" class="categories" title="미용/목욕"></div>
		<div id="category_icon_g" class="categories" title="체험(놀이터,운동장,훈련,수영장,스튜디오 등)"></div>
		<div id="category_icon_h" class="categories" title="교배/분양/유기견"></div>
		<div id="category_icon_i" class="categories" title="장례"></div>
	</div>


	<div id="navibox"> 
	<%
		if(uldto==null&&oldto==null){/* 어떤 등급도 로그인이 되어있지 않으면 */
	%>
<!-- 		비회원 -->
		<div id="toregist" class="navis"  onclick="location.href='select_regist.do'">회원가입</div>
		<div id="tologin" class="navis" onclick="location.href='login.do'">로그인</div>
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("user")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==user인 경우 */
	%>
<!-- 		사용자 -->
		<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
		<div id="u_info" class="navis" onclick="location.href='user_myinfo.do'">나의정보</div>
		<div id="u_mypage" class="navis" onclick="location.href='user_mypage.do'">마이페이지</div>
		<div id="u_like" class="navis" onclick="location.href='user_mypage_like.do'">좋아요</div>
		<div id="u_reserve" class="navis" onclick="location.href='user_mypage_reservation.do'">내 예약</div>
	<%
		}else if(uldto==null&&oldto!=null){/*사용자는 비로그인, 점주는 로그인인 경우 */
	%>
<!-- 		점주 --> 
		<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
		<div id="o_info" class="navis" onclick="location.href='owner_myinfo.do'">나의정보</div>
		<%
		if(uldto==null&&oldto!=null&&sdto!=null){/* 점주이면서, 유저가아니면서, store가 있는사람 에게만 표시 */ 
		%>
			<div id="o_tore" class="navis" onclick="location.href='store.do?store_seq=<%=sdto.getStore_seq()%>'">매장관리</div>
			<div id="o_storeinfo" class="navis" onclick="location.href='owner_mystore_info.do'">매장정보</div>
			<div id="o_reserve" class="navis" onclick="location.href='owner_mystore_reservation.do'">예약</div>
		<%
		}else{/*  점포가 아직 없는 점주에게만 "점포등록버튼" 표시 */ 
		%>
			<div id="o_reserve" class="navis" onclick="location.href='owner_regist_certify.do'">점포등록</div>
		<%
		}
		%>

<!-- 		<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div> -->
<!-- 		<div id="o_info" class="navis" onclick="location.href='owner_myinfo.do'">나의정보</div> -->
<!-- 		<div id="o_tore" class="navis" onclick="location.href='store.do'">매장관리</div> -->
<!-- 		<div id="o_storeinfo" class="navis" onclick="location.href='owner_mystore_info.do'">매장정보</div> -->
<!-- 		<div id="o_reserve" class="navis" onclick="location.href='owner_mystore_reservation.do'">예약</div> -->
	<%
		}else if(uldto!=null&&oldto==null&&uldto.getUser_role().equals("admin")){/*사용자는 로그인, 점주는 비로그인, 사용자등급==admin인 경우 */
	%>
<!-- 		관리자 -->
		<div id="logout" class="navis" onclick="location.href='user_logout.do'">로그아웃</div>
		<div id="a_mypage" class="navis" onclick="location.href='user_myinfo.do'">나의정보</div>
		<div id="a_site" class="navis" onclick="location.href='admin_site.do'">사이트관리</div>
	<%
		}
	%>
	</div>
</div>
</body>
</html>