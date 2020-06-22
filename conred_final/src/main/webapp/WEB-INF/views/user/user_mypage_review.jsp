<%@page import="com.hk.conred.dtos.UDto"%>
<%@page import="com.hk.conred.dtos.RPhotoDto"%>
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
// 	        var star_service;
	        ////////////////////////////////// A JAX
	        $.ajax({ 
			url:"user_review_ajax.do",
			method:"post", 
			data:{"pnum":count},
			async: false,
			dataType:"json",
			success:function(obj){				
				var lists=obj.list;
				var sphoto_lists=obj.sphoto_list;
				var rphoto_lists=obj.rphoto_list;
				if(rphoto_lists==""||rphoto_lists.reply_seq==null){
					$.each(lists, function(i){  
						addContent += 	'<div class="bigtle" > '
										+'<div class="mybox">      '
									+	' 	<div class="store_img">    '
									+            ''+sPhoto(lists[i].reply_seq,sphoto_lists[i].reply_seq,sphoto_lists[i].store_photo_stored)+''
									+	 '		<div class="store_info">'+lists[i].store_name+'</div>'
									+	 '	</div>      '
									+		'<img src="./img/profile_default.png" class="pf"/>  '
									+		'<div class="info">  '      
									+			'<button class="content_delete buttondle" onclick="user_review_delete(reply_seq)">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br>' 
									+			'<span>닉네임:'+lists[i].user_id+'</span><span style="float:right;">'+lists[i].reply_regdate+'</span><br>'
												+		'<div class="star_table">'
												+			'<table>'
												+				'<tr>'
													+				'<td>서비스</td>'
													+             '<td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service)+ '</td>'
													+			'</tr>'
													+			'<tr>'
													+			'	<td>가격</td>'
													+             '<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price)+ '</td>'
													+		'	</tr>' 
													+		'	<tr>'
													+		'		<td>청결도</td>'
													+             '<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean)+ '</td>'
													+		'	</tr>'
														+	'</table>'
													+	'</div>'
											+	'<div class="user_review_img" >'
											+	'</div> '
											+	'<div class="contents">'
											+	'	<span style="font-weight: bold;">리뷰내용</span><br>'
											+	'	<span>'+lists[i].reply_content+'</span>'
											+'	</div>  '
										+'	</div>   '
										+	'<div class="info2">     '
										+	'	<span style="font-weight: bold;">매장답변</span><br>'
										+	'<span>	'+(lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer)+'<span>'
									+	'	</div>'
									+'	</div>  '
								+'	</div>     ' 
								+'	<br><br>';
					}); 
					
					 $('.bigbig').append(addContent);
				}else{
					$.each(lists, function(i){  
						addContent += 	'<div class="bigtle" > '
										+'<div class="mybox">      '
									+	' 	<div class="store_img">    '
									+            ''+sPhoto(lists[i].reply_seq,sphoto_lists[i].reply_seq,sphoto_lists[i].store_photo_stored)+''
									+	 '		<div class="store_info">'+lists[i].store_name+'</div>'
									+	 '	</div>      '
									+		'<img src="./img/profile_default.png" class="pf"/>  '
									+		'<div class="info">  '      
									+			'<button class="content_delete buttondle" onclick="user_review_delete(reply_seq)">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br>' 
									+			'<span>닉네임:'+lists[i].user_id+'</span><span style="float:right;">'+lists[i].reply_regdate+'</span><br>'
												+		'<div class="star_table">'
												+			'<table>'
												+				'<tr>'
													+				'<td>서비스</td>'
													+             '<td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service)+ '</td>'
													+			'</tr>'
													+			'<tr>'
													+			'	<td>가격</td>'
													+             '<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price)+ '</td>'
													+		'	</tr>' 
													+		'	<tr>'
													+		'		<td>청결도</td>'
													+             '<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean)+ '</td>'
													+		'	</tr>'
														+	'</table>'
													+	'</div>'
											+	'<div class="user_review_img" >'
											+    ' '+rPhoto(lists[i].reply_seq,rphoto_lists[i].reply_seq,rphoto_lists[i].reply_photo_stored)+'  '
											+	'</div> '
											+	'<div class="contents">'
											+	'	<span style="font-weight: bold;">리뷰내용</span><br>'
											+	'	<span>'+lists[i].reply_content+'</span>'
											+'	</div>  '
										+'	</div>   '
										+	'<div class="info2">     '
										+	'	<span style="font-weight: bold;">매장답변</span><br>'
										+	'<span>	'+(lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer)+'<span>'
									+	'	</div>'
									+'	</div>  '
								+'	</div>     ' 
								+'	<br><br>';
					}); 
					
					 $('.bigbig').append(addContent);
				}
				 
				 
			}
			}); 
	        
	     		
	              
	    }
	};
	
	
	 
	//더보기
	$(function(){
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().find(".contents").css("height")=="80px"&&$(this).parent().parent().find(".info2").css("height")=="80px"){  
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","450px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		});   
		 
