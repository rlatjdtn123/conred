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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;text-align: center;line-height: 40px;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;}
	
	
	
	.pf{float: left; width: 40px;height: 40px;}      
	.dt{margin-left: 600px;} 
	.info{min-height: 95px;}   
	.contents{display:inline-block; width: 450px;height:25px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;}
	.contents2{width:430px;}         
	.info2{background-color: #F2F2F2;  height: 62px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 450px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.myboxmargin{margin-top:30px;}      
	.store_img{width: 200px;height:170px; float: left;margin-right: 20px;text-align: center;} 
	.mybox{padding:15px;border-top:1px solid #BDBDBD; width:720px;height:200px; font-size: 15px; margin-left: 100px;min-height: 200px;}
	.bigtle{margin-left: 40px;}    
	button {border-width: 0;}   
	button:hover:{background-color: grey !important;}
	.buttondle{background-color: #585858; color: white;border-radius: 5px;}
	
	.store_title{text-align: center;}
	.tle_final{width: 700px;border-top: 1px solid #BDBDBD;margin-left: 150px;margin-bottom: 200px;}
	   
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
			url:"user_qna_ajax.do",
			method:"post",
			data:{"pnum":count},
			async: false,
			dataType:"json", 
			success:function(obj){				
				var lists=obj.list; //[dto,dto,dto..]
				$.each(lists, function(i){    					
					addContent += '	<div class="bigtle"> '
								+	'	<div class="mybox">   '
									+	' 	<div class="store_img">'
									+      storeImg(lists[i].qna_seq)
									+	' 		<p class="store_title"><b>매장명</b></p> ' 
									+	' 	</div>      '
									+	'	<img src="./img/profile_default.png" class="pf"/>'
									+	'	<div class="info">  '
// 									+	'		<button style="margin-left: 235px;" class="buttondle" onclick="updateQnA('+lists[i].qna_seq+',\'lists[i].qna_title\',\'lists[i].qna_content\',\'lists[i].qna_hide\')">수정</button> <button class="buttondle" onclick="deleteQnA('+lists[i].qna_seq+')">삭제</button> <button  class="content_detail buttondle">자세히 보기</button><br>'
									+'<button style="margin-left: 235px;" class="buttondle"'
									+'onclick="updateQnA('+lists[i].qna_seq+',\''+lists[i].qna_title+'\',\''+lists[i].qna_content+'\',\''+lists[i].qna_hide+'\')">수정</button>'
									+'<button class="buttondle" onclick="deleteQnA('+lists[i].qna_seq+')">삭제</button> <button  class="content_detail buttondle">자세히 보기</button><br>'
									+	'	<span style="color: #919191">닉네임 :'+ lists[i].user_id +' &nbsp;| '+lists[i].qna_title+' </span><span style="float: right;color: #919191">'+ lists[i].qna_realdate +'</span><br><br>   '                         
										+	'	<div class="contents">'+ lists[i].qna_content +'</div>    '
									+	'	</div>   ' 
									+	'	<div class="info2">     ' 
										+	'	<span style="font-weight: bold;">가게답변</span><br>' 
									+	'	<div class="contents contents2">'+ (lists[i].qna_answer==null?"아직 답변이 없습니다.":lists[i].qna_answer) +'</div>'
									+	'	</div>  '
								+	'	</div>'
							+	'	</div>   '
							+	'	<br><br>';
							////////////////////////////////////
							$("body").on("click",".content_detail",function(){     
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
							
		 					//////////////////////////////////////////
						}); 
						
						 $('.bigbig').append(addContent); 
			}
			});
		
	        }
		};
	
	
	//문의삭제
	function deleteQnA(qna_seq){
		var result=confirm("정말 삭제 하시겠습니까?");
		if(result){
			location.href="user_qna_delete.do?qna_seq="+qna_seq;
		}else{
			
		} 
	}
	//문의수정
	function updateQnA(qna_seq,qna_title,qna_content,qna_hide){
		location.href="user_qna_update_form.do?qna_seq="+qna_seq+"&qna_title="+qna_title+"&qna_content="+qna_content+"&qna_hide="+qna_hide;
	}
	
	//더보기
	$(function(){
		$("body").on("click",".content_detail",function(){     
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
	
	//가게이미지
	function storeImg(qna_seq){
		var v="";
		var photo_length=$("input[name=photo_length]").val();
		for(var i=0;i<photo_length;i++){
			if(qna_seq==$("input[name=pqna_seq"+i+"]").val()){
				var v='<img src="upload_sphoto/'+$("input[name=store_photo_stored"+i+"]").val()+'" style="width: 200px;height: 150px; float: left;">';					
				return v;
			}						 
		} 
	}	
	
	 
</script>
</head>
<%
	List<QnaDto> list=(List<QnaDto>)request.getAttribute("list");
	List<QnaDto> photo_list=(List<QnaDto>)request.getAttribute("photo_list");
%>
<body> 
<input type="hidden" name="photo_length" value="<%=photo_list.size()%>">
<%
	for(int i=0;i<photo_list.size();i++){
	%>
	<input type="hidden" name="pqna_seq<%=i%>" value="<%=photo_list.get(i).getQna_seq()%>">
	<input type="hidden" name="store_photo_stored<%=i%>" value="<%=photo_list.get(i).getStore_photo_stored()%>"> 
	<%	
	}
%>
<div id="container">
	<div id="sticky">
		<div id="navi2">
			<div class="navis2" onclick="location.href='user_mypage.do'">
				마이페이지
			</div>
			<div class="navis2" onclick="location.href='user_mypage_like.do'">
				좋아요
			</div>
			<div class="navis2" onclick="location.href='user_mypage_reserve.do'">
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
			 		<%
			 		for(int i=0;i<photo_list.size();i++){
			 			if(dto.getQna_seq()==photo_list.get(i).getQna_seq()){
			 			%>
			 			<img src="upload_sphoto/<%=photo_list.get(i).getStore_photo_stored()%>" style="width: 200px;height: 150px; float: left;">
			 			<%	
			 			}
			 		}  
			 		%>
			 		<p><%=dto.getStore_name()%></p> 
			 	</div>       
				<img src="./img/profile_default.png" class="pf"/>
				<div class="info">  
					<button style="margin-left: 235px; " class="buttondle" onclick="updateQnA(<%=dto.getQna_seq()%>,'<%=dto.getQna_title()%>','<%=dto.getQna_content()%>','<%=dto.getQna_hide()%>')">수정</button> <button class="buttondle" onclick="deleteQnA(<%=dto.getQna_seq()%>)">삭제</button> <button  class="content_detail buttondle">자세히 보기</button><br>
					<span style="color: #919191">닉네임 :<%=dto.getUser_id()%> &nbsp;| <%=dto.getQna_title()%> </span><span style="float: right;color: #919191"><%=dto.getQna_realdate()%></span><br><br>   
					<div class="contents"><%=dto.getQna_content()%></div>    
				</div>   
				<div class="info2">     
					<span style="font-weight: bold;">가게답변</span><br>
					<%
					if(dto.getQna_answer()==null||dto.getQna_answer().equals("")){
					%> 
						<div class="contents contents2">아직 답변이 없습니다.</div>
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
	<div class="tle_final"></div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 