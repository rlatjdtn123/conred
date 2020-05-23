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
	
	#regist{ 
		padding-left: 40px;
		font-weight: bold;
		font-size: 20px;
		margin-bottom: 40px;
	}
	 
	#tle{
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
	
	.bt {
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
	<form action="user_insert.do" method="post">
		<div id="tle">
			<div id="regist">
				사용자 회원가입
			</div> 
				<table class="table table-hover" >
					<tr>
						<td>id</td>
						<td><input type="text" name="user_id"/></td>
					</tr>
					<tr>
						<td>pw</td>
						<td><input type="password" name="user_password"/></td>
					</tr>
					<tr>
						<td>pw확인</td>
						<td><input type="password" name="user_password2"/></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="user_name"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>
							<input type="text" name="user_email1"/>
							@<input type="hidden"  name="user_email2" value="@"/>
							<input type="text" name="user_email3"/>
							<input class="bt" value="이메일인증" type="button"/>
						</td>
					</tr>
					<tr>
						<td>생일</td>
						<td><input type="text" name="user_birth"/></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="text" name="user_sex"/></td>
					</tr>
					<tr>
						<td>이용약관</td>
						<td>
							동의<input name="user_agreement" value="Y" type="radio"/>&nbsp;비동의<input name="user_agreement" value="N" type="radio"/>
						</td>
					</tr>
				</table>
		</div>
		<div id="bot">
			<input class="bt" value="취소" onclick="location.href='index.jsp'" type="button"/>
			<input class="bt" value="회원가입 완료" type="submit"/> 
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />