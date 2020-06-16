<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%> --%>
<%@page import="org.junit.internal.matchers.SubstringMatcher"%>
<%@page import="com.hk.conred.dtos.UDto"%>
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
	#sel{border:1px solid grey;height:24px;vertical-align: middle;}
	.user_infos{background-color: #D8D8D8;border-width: 0;}
</style>
<script type="text/javascript">

</script>
</head>
<%
	UDto dto=(UDto)request.getAttribute("dto");  
// 	String[] email=dto.getUser_email().split("@");
%>
<body>
<div id="container">
<%-- <input type="hidden"  name="user_email" value="<%=dto.getUser_email()%>"/> --%>
	<form action="user_insert.do" method="post">
		<div id="tle">
			<div id="regist">
				사용자 회원가입
			</div> 
				<table class="table table-hover" >
					<tr>
						<td><span class="req"> </span>아이디</td>
						<td><input type="text" name="user_id" required="required" class="user_infos" value="<%=dto.getUser_id()%>"/></td>
					</tr>
					<tr>
						<td><span class="req"> </span>이름</td>
						<td><input type="text" name="user_name" readonly="readonly" value="<%=dto.getUser_name()%>" class="user_infos"/></td>
					</tr> 
					<tr> 
						<td><span class="req"> </span>이메일</td>
					<td> 
						<input type="text" name="user_email1" readonly="readonly" class="user_infos"/>@
						<input id="email" type="text" name="user_email3" style="width:120px;" readonly="readonly" class="user_infos"/>
<!-- 						<input type="hidden" name="emailConfirm" required="required" value="N"/> -->
					</td>
					</tr>
					<tr>
						<td>생일</td>
						<td>
							<input style="height:26px;" type="text" readonly="readonly" name="user_birth" class="user_infos"/>
						</td>
					</tr>
					<tr>
						<td>성별</td>
					<td>
						<input type="text" readonly="readonly" name="user_sex" value="<%=dto.getUser_sex()%>" class="user_infos"/>
					</td>
					</tr>
				</table>
		</div>
		<div id="bot">
			<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
			<input class="btn greenbtn" value="회원가입 완료" type="submit"/> 
		</div>
	</form>
	<form id="emailform" action="email_ok_start.do">
		<input type="hidden" name="email" required="required" />
	</form>
</div>

</body>
</html>
<jsp:include page="../all/footer.jsp" /> 