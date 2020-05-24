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
<style type="text/css">
	#container{border:1px solid grey; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#tle{
		margin-left: 55px;
	}
	
	.cate{
		float: left;
		margin: 10px;
		background-color: gray;width: 200px;height: 200px;
	}
	#m{
		clear: both;
	}
	#hd{margin-left: 270px; margin-bottom: 50px;}
</style>
<script type="text/javascript">
	////////////////////////////////////////////////////////////////////////
</script>
</head>
<%
// 	UDto dto=(UDto)request.getAttribute("dto");
%>
<body>
<div id="container">
		<h1 id="hd">관심있는 매장을 선택해주세요!</h1>
	<form action="user_regist_category_test2.do" method="post">
<%-- 		<input type="hidden" name="dto" value="<%=dto%>"/> --%>
		<div id="tle">
			<div id="t">
				<div id="d1" class="cate">
					동물병원<input type="checkbox" value="A" class="ct" name="category_code"/>
				</div>
				<div id="d2" class="cate">
					미용실<input type="checkbox" value="B" class="ct" name="category_code" />
				</div>
				<div id="d3" class="cate">
					카페<input type="checkbox" value="C" class="ct" name="category_code" />
				</div>
				<div id="d4" class="cate">
					식품<input type="checkbox" value="D" class="ct" name="category_code" />
				</div>
			</div>
			<div id="m">
				<div>
					<div id="d5" class="cate">
						용퓸<input type="checkbox" value="E" class="ct" name="category_code" />
					</div>
					<div id="d6" class="cate">
						관리<input type="checkbox" value="F" class="ct" name="category_code" />
					</div>
					<div id="d7" class="cate">
						호텔<input type="checkbox" value="G" class="ct" name="category_code" />
					</div>
					<div id="d8" class="cate">
						유치원<input type="checkbox" value="H" class="ct" name="category_code" />
					</div>
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