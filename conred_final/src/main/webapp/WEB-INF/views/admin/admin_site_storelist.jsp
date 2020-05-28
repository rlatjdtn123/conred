<%@page import="com.hk.conred.dtos.SDto"%>
<%@page import="java.util.List"%>
<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 	function allSel(bool) {
// 		var chks = document.getElementsByName("chk");//[checkbox,checkbox..]
// 		for (var i = 0; i < chks.length; i++) {
// 			chks[i].checked = bool;
// 		}

// 		//		$("input[name=chk]").prop("checked",bool);
// 	}

// 	$(
// 			function() {
// 				//form태그에서 submit이벤트가 발생하면 함수실행
// 				$("form").submit(function() {
// 					var bool = true;
// 					var count = $(this).find("input[name=chk]:checked").length;
// 					if (count == 0) {
// 						alert("최소하나이상 체크해야 됩니다.!!");
// 						bool = false;
// 					}
// 					return bool;
// 				});

// 				//체크박스 처리: 체크가 하나라도 안되면 전체선택체크박스 해제, 모두 선택되면 체크
// 				var chks = document.getElementsByName("chk");
// 				for (var i = 0; i < chks.length; i++) {
// 					chks[i].onclick = function() {
// 						var checkedObjs = document
// 								.querySelectorAll("input[name=chk]:checked");
// 						if (checkedObjs.length == chks.length) {
// 							document.getElementsByName("all")[0].checked = true;
// 						} else {
// 							document.getElementsByName("all")[0].checked = false;
// 						}
// 					}
// 				}
// 			})
</script>
<style type="text/css">
	#container{border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1900px;height:900px;margin: 0 auto; text-align: center;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	#searchbar1{width:80%;}
	#sel{height: 34px; }
	#searchbtn1{padding:3px;width:40px;height:35px; }
	#magnifyglass1{width:20px;}
	
	th{text-align: center;}
</style>
</head> 
<%
List<SDto>list=(List<SDto>)request.getAttribute("list"); 
%>
<body>
<br>
<div id="container">
<form action="admin_store_search.do" method="post">
		<table border="0" cellpadding="0" cellspacing="0" width="970" align="center">
			<tr>
				<td align="left">
					<select	name="storeSearch" id="sel">
						<option value="keyWordStore" ${storeSearch eq "keyWordStore"?"selected":""}>키워드 검색</option>
						<option value="adminState" ${userSearch eq "adminState"?"selected":""}>관리자 승인 여부</option> 
					</select>
					<input name="searchWordStore" type="text" id="searchbar1" class="form-control pull-left" placeholder="안녕하세요 관리자님! 매점 관련 키워드로 검색 하세요">
					<button type="submit" id="searchbtn" class="btn"><img id="magnifyglass1" src="./img/magnifyglass.png"></button>
			</tr>
			</table>
		</form>
		<br>
<form>
<table border="1"  >
	<tr>
		<th>점포일련번호</th>
		<th>아이디</th>
		<th>매장명</th>
		<th>대표명</th>
		<th>매장홈페이지링크</th>
		<th>간단소개</th>
		<th>매장소개</th>
		<th>영업상태(영업중,휴업중,폐점)</th>
		<th>매장전화번호</th>
		<th>점주전화번호</th>
		<th>주소</th>
		<th>상세주소</th>
		<th>영업시간(기타사항)</th>
		<th>은행명</th>
		<th>계좌번호</th>
		<th>사업자등록증</th>
		<th>영업신고증</th>
		<th>관리자승인매장여부</th>
		
		<th><input type="checkbox" name="all" onclick="allSel(this.checked)"/></th>
	</tr>
<%
		if(list==null||list.size()==0){
			out.print("<tr><td colspan='8'>"
			         +"---등록된 매장이 존재하지 않습니다.---</td></tr>");
		}else{
			for(SDto dto:list){
				%>
				<tr>
					<td><%=dto.getStore_seq()%></td>
					<td><%=dto.getOwner_id()%></td>
					<td><%=dto.getStore_name()%></td>
					<td><%=dto.getStore_owner_name()%></td>
					<td><%=dto.getStore_path()%></td>
					<td><%=dto.getStore_simple_intro()%></td>
					<td><%=dto.getStore_intro()%></td>
					<td><%=dto.getStore_state()%></td>
					<td><%=dto.getStore_phone()%></td>
					<td><%=dto.getStore_owner_phone()%></td>
					<td><%=dto.getStore_address()%></td>
					<td><%=dto.getStore_detail_address()%></td>
					<td><%=dto.getStore_time_other()%></td>
					<td><%=dto.getStore_bank()%></td>
					<td><%=dto.getStore_account()%></td>
					<td><%=dto.getStore_license_owner()%></td>
					<td><%=dto.getStore_license_sales()%></td>
					<td><%=dto.getStore_admin_state()%></td>
					<td><input type="checkbox" name="chk" value="${dto.getStore_seq}"/></td>
				</tr>
				<%
			}
		}
	%>	
</table>
</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />