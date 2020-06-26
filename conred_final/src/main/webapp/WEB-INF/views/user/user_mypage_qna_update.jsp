<%@page import="com.hk.conred.dtos.QnaDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header2.jsp" />
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
<!-- 스윗알러트! -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px;height:800px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#sticky{position: sticky; top:71px;}
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;text-align: center;line-height: 40px;}
	.navis2{border-bottom:1px solid grey; font-size:15px; float:left;width:199.6px;height:40px;background-color: #D8D8D8;}
	.navis2:hover{border-bottom:1px solid white;background-color: white;cursor:pointer;border-right:1px solid grey;border-left:1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;border-right:1px solid grey;border-left:1px solid grey;}

	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:720px;height:400px; font-size: 15px; margin-left: 100px;min-height: 200px;}	
	.bigtle{margin-left: 40px;}  
	
	.contents{display:inline-block; width: 450px;height:25px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;}
	.info{min-height: 95px;}
	.pf{float: left; width: 40px;height: 40px;}    
	
	.qna_content{resize: none;}
  
</style>
<script type="text/javascript">
	
	
	$(function(){
// 		 var content=$("input[name=content]").val();
// 		    alert(content.length);
		var content=$("input[name=content]").val(); 
		$('#counter').html("("+content.length+" / 최대 100자)");
		
		$('.qna_content').keyup(function (e){
		    var qna_content = $(this).val();
		    $('#counter').html("("+qna_content.length+" / 최대 100자)");    //글자수 실시간 카운팅
	
		    if ((qna_content.length+content.length) > 100){ 
		    	swal("최대 100자까지 입력 가능합니다", "error");
		        $(this).val((content+qna_content).substring(0, 100));
		        $('#counter').html("(100 / 최대 100자)");
		    }
		});		
	})
	
</script>
</head>
<%
	QnaDto dto=(QnaDto)request.getAttribute("dto");
%>
<body> 
<input type="hidden" name="content" value="<%=dto.getQna_content()%>"/>
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
		<b>문의 수정</b>
	</div>
		<div class="bigtle">
		<form action="user_qna_update.do" method="post">
		<input type="hidden" name="qna_seq" value="<%=dto.getQna_seq()%>"/>
			<div class="mybox">         
				<img src="./img/profile_default.png" class="pf"/>
				<div class="info">  
					<button style="margin-left: 570px; " class="buttondle" onclick="asd()">수정완료</button><br>
					<span>닉네임 :<%=dto.getUser_id()%> &nbsp;| 
						<select name="qna_title">
							<option>문의 선택</option>	
							<option>가격 문의</option>
							<option>예약 문의</option>
							<option>기타 문의</option>								  
					    </select> &nbsp; |
					    <select name="qna_hide">
					    	<option>비공개 여부</option>
					    	<option value="Y">비공개</option>
					    	<option value="N">공개</option>
					    </select>
				    </span><br><br><br>   
				    <textarea class="qna_content" name="qna_content" rows="12" cols="83"><%=dto.getQna_content()%></textarea>  
				    <span style="color:#aaa;" id="counter">(0 / 최대 100자)</span>
				</div>    
			</div>
		</form>
		</div>   
	<br><br> 
	<div class="bigbig">
		
	</div>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 