// 		alert($(".user_review_img").children(".asd").length);
		
		//유저리뷰사진
		$("div").each(function(){
			if($(".user_review_img").children().hasClass("asd")){
				$(this).find(".asd").parent().addClass("img_tle");
			}		  
		});
		  
   
	});  
	

	function user_review_delete(reply_seq){
		var result=confirm("정말 삭제 하시겠습니까?");
		if(result){
			location.href="user_review_delete.do?reply_seq="+reply_seq;
		}else{
			
		} 
		
	}
	
	
	 function star_fill(val){
		 var v="";
		for(var i=0;i<Math.floor(val);i++){
		 
			v+='<img class="starz" src="img/star_fill.png">';
		
		}
		return v;
	 }
 
	function star_half(val){
		var v="";
		for(var i=0;i<(Math.ceil(val)-Math.floor(val));i++){
		
			v+='<img class="starz" src="img/star_half.png">';
	
		}
		return v;
	}
	function star_empty(val){
		var v="";
		for(var i=0;i<(5-Math.ceil(val));i++){
			v+='<img class="starz" src="img/star_empty.png">';
		}
		return v;
	}
	
	//매장사진
	function sPhoto(uReply_seq,sReply_seq,store_photo_stored){
		var slist_length=$("input[name=slist_length]").val();
		var v="";
 		for(var i=0;i<slist_length;i++){
 			if(uReply_seq==sReply_seq){
				v+='<div style="background: url(upload_sphoto/'+store_photo_stored+');width: 200px;height: 123px;background-size: 200px 123px;background-repeat: no-repeat;float:left;"></div>';
 				return v;
 			}
 		} 		
	}
	
	
	//사용자리뷰사진
	function rPhoto(uReply_seq,reply_seq,reply_photo_stored){
		var v="";
		var rlist_length=$("input[name=rlist_length]");
		for(var i=0;i<rlist_length;i++){
			if(uReply_seq==reply_seq){
			v='<div class="asd" style="background: url(upload_rphoto/'+reply_photo_stored+');width: 80px;height: 80px;background-size: 80px 80px;background-repeat: no-repeat;float:left;margin-left:45px;"></div>';	
			}else{
				
			}
		}
	}

	
