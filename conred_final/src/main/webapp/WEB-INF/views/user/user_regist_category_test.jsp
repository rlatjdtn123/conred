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
	#container{border:1px solid grey; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#tle{
		margin-left: 55px;
	}
	
	.cate{
		float: left;
		margin: 10px;
		background-color: gray;width: 200px;height: 200px;
		border: 1px solid black;
	}
	#m{
		clear: both;
	}
	#hd{margin-left: 270px; margin-bottom: 50px;}
	
	#bt input{width: 100px; height:60px; margin-left: 445px; font-size: 20px; font-weight: bold;border-radius: 10xp;}
	
	label{width: 200px; height: 200px; border: 1px solid red; background: url("img/main.jpg");}
	
	input:checked + label {
		cursor: wait;
	}
	input[type="checkbox"] {display: none;}
	
</style>
<script type="text/javascript">   
	function checkcheck(){
		var chks=document.getElementsByTagName("label");
		for (var i = 0; i < chks.length; i++) {
			chks[i].onclick=function(){
				var chksresult=document.querySelectorAll("label:checked");
				if(chksresult!=3){  
					alert("3개선택");
				}else{
					alert("ㅁㄴㅇ");
				}			
			}
		}
	}
</script>
</head>
<%
	
%>
<body>
<div id="container">
		<h1 id="hd">관심있는 매장을 선택해주세요!</h1>
	<form action="user_regist_category.do" method="post">
		<div id="tle">
			<div id="t">
<!-- 				동물병원 -->
				<div id="d1" class="cate">
					<input type="checkbox" value="A" class="ct" name="category_code" id="c1"/>
					<label for="c1" ></label>
				</div>
<!-- 				미용실 -->
				<div id="d2" class="cate">
					<input type="checkbox" value="B" class="ct" name="category_code" id="c2"/>
					<label for="c2" ></label>
				</div>
<!-- 				카페 -->
				<div id="d3" class="cate">
					<input type="checkbox" value="C" class="ct" name="category_code" id="c3"/>
					<label for="c3" ></label>
				</div>
<!-- 				식품 -->
				<div id="d4" class="cate">
					<input type="checkbox" value="D" class="ct" name="category_code" id="c4"/>
					<label for="c4" ></label>
				</div>
			</div>
			<div id="m">
				<div>
<!-- 				용퓸 -->
					<div id="d5" class="cate">
						<input type="checkbox" value="E" class="ct" name="category_code" id="c5"/>
						<label for="c5"></label>
					</div>
<!-- 					관리 -->
					<div id="d6" class="cate">
						<input type="checkbox" value="F" class="ct" name="category_code" id="c6"/>
						<label for="c6"></label>
					</div>
<!-- 					호텔 -->
					<div id="d7" class="cate">
						<input type="checkbox" value="G" class="ct" name="category_code" id="c7"/>
						<label for="c7"></label>
					</div>
<!-- 					유치원 -->
					<div id="d8" class="cate">
						<input type="checkbox" value="H" class="ct" name="category_code" id="c8"/>
						<label for="c8"></label>
					</div>
				</div>
			</div>
		</div>
		<div id="bt"> 
			<input type="submit" value="선택완료" onclick="checkcheck()"/>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />