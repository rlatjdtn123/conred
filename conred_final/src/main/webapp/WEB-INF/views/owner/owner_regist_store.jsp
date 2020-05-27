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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 700px;}
	
	table tr{height: 80px;}
	     
	td{vertical-align: middle !important;}
	
 	#bot{padding-left:680px;} 
	input{border:1px solid grey;vertical-align: middle;}
	input[type=radio],input[type=checkbox]{margin-bottom:6px;}
	
	.numbers{width:50px;}
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
	});

</script>
</head>
<body>
<div id="container">
	<form action="owner_regist_store.do" method="post">
		<div id="tle">
			<div id="regist">
				매장 정보 입력
			</div> 
			<table class="table table-hover" >
				<tr>
					<td>매장명</td>
					<td><input type="text" name="s_title"/></td>
				</tr>
				<tr>
					<td>대표명</td>
					<td><input type="text" readonly/></td>
				</tr>
				<tr>
					<td>간단소개(30자이내)</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>매장소개(500자이내)</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>매장종류</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>매장 전화번호</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>담당자 전화번호</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>영업상태</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>주소</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>사진업로드</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>영업시간등록</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				
				<tr>
					<td>메뉴등록</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
				<tr>
					<td>계좌등록</td>
					<td><textarea name="s_intro_small"></textarea>
				</tr>
			</table>
			<div id="bot">
				<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
				<input class="btn greenbtn" value="다음 단계로" type="submit"/>
			</div>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />