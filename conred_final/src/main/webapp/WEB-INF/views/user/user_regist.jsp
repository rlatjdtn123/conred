<jsp:include page="../test/header.jsp" />
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
	
	#regist{ 
		padding-left: 40px;
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 40px;
	}
	 
	#form{
		margin:0 auto;
		padding-top:40px;
		width: 700px;
	}
	
	table tr{
  		height: 80px;  
	}
	     
	td{
		vertical-align: middle !important;
	}
	
	#bot{
		padding-top:100px;
		padding-left: 750px;
		
	}
	
	button {
		background-color: #6E6E6E;
		color: white;
		border-radius: 10px;
		height: 30px;
		margin-left: 10px;
	} 
	
</style>
</head>
<body>
<div id="container">
	<div id="form">
		<div id="regist" >
			회원가입
		</div> 
		<table class="table table-hover" >
			<tr>
				<td>id</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td  >pw</td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td>pw확인</td>
				<td><input type="password" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input type="text" name="user_email1"/>
					@<input type="hidden"  name="user_email2" value="@"/>
					<input type="text" name="user_email3"/>
					<button>이메일인증</button>
				</td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="text" /></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="text" /></td>
			</tr>
		</table>
	</div>
	<div id="bot">
		<button>취소</button>
		<button>회원가입 완료</button>
	</div>
</div>
</body>
</html>
<jsp:include page="../test/footer.jsp" />