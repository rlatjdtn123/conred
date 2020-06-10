<%@page import="com.hk.conred.dtos.ReplyDto"%>
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
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> 
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
			url:"review_ajax.do",
			method:"post",
			data:{"pnum":count},
			async: false,
			dataType:"json",
			success:function(obj){				
				var lists=obj.list; //[dto,dto,dto..]
				$.each(lists, function(i){  
					addContent += ' <div class="bigtle"> '
						+   '<div class="mybox">     '
						+ 	'<div class="store_img">     '
					 +	'	<p>매장사진들어갈곳</p>'
					 +	'	<p>+매장명</p>   '
					 +	'</div>  '    
					+	'<img src="./img/profile_default.png" class="pf"/>  '
					+	'<div class="info">        '
					+	'	<span >★★★★★</span><button style="margin-left: 206px;">삭제</button> <button  class="content_detail">자세히 보기</button><br>' 
					+	'	<span>닉네임:'+ lists[i].user_id +' &nbsp;| 미용 / 컷트 </span><br>  '
					+		'<div class="user_review_img" ></div>'
					+	'	<div class="contents">'+ lists[i].reply_content +'</div>     '  
					+	'</div>  '
					+	'<div class="info2">    '
					+	'	<span style="font-weight: bold;">가게답변</span><br>  '
					+	'	<div class="contents contents2">'+ (lists[i].reply_answer==null?'---미답변---':lists[i].reply_answer) +'</div>'
					+	'</div>'
				+	'</div>  ' 
				+    ' </div> '
				+     '<br><br>';	 
			 	
				}); 
				
				 $('.bigbig').append(addContent); 
				 
			}
			}); 
	        
	     		
	              
	    }
	};
	
	
	
	
	$(function(){
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="220px"){  
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
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;}
	
	   
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{min-height: 95px;}    
	.contents{display:inline-block; width: 450px;height:25px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;min-height: 25px;}     
	.contents2{width:430px;}     
	.info2{background-color: #F2F2F2;  height: 66px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 450px; min-height: 66px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.myboxmargin{margin-top:30px;}      
	.store_img{width: 200px;height:170px;border: 1px solid black; float: left;margin-right: 20px;} 
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:720px;height:220px; font-size: 15px; margin-left: 100px;min-height: 220px;}
	.bigtle{margin-left: 40px;}          
	       
	     
	 .modal-title{margin-left: 400px;} 
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left;}
	input[type=file] {display: none;}
     .my_button {
         display: inline-block; width: 200px;  text-align: center; padding: 10px; background-color: #006BCC;color: #fff;
         text-decoration: none; border-radius: 5px;}
     .imgs_wrap { width: 700px;}
     .imgs_wrap img {max-width: 150px;margin-left: 5px;margin-right: 5px;}
	.input_wrap {clear: both;} 
	button {border: 0;  } 
	 .user_review_img{border: 1px solid red;width: 490px;height: 50px;margin-left: 207px;}
	 
</style>
</head>
<%
	List<ReplyDto> list=(List<ReplyDto>)request.getAttribute("list");
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
			<div class="navis2 home" onclick="location.href='user_mypage_review.do'">
				내 리뷰
			</div>
			<div class="navis2" onclick="location.href='user_mypage_qna.do'">
				내 문의
			</div>
		</div>
	</div>
	<div id="pagename">
		<b>작성한 리뷰</b>  
	</div> 
	<div></div>
	<%
		for(ReplyDto dto : list){ 
 	%> 
	<div class="bigtle" > 
		<div class="mybox">     
		 	<div class="store_img">     
		 		<p>매장사진들어갈곳</p>
		 		<p>+매장명</p>    
		 	</div>      
			<img src="./img/profile_default.png" class="pf"/>  
			<div class="info">        
				<span >★★★★★</span><button style="margin-left: 206px;">삭제</button> <button  class="content_detail">자세히 보기</button><br> 
				<span>닉네임:<%=dto.getUser_id()%> &nbsp;| 미용 / 컷트 </span><br>
				<div class="user_review_img" ></div>     
<%-- 				<div class="contents"><%=dto.getReply_content()%></div> --%>
				<div class="contents">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
			</div>   
			<div class="info2">     
				<span style="font-weight: bold;">가게답변</span><br>
				<%
					if(dto.getReply_answer()==null||dto.getReply_answer().equals("")){
						%>
<!-- 							<div class="contents contents2">---미답변---</div> -->
							<div class="contents contents2">ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
						<%
					}else{ 
						%>
							<div class="contents contents2"><%=dto.getReply_answer()%></div>						
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