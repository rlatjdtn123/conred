<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.QnaDto"%>
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
	
	
	
	.pf{float: left; width: 40px;height: 40px;}      
	.dt{margin-left: 600px;}
	.info{}   
	.contents{display:inline-block; width: 450px;height:25px;text-overflow: ellipsis; overflow: hidden;}
	.contents2{width:430px;}         
	.info2{background-color: #F2F2F2;  height: 60px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 450px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.myboxmargin{margin-top:30px;}      
	.store_img{width: 200px;height:170px;border: 1px solid black; float: left;margin-right: 20px;} 
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:720px;height:200px; font-size: 15px; margin-left: 100px;}
	.bigtle{margin-left: 40px;}    
	button {border: 0;}
	  
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
			url:"qna_ajax.do",
			method:"post",
			data:{"pnum":count},
			dataType:"json", 
			success:function(obj){				
				var lists=obj.list; //[dto,dto,dto..]
				$.each(lists, function(i){    		
					addContent += '	<div class="bigtle"> '
								+	'	<div class="mybox">   '
									+	' 	<div class="store_img">'
									+	' 		<p>매장사진들어갈곳</p>'
									+	' 		<p>+매장명</p> '
									+	' 	</div>      '
									+	'	<img src="./img/profile_default.png" class="pf"/>'
									+	'	<div class="info">  '
									+	'		<button style="margin-left: 235px;">수정</button> <button >삭제</button> <button  class="content_detail">자세히 보기</button><br>'
										+	'	<span>닉네임 :'+ lists[i].user_id +' &nbsp;| 가격문의 </span><br><br>   '
										+	'	<div class="contents">'+ lists[i].qna_content +'</div>    '
									+	'	</div>   '
									+	'	<div class="info2">     '
										+	'	<span style="font-weight: bold;">가게답변</span><br>'
									+	'	<div class="contents contents2">'+ lists[i].qna_answer +'</div>'
									+	'	</div>  '
								+	'	</div>'
							+	'	</div>   '
							+	'	<br><br>';				
// 						if(lists[i].qna_answer==null||lists[i].qna_answer.equals("")){
// 							$(".contents2").text("===미답변===");
// 						}			 
						}); 
						
						 $('.bigbig').append(addContent); 
			}
			});
		
	        }
		};
	
	
	
	
	
	
	
	
	
	
	
	$(function(){
		$(".content_detail").click(function(){     
			if($(this).parent().parent().css("height")=="200px"){  
				$(this).parent().parent().find(".info2").css("height","auto");
				$(this).parent().parent().css("height","auto"); 
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().find(".info2").css("height","60px");
				$(this).parent().parent().css("height","200px");    
				$(this).parent().parent().find(".contents").css({"height":"25px","overflow":"hidden","word-break":"keep-all"});
			}   
		});      
  
	});  
	 
</script>
</head>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
%>
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
		<%
			for(QnaDto dto: list){
		%>	
		<div class="bigtle">
			<div class="mybox">   
			 	<div class="store_img">
			 		<p>매장사진들어갈곳</p>
			 		<p>+매장명</p> 
			 	</div>      
				<img src="./img/profile_default.png" class="pf"/>
				<div class="info">  
					<button style="margin-left: 235px;">수정</button> <button >삭제</button> <button  class="content_detail">자세히 보기</button><br>
					<span>닉네임 :<%=dto.getUser_id()%> &nbsp;| 가격문의 </span><br><br>   
					<div class="contents"><%=dto.getQna_content()%></div>    
				</div>   
				<div class="info2">     
					<span style="font-weight: bold;">가게답변</span><br>
					<%
					if(dto.getQna_answer()==null||dto.getQna_answer().equals("")){
					%>
						<div class="contents contents2">----미답변----</div>
					<%	
					}else{
					%>
						<div class="contents contents2"><%=dto.getQna_answer()%></div>
					<%	 						
					}
					%>
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