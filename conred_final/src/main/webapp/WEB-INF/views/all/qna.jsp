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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:800px;height:300px; margin:0 auto; font-size: 15px;background-color: #f2f2f2;}
	.myboxmargin{margin-top:30px;}
	#main{width: 850px;height: 100px;margin: 0 auto; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{} 
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{}   
	.contents{display:inline-block; width: 731px;height:80px;text-overflow: ellipsis; overflow: hidden;background-color: #fafafa;margin-left: 20px;min-height: 80px; padding: 10px;margin-bottom: 15px;}     
	.info2{background-color: #fafafa; margin-left: 20px; height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 731px;min-height: 80px;}
	.bot{margin: 0 auto; text-align: center;}
	
	#modal_Btn{margin-left: 440px; height: 50px; width: 100px;background-color: #F2F2F2; border: 0;}
	.modal-title{margin-left: 400px;}
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; } 
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left; margin: 10px;}
	button:hover {background-color: grey;}
</style>
<script type="text/javascript">	    
	//Javascript
	var count = 0; 
	//스크롤 바닥 감지
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가) 
	        count++;
	        var addContent =  '<div class="mybox">   '      
			+'<img src="./img/profile_default.png" class="pf"/>'
				+'<div class="info">'
				+	'<br><span>닉네임:?? &nbsp; </span><a style="margin-left: 560px;" id="md" onclick="mdTest()">자세히 보기</a>' 
				+	'<br><br><br>   '
				+	'<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd'
				+	'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   '
			+	'</div>'
			+	'<div class="info2">    '
				+	'<span style="font-weight: bold;">가게답변</span><br>'
				+	'<span>dddddddddddddddddddddddddddddddddd</span>'
			+	'</div>'
			+'</div>  '    
			+'<br><br>'
	        //container에 추가되는 콘텐츠를 append
	        for (var i = 0; i < 3; i++) {
		        $('#container').append(addContent);				
			}
	    }
	};
	
	$(document).ready(function(){
	    $("#modal_Btn").click(function(){
	        $("div.modal").modal(); 
	    });
	});
 
</script> 
</head>
<body>
<!-- Modal -->
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
	<div id="main">
		<span id="main2"><b>문의</b> &nbsp; &nbsp; &nbsp; &nbsp;전체2343개|답변2033개</span><button id="modal_Btn">문의 작성</button><br/><br/> 
	</div>  
    <div class="mybox">         
		<img src="./img/profile_default.png" class="pf"/>
		<div class="info">
			<span style="line-height: 45px;">닉네임:</span><button style="margin-left:475px;">수정</button> <button >삭제</button> <button  class="content_detail">자세히 보기</button><br><br>
			<div class="contents">
				<span><b>문의내용</b></span>    
				<span>asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd
				ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>   
			</div>
		</div>
		<div class="info2">    
			<span><b>가게답변</b></span><br>
			<span>dddddddddddddddddddddddddddddddddd</span>
		</div>
	</div>      
	<br><br>
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 