</script>     
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px;margin-top:-1px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;text-align: center;line-height: 40px;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;}
	
	   
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{min-height: 95px;}    
	.contents{display:inline-block;padding: 10px; width: 671px;height:80px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;min-height: 80px; clear: both;margin-bottom: 15px; margin-top: 5px;}        
	.info2{background-color: #F2F2F2;  height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 612px; min-height: 80px;border-radius:5px;word-break:keep-all; margin-left: 30px;}
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.myboxmargin{margin-top:30px;}      
	.store_img{width: 200px;height:155px; float: left;margin-right: 20px; background: white;background-size: 200px 250px;} 
	.mybox{padding:15px;border-top:1px solid #BDBDBD; width:700px;height:450px; font-size: 15px; margin-left: -10px;min-height: 450px;}
	.bigtle{margin-left: 165px;}          
	       
	       
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
	button:hover:{background-color: grey;}
	 
	 .buttondle{background-color: #fafafa;}
	 .buttondle:hover {background-color: grey;}
	 
	 .star_table{width: 187px; height: 80px;background-color: #fafafa;border-radius: 5px; padding: 10px;float: left;}
	 .starz{width:17px;height:auto;display: inline-block;margin:-2px;margin-bottom:4px;}
	 .content_delete{ background-color:#fafafa; margin-left: 270px;}
	 .content_delete:hover {background-color: grey;} 
	 .store_info{text-align:center; width: 200px;height: 30px; margin-top: 128px;background-color: white;}
	 .buttondle{background-color: #585858; color: white;border-radius: 5px;}
	 .img_tle{width: 670px;height: 80px;margin-top: 120px;margin-bottom: 10px;} 
	  
	  
</style> 

</head>
<% 
	List<ReplyDto> list=(List<ReplyDto>)request.getAttribute("list");
	List<ReplyDto> sphoto_list=(List<ReplyDto>)request.getAttribute("sphoto_list");
	List<RPhotoDto> rphoto_list=(List<RPhotoDto>)request.getAttribute("rphoto_list");
%>
<body>
<input name="slist_length" type="hidden" value="<%=sphoto_list.size()%>"/>
<input name="rlist_length" type="hidden" value="<%=rphoto_list.size()%>"/>
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
		if(!dto.getReply_delflag().equals("Y")){
		%>
		<div class="bigtle" > 
			<div class="mybox">      
			 	<div class="store_img">    
			 		<%
			 		for(int i=0;i<sphoto_list.size();i++){
			 			if(dto.getReply_seq()==sphoto_list.get(i).getReply_seq()){
		 				%>
		 				<div style="background: url('upload_sphoto/<%=sphoto_list.get(i).getStore_photo_stored()%>');width: 200px;height: 123px;background-size: 200px 123px;background-repeat: no-repeat;float:left;"></div>
		 				<%
			 			}
			 		}
			 		%> 
			 		<div class="store_info"><%=dto.getStore_name()%></div>
			 	</div>      
				<img src="./img/profile_default.png" class="pf"/>  
				<div class="info">        
					<button class="content_delete buttondle" onclick="user_review_delete(<%=dto.getReply_seq()%>)">삭제</button> <button class="content_detail buttondle">자세히 보기</button><br> 
					<span>닉네임:<%=dto.getUser_id()%></span><span style="float:right;"><%=dto.getReply_regdate()%></span><br>
					<div class="star_table"> 
						<table>
							<tr> 
								<td>서비스</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_service());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
						 				for(int i=0;i<(Math.ceil(dto.getReply_service())-Math.floor(dto.getReply_service()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_service()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td>  
							</tr>
							<tr>
								<td>가격</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_price());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
										for(int i=0;i<(Math.ceil(dto.getReply_price())-Math.floor(dto.getReply_price()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_price()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td> 
							</tr>
							<tr>
								<td>청결도</td>
								<td>
									<%  
										for(int i=0;i<Math.floor(dto.getReply_clean());i++){
										%> 
											<img class="starz" src="img/star_fill.png">
										<%
										}
										for(int i=0;i<(Math.ceil(dto.getReply_clean())-Math.floor(dto.getReply_clean()));i++){
										%>
											<img class="starz" src="img/star_half.png">
										<%
										}
										for(int i=0;i<(5-Math.ceil(dto.getReply_clean()));i++){
										%>
											<img class="starz" src="img/star_empty.png">
										<%
										}
									%>
								</td> 
							</tr>
						</table>  
					</div>
					<div class="user_review_img" >
					<%
					for(int i=0;i<rphoto_list.size();i++){
						if(dto.getReply_seq()==rphoto_list.get(i).getReply_seq()){
						%>
						<div class="asd" style="background: url('upload_rphoto/<%=rphoto_list.get(i).getReply_photo_stored()%>');width: 80px;height: 80px;background-size: 80px 80px;background-repeat: no-repeat;float:left;margin-left:45px;"></div>	
						<%
						}else{
							
						}
					}
					%>
					</div> 
					<div class="contents">
						<span style="font-weight: bold;">리뷰내용</span><br>
						<span><%=dto.getReply_content()%></span>
					</div>  
				</div>   
				<div class="info2">     
					<%
						if(dto.getReply_answer()==null||dto.getReply_answer().equals("")){
							%>					
								<span style="font-weight: bold;">매장답변</span><br>
								<span>아직 답변이 없습니다.</span>
							<%
						}else{  
							%>
								<span style="font-weight: bold;">매장답변</span><br>
								<span><%=dto.getReply_answer()%></span>						
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
	<%		
		} 
	%>
	<div class="bigbig">
	   
 	</div>
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 