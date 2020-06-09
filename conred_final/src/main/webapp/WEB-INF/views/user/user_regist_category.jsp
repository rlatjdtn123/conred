<%@page import="com.hk.conred.dtos.UDto"%>
<jsp:include page="../all/header.jsp" />
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
	#container{border:1px solid grey; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#bigtle{margin-left: 97px; }
	.tle{width: 800px; height: 200px; border: 1px solid red;}
	.cate{float: left;background-color: gray;width: 150px;height: 150px;border: 1px solid black; margin-top: 24px;margin-left: 88px;border-radius: 80px;}
	.dd{width: 150px; height: 150px; background: url("img/main.jpg"); border-radius: 80px;}
	#m{clear: both;}
	#hd{margin-left: 270px; margin-bottom: 50px;}
	#bt input{width: 100px; height:60px; margin-left: 797px; font-size: 20px; font-weight: bold;border-radius: 10xp;}
	input[type="checkbox"] {display: none;}
	 
</style>
<script type="text/javascript">   
	window.onload= function () {
		var form=document.getElementsByTagName("form")[0];
		form.onsubmit=function(){
			var chks=document.querySelectorAll("input[name=category_code]");
			var count= 0;
			for (var i = 0; i < chks.length; i++) {
				if(chks[i].getAttribute("checked")=="checked"){
					count++;
				}
			}
			if(count>3){
				alert("3개넘엇음");
				return false;
			}else if(count==0){
				alert("최소 한개이상 선택");
				return false;
			}
		}
	}
	
	$(function(){
		var cate=$(".dd");
		cate.click(function(){ 
			if($(this).prev().prop("checked")==true){
				$(this).css("border", "1px solid black");
				$(this).prev().attr("checked", false);
			}else{
				$(this).prev().attr("checked", "checked");
				$(this).css("border", "1px solid blue");
			}
		});
	});
			
	
	
</script>
</head>
<%
	
%>
<body>
<div id="container">
		<h1 id="hd">관심있는 매장을 선택해주세요!</h1>
	<form action="user_regist_category.do" method="post" >
		<div id="bigtle">
			<div class="bigtle tle">
<!-- 				동물병원 -->
				<div id="d1" class="cate">
					<input type="checkbox" value="A" class="ct" name="category_code" id="c1"/>
					<div class="dd"> </div>
				</div>
<!-- 				카페/식당 -->
				<div id="d2" class="cate">
					<input type="checkbox" value="B" class="ct" name="category_code" id="c2"/>
					<div class="dd"> </div>
				</div>
<!-- 				식품/용품 -->
				<div id="d3" class="cate">
					<input type="checkbox" value="C" class="ct" name="category_code" id="c3"/>
					<div class="dd"> </div>
				</div>
			</div>
			<div class="bigtle tle">
<!-- 				숙박 -->
				<div id="d4" class="cate">
					<input type="checkbox" value="D" class="ct" name="category_code" id="c4"/>
					<div class="dd"> </div>
				</div>
<!-- 				돌봄서비스 -->
				<div id="d5" class="cate">
					<input type="checkbox" value="E" class="ct" name="category_code" id="c5"/>
					<div class="dd"> </div>
				</div>
<!-- 					미용/목욕 -->
				<div id="d6" class="cate">
					<input type="checkbox" value="F" class="ct" name="category_code" id="c6"/>
					<div class="dd"> </div>
				</div>
			</div>
			<div class="bigtle tle">
	<!-- 					체험 -->
				<div id="d7" class="cate">
					<input type="checkbox" value="G" class="ct" name="category_code" id="c7"/>
					<div class="dd"> </div>
				</div>
	<!-- 					분양/교배 -->
				<div id="d8" class="cate">
					<input type="checkbox" value="H" class="ct" name="category_code" id="c8"/>
					<div class="dd"> </div>
				</div>
	<!-- 				장례 -->
				<div id="d9" class="cate">
					<input type="checkbox" value="I" class="ct" name="category_code" id="c9"/>
					<div class="dd"> </div>
				</div>
			</div>
		</div>
		<div id="bt"> 
			<input type="submit" value="선택완료"/>  
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />