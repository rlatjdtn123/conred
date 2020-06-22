<jsp:include page="../all/header.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	input[name=store_owner_name],input[name=store_owner_phone_certify]{width:170px;display: inline-block;}
	.numbers{width:50px;display: inline-block;}
	.bt {border:1px solid grey;background-color: grey;color: white;border-radius: 5px;height: 30px;margin-left: 10px;} 
	.btn {margin-left: 10px;} 
	.btn:hover {background-color: lightgrey;} 
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.req{color: red;font-weight: bold;font-size:20px;}
	#sel{border:1px solid grey;height:24px;vertical-align: middle;}
	
	.s_o_phone{width:50px;}
	.filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
 	.filebox label { display: inline-block; padding: .5em .75em;  font-size: inherit; line-height: normal; 
 					vertical-align: middle; background-color: #f0f0f0; cursor: pointer; border: 1px solid #ebebeb; 
					border-bottom-color: #e2e2e2; border-radius: .25em; margin-bottom: 0px;}
	.filebox .upload-name { display: inline-block; padding: .5em .75em; height:25px;/* label의 패딩값과 일치 */
						
						font-size: inherit; font-family: inherit; line-height: normal;
						vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none;
						/* 네이티브 외형 감추기 */
						-moz-appearance: none; appearance: none; }
</style>
<script type="text/javascript">

	$(document).ready(function(){
		var fileTarget = $('.filebox .upload-hidden');
		fileTarget.on('change', function(){
			// 값이 변경되면
			if(window.FileReader){ // modern browser
				var filename = $(this)[0].files[0].name;
			} else { // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
		});
// 		fileTarget.eq(0).change(function() {
// 			alert("biz");
// 			$(".biz_change").val("Y");
// 		});
// 		fileTarget.eq(1).change(function() {
// 			alert("sales");
// 			$(".sales_change").val("Y");
// 		});
	});

</script>
</head>
<body>
<div id="container">
	<form action="owner_update_certify.do" method="post" enctype="multipart/form-data">
		<div id="tle">
			<div id="regist">
				사업자등록번호 인증
			</div> 
			<table class="table table-hover" >
				<tr>
					<td>사업자등록번호${oldto.owner_name}</td>
					<td>
						<input class="numbers form-control" type="text" name="store_license_number" value="${sdto.store_license_number}"/> -
						<input class="numbers form-control" type="text" name="store_license_number"/> -
						<input class="numbers form-control" type="text" name="store_license_number"/>

						<button class="btn"  type="button" title="유효한 사업자등록번호인지 조회하기">
<!-- 						<button class="btn"  type="button" name="certify" title="유효한 사업자등록번호인지 조회하기" required="required"> -->
							조회
						</button>
							
					</td>
				</tr>
				<tr>
					<td>사업자등록증  사본등록</td>
					<td>
						<div class="filebox">
							<input class="upload-name"  value="${sdto.store_license_biz_origin}" readonly="readonly" >
							<label class="btn" for="biz">업로드</label>
<!-- 							<input type="hidden" class="biz_change" name="biz_change" value="N"> -->
							<input type="file" id="biz" name="biz" class="upload-hidden">
<!-- 							<input type="file" id="biz" class="upload-hidden" required="required"> -->
						</div>
					</td>
					
				</tr>
				<tr>
					<td>영업등록증 사본등록</td>
					<td>
						<div class="filebox">
<!-- 							<input type="hidden" name="store_license_sales_origin" value="영업증원본명테스트a"/>테스트용 -->
<!-- 							<input type="hidden" name="store_license_sales_stored" value="영업증저장명테스트a"/>테스트용 -->
<!-- 							<input type="hidden" name="store_license_sales_size" value="2345"/>			테스트용 -->
							<input class="upload-name" value="${sdto.store_license_sales_origin}" disabled="disabled">
							<label class="btn" for="sales">업로드</label>
<!-- 							<input type="hidden" class="sales_change" name="sales_change" value="N"> -->
							<input type="file" id="sales" name="sales" class="upload-hidden">
<!-- 							<input type="file" id="filename02" class="upload-hidden" required="required"> -->
						</div>
					</td>
				</tr>
				<tr>
					<td>사업자명</td>
					<td>
						<input class="form-control" type="text" name="store_owner_name" value="${sdto.store_owner_name}"/>
						<input type="hidden" name="store_owner_name"/><!-- 테스트용 -->
					</td>
<!-- 					<td><input type="text" name="store_owner_name" required="required"/></td> -->
				</tr>
				<tr>
					<td>사업자 휴대폰번호</td>
					<td>
						<input class="numbers form-control" type="text" name="store_owner_phone" value="${sdto.store_owner_phone}"/>- 
						<input class="numbers form-control" type="text" name="store_owner_phone"/>- 
						<input class="numbers form-control" type="text" name="store_owner_phone"/>
<!-- 						<input class="numbers" type="text" name="store_owner_phone1" required="required"/>-  -->
<!-- 						<input class="numbers" type="text" name="store_owner_phone2" required="required"/>-  -->
<!-- 						<input class="numbers" type="text" name="store_owner_phone3" required="required"/> -->
						<input class="btn" value="인증번호 발송" type="button" onclick=""/><!-- 온클릭안에 펑션명 + 스크립트로 펑션 만들기 -->
					</td>
				</tr>
				<tr>
					<td>인증번호 입력</td>
					<td>
						<input class="form-control" type="text" name="store_owner_phone_certify"/>
<!-- 						<input type="text" name="store_owner_phone_certify" required="required"/> -->
						<input class="btn" value="인증완료" type="button" onclick=""/><!-- 온클릭안에 펑션명 + 스크립트로 펑션 만들기 -->
					</td>
				</tr>
				<tr>
					<td>입점 약관</td>
					<td>
<!-- 						얘는 수정할때도 required 해두기 -->
						입점 약관에 동의하셨습니다 <input name="store_agreement" value="Y" type="checkbox" checked="checked" disabled/>
						<input type="hidden" name="store_agreement" value="Y" /><!-- 테스트용 -->
<!-- 						입점 약관에 동의하시겠습니까? <input name="owner_agreement" value="Y" type="checkbox" required="required"/> -->
					</td>
				</tr>
			</table>
		</div>
		<div id="bot">
			<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
			<c:choose>
				<c:when test="${cmaindto==null}">
					<!-- update 하는 버튼(수정하러가는버튼) -->
					<input class="btn greenbtn" value="다음 단계로1" type="submit" onclick="javascript: form.action='owner_toUpdate_store.do';"/>
				</c:when>
				<c:otherwise>
					<!-- update 하는 버튼(다음페이지에 값이 이미 들어가 있음) -->
					<input class="btn greenbtn" value="다음 단계로2" type="submit" />
				</c:otherwise>
			</c:choose>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />