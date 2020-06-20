<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.QnaDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border-top:1px solid grey;width:700px;height:250px; margin:0 auto; font-size: 15px;min-height: 250px;}
	.myboxmargin{margin-top:30px;}
	#main{width: 702px;height: 100px;margin: 0 auto; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{} 
	.pf{float: left; width: 40px;height: 40px;}      
	.dt{margin-left: 600px;}
	.info{min-height: 144px;}   
	.contents{display:inline-block; width: 631px;height:80px;text-overflow: ellipsis; word-break:keep-all;overflow: hidden;margin-left: 17px;min-height: 80px; padding: 10px;margin-bottom: 15px;}     
	.info2{background-color: #fafafa; margin-left: 42px; height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 580px;min-height: 80px; border-radius: 5px;}
	.bot{margin: 0 auto; text-align: center;}
	
	.modal_Btn{float:right; height: 50px; width: 100px;background-color: #94B8FD; border: 0;border-radius: 5px;color: white;}
	.modal_Btn:hover{background-color: #4a83ed;}  
	.modal-title{margin-left: 400px;}  
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; } 
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left; margin: 10px;}
	button{border-width: 0; }
	button:hover {background-color: grey;}
	.buttondle{background-color: #585858; color: white;border-radius: 5px;}
	.tle_final{width: 700px;border-top: 1px solid grey;margin-left: 150px;margin-bottom: 200px;}
	
	.zxczxc{width: 631px;display: inline-block;} 
	 
	 
</style>
<script type="text/javascript">	      
	//Javascript
	var count = 1;  
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가) 
	        count++;
	    	var addContent="";
	    	var store_seq=$("input[name=store_seq]").val(); 
	    	$.ajax({
	    		url:"qna_ajax.do",
	    		method:"post",
	    		data:{"pnum":count,"store_seq":store_seq},
	    		dataType:"json",
	    		success:function(obj){
	    			var lists=obj.list
	    			$.each(lists, function(i){ 
				       addContent +=  '<div class="mybox">'         
										+	'<img src="./img/profile_default.png" class="pf"/>'
										+	'<div class="info">'
										+	'	<button class="buttondle" style="margin-left:436px;">수정</button> <button class="buttondle">삭제</button> <button  class="content_detail buttondle">자세히 보기</button><br>'
										+	'	<span ><b>닉네임</b>:'+lists[i].user_id+'</span><span>'+ lists[i].qna_regdate +'</span><br>'
										+	'	<div class="contents">'
										+	'		<span class="zxczxc"><b>문의내용</b></span>    '
										+	'		<span>'+ lists[i].qna_content +'</span>    '
						 				+	'	</div>'
										+	'</div>'
										+	'<div class="info2">    '
										+	'	<span><b>가게답변</b></span><br>'
										+	'	<span>'+ (lists[i].qna_answer==null?"아직 답변이 없습니다.":lists[i].qna_answer) +'</span>'
										+	'</div>'
									+	'</div>     ' 
										+'<br><br>';	    				
	    			}); 
		        $('.bigbig').append(addContent);				
	    		}
	    	});
	    }
	};
	
	$(document).ready(function(){
// 		alert($("input[name=session_id]").data('value')); -> 특정 값 가져와야함
		
		
	    $(".modal_Btn").click(function(){
	    	if($(".modal_Btn").val()==1){
		        $("div.modal").modal(); 
 			}else{
 				var yesNo=confirm("로그인 후에 작성 가능합니다. \n\n로그인 하시겠습니까?");
 				if(yesNo){
 					location.href="login.do";
 				}else{
 					
 				}
 			}
	    }); 
	    
	    
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="250px"){   
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","250px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		}); 
	});
	
 
</script> 
</head>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
	QnaDto qnaAvg=(QnaDto)request.getAttribute("qnaAvg");
	UDto uldto=(UDto)session.getAttribute("uldto");
%> 
<body>  
<input type="hidden" name="session_id"  data-value="<%=uldto%>"/>
<!-- Modal -->
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>">
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
  		<!-- Modal content-->
   		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">문의 작성 완료</button>
       			<h4 class="modal-title">가게이름</h4>
     		</div>
     		<div class="modal-footer"> 
       			<textarea rows="20" cols="120" style="resize: none;" placeholder="문의 작성 해주세요."></textarea>
     		</div>
   		</div>
	</div>
</div>
<div id="container"> 
	<div class="bigtle">
		<div id="main">
			<span id="main2"><b>문의</b> &nbsp; &nbsp; &nbsp; &nbsp;전체<%=qnaAvg.getQna_content()%>개|답변<%=qnaAvg.getQna_answer()%>개</span>
			<%
			if(uldto==null){
				%>
				<button class="modal_Btn">문의 작성</button>
				<%
			}else if(uldto!=null){ 
				%>
				<button class="modal_Btn" value="1">문의 작성</button>
				<%
			}
			%>
			<br/><br/> 
		</div> 
		<% 
			for(QnaDto dto:list){
			%>
		    <div class="mybox">         
				<img src="./img/profile_default.png" class="pf"/>
				<div class="info">
					<button class="buttondle" style="margin-left:436px;">수정</button> <button class="buttondle" >삭제</button> <button  class="content_detail buttondle">자세히 보기</button><br>
					<span style="color:#919191;">닉네임:<%=dto.getUser_id()%>|<%=dto.getQna_title()%></span><span style="color:#919191; float: right;"><%=dto.getQna_regdate()%></span><br>
					<div class="contents">
						<span class="zxczxc"><b>문의내용</b></span><br>  
						<%
						if(uldto!=null){
							if(uldto.getUser_id().equals(dto.getUser_id())){
							%>
								<span><%=dto.getQna_content()%></span>    						
							<%	
							}else{
							%> 
								<span style="color:#aaa;">비공개글 입니다.</span>
							<%	
							}
						}else{
							if(dto.getQna_hide().equals("Y")){
							%> 
								<span style="color:#aaa;">비공개글 입니다.</span>
							<%
							}else{
							%>
								<span><%=dto.getQna_content()%></span>
							<%	 
							}
						}
						%>   
					</div>
				</div> 
				<div class="info2">      
					<span><b>가게답변</b></span><br>
					<%
						if(dto.getQna_answer()==null||dto.getQna_answer().equals("")){
							%>
							<span>아직 답변이 없습니다.</span>
							<%
						}else{
							%>
							<span><%=dto.getQna_answer()%></span>
							<%
						}
					%>
				</div>
			</div>      
			<br><br>		 	
			<%
			}
		%> 
		</div>
	<div class="bigbig">
		 
	</div>
	<div class="tle_final"></div>
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 