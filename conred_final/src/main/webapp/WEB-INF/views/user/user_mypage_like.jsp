<%@page import="com.hk.conred.dtos.LikeDto"%>
<%@page import="java.util.List"%>
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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	.store_img{width: 200px;height:200px;border: 1px solid black; float: left; margin-left: 100px;} 
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:500px;height:200px; font-size: 15px; margin-left: 300px;}
	.myboxmargin{margin-top:30px;}
	.bigtle{margin-left: 50px;}
	
</style>
<script type="text/javascript">
	 
	//무한스크롤	
	var count = 1;
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) { 
	    	//실행할 로직 (콘텐츠 추가)  
	        count++;
	        var addContent="";
	        ////////////////////////////////// A JAX
	        $.ajax({
			url:"user_like_ajax.do",
			method:"post",
			data:{"pnum":count},
			dataType:"json", 
			success:function(obj){				
				var lists=obj.list; //[dto,dto,dto..]
				$.each(lists, function(i){    		
					addContent += '<div class="bigtle">'
										+	'<div class="store_img">' 
										 +		'<p>매장사진들어갈곳</p>'
										 +		'<p>+매장명('+ lists[i].store_name +')</p> '
										 +	'</div>'
										 +	'<div class="mybox">'
										 +		'<span>주소 : '+ lists[i].store_address +'  </span><br><br>'
										 +		'<span>'+ lists[i].store_intro_simple +' </span><br><br>'
										 +		'<div style="margin-left: 350px; margin-top: 20px;">'
											+ 		'<button type="button">좋아요취소</button>'
										 	+	'</div> '
										 	+'</div> '	   
										+'</div> '
										+'<br><br> ';
						}); 
						 $('.bigbig').append(addContent); 
				 
			}
			});
		
	        }
		};
	
</script>
</head>
<% 
	List<LikeDto> list=(List<LikeDto>)request.getAttribute("list");
%>
<body>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='user_mypage.do'">
				마이페이지
			</div>
			<div class="navis2 home" onclick="location.href='user_mypage_like.do'">
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
		<b>찜 목록</b>
	</div> 
	<%
		for(LikeDto dto: list){
	%>
		<div class="bigtle">
			<div class="store_img"> 
		 		<p>매장사진들어갈곳</p>
		 		<p>+매장명(<%=dto.getStore_name()%>)</p> 
		 	</div> 
		 	<div class="mybox">
		 		<span>주소 : 서울 영등포  </span><br><br>
		 		<span> <%=dto.getStore_intro_simple()%> </span><br><br>
		 		<div style="margin-left: 350px; margin-top: 20px;">
			 		<button type="button">좋아요취소</button>
		 		</div> 
		 	</div> 	    
		</div> 
		<br><br>  
	<%
		}
	%>   
	<div class="bigbig">
		
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 