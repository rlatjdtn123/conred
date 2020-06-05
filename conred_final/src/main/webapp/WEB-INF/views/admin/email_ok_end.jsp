<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	response.setContentType("text/html; charset=utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어디가냥저기가개! 메일인증 입력하기</title>
</head>
<body>
	<form action="email_ok_end.do" method="post">
		
		<table border="1" width="300" height="300" align="center">

			<span align="center" style="color: green; font-weight: bold;">입력한
				이메일로 받은 인증번호를 입력하라냥! (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다)</span>
			<br>
			<br>
			<br>
			<br>

			<!--         //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인     -->

			<div style="text-align: center;">
				<tr>
					<td><br>
						<div>
						인증번호 입력 : <input type="number" name="email_injeung"
							placeholder="  인증번호를 입력하세요. ">
						</div> <br> <br>
					<button type="submit" name="submit">인증번호 전송</button></td>
				</tr>

			</div>
		</table>
	</form>
</body>
</html>
