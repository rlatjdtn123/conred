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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:900px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 700px;}
	
	table tr{height: 80px;}
	     
	td{vertical-align: middle !important;}
	
 	#bot{padding-left:680px;} 
	input{border:1px solid grey;vertical-align: middle;}
	input[type=radio],input[type=checkbox]{margin-bottom:6px;}
	.bt {border:1px solid grey;background-color: grey;color: white;border-radius: 5px;height: 30px;margin-left: 10px;} 
	.btn {margin-left: 10px;} 
	.btn:hover {background-color: lightgrey;} 
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.req{color: red;font-weight: bold;font-size:20px;}
	#sel{border:1px solid grey;height:24px;vertical-align: middle;}
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
						<td><span class="req">* </span>아이디</td>
						<td><input type="text" name="user_id"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>비밀번호</td>
						<td><input type="password" name="user_password"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>비밀번호 확인</td>
						<td><input type="password" name="user_password2"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>이름</td>
						<td><input type="text" name="user_name"/></td>
					</tr>
					<tr>
						<td><span class="req">* </span>이메일</td>
					<td>
						<input type="text" name="user_email1" required="required"/>@
						<input type="text" name="user_email3" style="width:120px;" required="required"/>
						<select id="sel">
							<!-- 직접입력처리 -->
							<option>직접입력</option>
							<option>gmail.com</option>
							<option>naver.com</option>
							<option>hanmail.net</option>
						</select>
						<input class="btn" value="이메일인증" type="button"/>
					</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>
							<input style="height:26px;" type="date" name="user_birth"/>
						</td>
					</tr>
					<tr>
						<td>성별</td>
					<td>
						<input type="radio" name="user_sex" value="남자"/>남
						<input type="radio" name="user_sex" value="여자"/>여
					</td>
					</tr>
					<tr>
						<td><span class="req">* </span>이용약관</td>
						<td>
							이용약관에 동의하시겠습니까? <input name="user_agreement" value="Y" type="checkbox" required="required"/>
							<button type="button"  class="btn"> 이용약관</button>
						</td>
					</tr>
				</table>
		</div>
		<div id="bot">
			<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
			<input class="btn greenbtn" value="회원가입 완료" type="submit"/> 
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />