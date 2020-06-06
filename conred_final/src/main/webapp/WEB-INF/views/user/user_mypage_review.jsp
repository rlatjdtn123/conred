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
					+	'	<span >★★★★★</span><button style="margin-left: 160px;">수정</button> <button >삭제</button> <button  class="content_detail">자세히 보기</button><br>' 
					+	'	<span>닉네임:'+ lists[i].user_id +' &nbsp;| 미용 / 컷트 </span><br><br>  '   
					+	'	<div class="contents">'+ lists[i].reply_content +' '
					+	'	</div>     '  
					+	'</div>  '
					+	'<div class="info2">    '
					+	'	<span style="font-weight: bold;">가게답변</span><br>  '
					+	'	<div class="contents contents2">'+ lists[i].reply_answer +'</div>'
					+	'</div>'
				+	'</div>  ' 
				+    ' </div> '
				+     '<br><br>';	 
				}); 
				
				 $('.bigbig').append(addContent); 
				 
			}
			}); 
	        
	    	////////////////////////////////////////////////       		
	              
	    }
	};
	
	

	
	// 이미지 정보들을 담을 배열
	var sel_files = [];
	
	
	$(document).ready(function() {
	    $("#input_imgs").on("change", handleImgFileSelect);
	}); 
	
	function fileUploadAction() {
	    console.log("fileUploadAction");
	    $("#input_imgs").trigger('click');
	}
	
	function handleImgFileSelect(e) {
	
	    // 이미지 정보들을 초기화
	    sel_files = [];
	    $(".imgs_wrap").empty();
	
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	    var index = 0;
	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }
	
	        sel_files.push(f);
	
	        var reader = new FileReader();
	        var imges;
	        reader.onload = function(e) {
	            var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
	            imges=$(".imgs_wrap");
	                imges.append(html);
	                index++;
	        }
	        reader.readAsDataURL(f);
	        
	    });
	}



	function deleteImageAction(index) {
	    console.log("index : "+index);
	    console.log("sel length : "+sel_files.length);
	
	    sel_files.splice(index, 1);
	
	    var img_id = "#img_id_"+index;
	    $(img_id).remove(); 
	}
	
	function fileUploadAction() {
	    console.log("fileUploadAction");
	    $("#input_imgs").trigger('click');
	}
	
// 	$(function(){
// 		$(".content_detail").click(function(){   
// 			if($(".info2").css("height")=="60px"){  
// 				$(".contents").css("word-break","break-all");
// 				$(".info2").css("height","auto");
// 				$(".mybox").css("height","auto"); 
// 				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto"});
// 			}else{
// 				$(".contents").css("word-break","keep-all");
// 				$(".info2").css("height","60px");
// 				$(".mybox").css("height","200px");       
// 				$(this).parent().parent().find(".contents").css({"height":"25px","overflow":"hidden"});
// 			}   
// 		});   
 
// 	}); 
	
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
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
	  		<!-- Modal content-->
	   		<div class="modal-content">
	     		<div class="modal-header">
	       			<button type="button" class="close" data-dismiss="modal">리뷰 작성 완료</button>
	       			<h4 class="modal-title">가게이름</h4>
	     		</div>
	     		<div class="modal-body"> 
	       			<span>서비스 ☆☆☆☆☆</span>|<span>가격 ☆☆☆☆☆</span>|<span>청결도 ☆☆☆☆☆</span>
	     		</div>  
	     		<div class="modal-footer"> 
	     			<div style="margin-bottom: 50px; width: 870px;  ">   
					    <div class="imgs_wrap" style="width: 850px; border: 1 solid black;">    
					           
					    </div>          
					    <div class="input_wrap" style="border: 0;"> 
					        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
					        <input type="file" id="input_imgs" multiple/>
					    </div>   
					</div>
	       			<textarea rows="20" cols="120" style="resize: none;" placeholder="리뷰 작성 해주세요."></textarea>
	     		</div>
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
				<span >★★★★★</span><button style="margin-left: 160px;">수정</button> <button >삭제</button> <button  class="content_detail">자세히 보기</button><br> 
				<span>닉네임:<%=dto.getUser_id()%> &nbsp;| 미용 / 컷트 </span><br><br>     
				<div class="contents"><%=dto.getReply_content()%>
				</div>       
			</div>  
			<div class="info2">     
				<span style="font-weight: bold;">가게답변</span><br>  
				<div class="contents contents2"><%=dto.getReply_answer()%></div>
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