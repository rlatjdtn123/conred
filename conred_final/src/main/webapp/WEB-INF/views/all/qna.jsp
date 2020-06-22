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
	.info2{background-color: #F2F2F2; margin-left: 42px; height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 580px;min-height: 80px; border-radius: 5px;}
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
	 .nologin{margin-left: 537px;}
	 .qna_content{resize: none;}
	 .qna_title{margin-bottom: 10px; float: left;}
	 .qna_hide{float: left;margin-left: 10px;}
	 .qna_write{height: 34px;float: right;border-color:#ccc;border-radius:5px;}
	 
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
										+   ''+ buttonChk(lists[i].user_id) +''
										+	'	<span style="color:#919191;"><b>닉네임</b>:'+lists[i].user_id+'|'+ lists[i].qna_title +'</span><span style="color:#919191; float: right;">'+ lists[i].qna_regdate +'</span><br>'
										+	'	<div class="contents">'
										+	'		<span class="zxczxc"><b>문의내용</b></span>    '
										+    ''+ hideContent(lists[i].user_id,lists[i].qna_content,lists[i].qna_hide) +''
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
		
// 		var sss=$("input[name=session_id]").data('value') ;
		var session_id=$("input[name=session_id]").val();
		if(session_id!=""){
// 			alert(session_id);   
		}
		
		
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
	    	
	    	
	    	$('.qna_content').keyup(function (e){
			    var qna_content = $(this).val();
			    $('#counter').html("("+qna_content.length+" / 최대 200자)");  
			    if (qna_content.length > 200){
			        alert("최대 200자까지 입력 가능합니다.");
			        $(this).val(qna_content.substring(0, 100));
			        $('#counter').html("(200 / 최대 200자)");  
			    }
			});	
	    	
	    	
	    	
	    	$("form").on("submit",function(){
				  var store_seq=$("input[name=store_seq]").val();
				  var qna_content=$("textarea").val();
				  var qna_title=$(".qna_title").val();
				  var qna_hide=$(".qna_hide").val();
				   
				  if(qna_title=='문의 선택'){
					  alert("문의를 선택해주세요");
					  return false;
				  }
				  if(qna_hide=='비공개 여부'){
					  alert("비공개 여부를 선택해주세요");
					  return false;
				  }
				  
			      
			      if($("textarea").val().length<=100){
					  alert("100자 이상 작성해주세요"); 
					  $("textarea").focus();
			    	  return false;
				  }
			      	    	    
			  });
	    	
	    	
	    	
	    	
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
	
	//수정,삭제 버튼
	function buttonChk(user_id){
		var session_id=$("input[name=session_id]").val();
		var v="";
		if(session_id!=""){
			if(session_id==user_id){
				v='<button class="buttondle" style="margin-left:436px;">수정</button><button class="buttondle" >삭제</button><button  class="content_detail buttondle">자세히 보기</button><br>';							
				return v;
			}else{
				v='<button  class="content_detail buttondle nologin">자세히 보기</button><br>';						
				return v;
			}
		}else{ 
			v='<button  class="content_detail buttondle nologin">자세히 보기</button><br>'; 							
			return v;
		}
	}
	
	
	//비공개글
	function hideContent(user_id,qna_content,qna_hide){
		var session_id=$("input[name=session_id]").val();
		var v="";
		if(session_id!=""){
			if(session_id==user_id){
				v='<span>'+qna_content+'</span>';    						
				return v;
			}else{
				v='<span style="color:#aaa;">비공개글 입니다.</span>';
				return v;
			}
		}else{
			if(qna_hide=="Y"){
				v='<span style="color:#aaa;">비공개글 입니다.</span>';
				return v;
			}else{
				v='<span>'+qna_content+'</span>'; 
				return v;
			}
		}
	}
	
	
 
</script> 
</head>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
	QnaDto qnaAvg=(QnaDto)request.getAttribute("qnaAvg");
	UDto uldto=(UDto)session.getAttribute("uldto");
%>  
<body>  
<%-- <input type="hidden" name="session_id"  data-value="<%=session.getAttribute("uldto")==null?"":uldto.getUser_id()%>"/> --%>
<input type="hidden" name="session_id" value="<%=session.getAttribute("uldto")==null?"":uldto.getUser_id()%>">
<!-- Modal -->
<form action="insert_qna.do" method="post">
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>">
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
	  		<!-- Modal content--> 
	   		<div class="modal-content">
	     		<div class="modal-header">
	     			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	       			<button type="submit" class="qna_write">문의 작성 완료</button>
	       			<h4 class="modal-title">가게이름</h4>
	     		</div>
	     		<div class="modal-footer"> 
	     			<select class="qna_title" name="qna_title" >
	     				<option>문의 선택</option>	 
						<option>가격 문의</option>
						<option>예약 문의</option>
						<option>기타 문의</option>	
	     			</select>
	     			<select class="qna_hide" name="qna_hide">
	     				<option>비공개 여부</option>
				    	<option value="Y">비공개</option>
				    	<option value="N">공개</option>
	     			</select>
	       			<textarea rows="20" cols="120" class="qna_content" name="qna_content"  placeholder="문의 작성 해주세요."></textarea>
	       			<span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
	     		</div>
	   		</div>
		</div>
	</div>
</form>
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
				<%
					if(uldto!=null){
						if(uldto.getUser_id().equals(dto.getUser_id())){
							%>
							<button class="buttondle" style="margin-left:436px;">수정</button><button class="buttondle" >삭제</button> 
							<button  class="content_detail buttondle">자세히 보기</button><br>							
							<%
						}else{
							%>
							<button  class="content_detail buttondle nologin">자세히 보기</button><br> 							
							<%
						}
					}else{
						%>
						<button  class="content_detail buttondle nologin">자세히 보기</button><br> 							
						<% 
					}
				%>			
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