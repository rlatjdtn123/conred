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
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: #f0f0f0;margin-left:10px;}
	.btn2{background-color: #f0f0f0;margin-left:0px;}

	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:auto;line-height: 200%;padding-right:20px;width:140px;}
	input{margin-top:2px;}
	textarea{margin-top:2px;resize: none;}
	select {margin-top:3px;height:26px;}
	.inputs{width:500px;float: left;height:auto;}
	
	textarea[name=s_time_etc]{width:310px;}
	textarea[name=s_intro_small]{width:500px;}
	textarea[name=s_intro_big]{width:500px;height:100px;}
	textarea[name=s_addr]{width:220px;height:100px;}
	
	.catechkboxes{padding-bottom:10px;}
	input[name=s_cate]{margin-left:10px;}
	
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
						
	.timebox{display: inline-block;width:50px;text-align: center;}
	.timebox2{display: inline-block; width:80px;text-align: center;}
	.menubox{display: inline-block; width:300px;text-align: center;}
	ul{list-style: none;padding:0px;}
 	li{width:600px;} 
	.hidmenu{display: none;}
	
	#bot{margin:30px 10px 30px;}
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
// 		$("#show_time").click(function(){
// 			$(".hidmenu").toggle();
// 			if($(".ronly").prop("readonly",false)){
// 				$(".ronly").attr("readonly","readonly");
// 				$(".ronly").css("background-color","lightgrey");
// // 				$(".hidmenu").css("display","none")
// 			}else if($(".ronly").css("background-color","lightgrey")){
// 				alert("d");
// 				$(".ronly").removeAttr("readonly");
// 				$(".ronly").css("background-color","white");
// 			}
// 		});
		$("#show_time").click(function(){
			$(".hidmenu").toggle();
			if($(".ronly").attr("readonly")=="readonly"){
				$(".ronly").removeAttr("readonly");
				$(".ronly").css("background-color","white");
			}else{
				for (var i = 0; i < 5; i++) {
					var t1val=$("#t1").val();
					$(".t1").eq(i).val(t1val);
					var t2val=$("#t2").val();
					$(".t2").eq(i).val(t2val);
				}
				$(".ronly").attr("readonly","readonly");
				$(".ronly").css("background-color","lightgrey");
			}
		});
		if($("input[name=s_time]").eq(0).is(":checked")){
			alert('dfd');
		}
	});
	
	$(function(){
		$(".testmod").click(function(){
			$('div.modal').modal();
		})
	})
	

</script>
</head>
<body>
<div id="container">
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            flkqnwkrtj
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	<form action="owner_regist_finish.do" method="post">
		<div id="tle">
			<div id="regist" class="testmod">
				매장 정보 입력
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장명</div>
					<div class="inputs"><input type="text" name="s_title"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">대표명</div>
					<div class="inputs"><input type="text" readonly/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">간단소개<br>(30자이내)</div>
					<div class="inputs">
						<textarea name="s_intro_small"></textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장소개<br>(500자이내)</div>
					<div class="inputs">
						<textarea name="s_intro_big"></textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장종류</div>
					<div class="inputs">
						<div>
							<div class="catechkboxes">
								<input type="checkbox" name="s_cate" value="A"/>동물병원
								<input type="checkbox" name="s_cate" value="B"/>동물병원
								<input type="checkbox" name="s_cate" value="C"/>동물병원
								<input type="checkbox" name="s_cate" value="D"/>동물병원
								<input type="checkbox" name="s_cate" value="E"/>동물병원
							</div>
							<div class="catechkboxes">
								<input type="checkbox" name="s_cate" value="F"/>동물병원
								<input type="checkbox" name="s_cate" value="G"/>동물병원
								<input type="checkbox" name="s_cate" value="H"/>동물병원
								<input type="checkbox" name="s_cate" value="I"/>동물병원
								<input type="checkbox" name="s_cate" value="J"/>동물병원
							</div>
							<div class="catechkboxes">
								<input type="checkbox" name="s_cate" value="F"/>동물병원
								<input type="checkbox" name="s_cate" value="G"/>동물병원
								<input type="checkbox" name="s_cate" value="H"/>동물병원
								<input type="checkbox" name="s_cate" value="I"/>동물병원
								<input type="checkbox" name="s_cate" value="J"/>동물병원
							</div>
						</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장<br>전화번호</div>
					<div class="inputs"><input type="text" name="s_s_phone" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">담당자<br>전화번호</div>
					<div class="inputs">
						<input type="text" name="s_o_phone" placeholder="'-' 없이 입력"/>
						<button type="button" class="btn">휴대폰 인증</button>
					</div>
					
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업상태</div>
					<div class="inputs">
						<select>
							<option>영업중</option>
							<option>휴업중</option>
							<option>폐점</option>
						</select>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">주소</div>
					<div class="inputs">
						<textarea name="s_addr" class="flleft" placeholder="주소"></textarea>
						<button type="button" class="btn flleft">주소찾기</button>
						<div class="inputs"><input name="s_addr_detail" placeholder="상세주소"/></div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">사진업로드</div>
					<div class="inputs">
						<div class="filebox">
							<input class="upload-name" value="파일선택" disabled="disabled">
							<label class="btn" for="filename02">업로드</label>
							<input type="file" id="filename02" class="upload-hidden">
<!-- 							<input type="file" id="filename02" class="upload-hidden" required="required"> -->
						</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업시간등록</div>
					<div class="inputs">
							<ul>
								<li>
									<span class="timebox">휴점일</span>
									<span class="timebox2">요일</span>
									<span class="timebox2">오픈시간</span>
									<span class="timebox2">&nbsp;&nbsp;마감시간</span>
								</li> 
							</ul>
							<ul>
								<li>
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2"><b>평일</b></span>
									<input id="t1" class="timebox2 ronly" type="text" name="s_time1" placeholder="0900"/> - <input id="t2" class="timebox2 ronly" type="text" name="s_time2" placeholder="1800"/>
									<span id="show_time" class="btn timebox2" style="height:24px; width:48px;line-height: 10px">
										▼
									</span>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2">월요일</span>
									<input class="timebox2 t1" type="text" name="s_time1"/> - <input class="timebox2 t2" type="text" name="s_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2">화요일</span>
									<input class="timebox2 t1" type="text" name="s_time1"/> - <input class="timebox2 t2" type="text" name="s_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2">수요일</span>
									<input class="timebox2 t1" type="text" name="s_time1"/> - <input class="timebox2 t2" type="text" name="s_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2">목요일</span>
									<input class="timebox2 t1" type="text" name="s_time1"/> - <input class="timebox2 t2" type="text" name="s_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2">금요일</span>
									<input class="timebox2 t1" type="text" name="s_time1"/> - <input class="timebox2 t2" type="text" name="s_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2"><b>토요일</b></span>
									<input class="timebox2" type="text" name="s_time1"/> - <input class="timebox2" type="text" name="s_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2"><b>일요일</b></span>
									<input class="timebox2" type="text" name="s_time1"/> - <input class="timebox2" type="text" name="s_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="s_week"/><span class="timebox2"><b>공휴일</b>	</span>
									<input class="timebox2" type="text" name="s_time1"/> - <input class="timebox2" type="text" name="s_time2"/>
								</li> 
								<li>
									<br>
									<div class="inputs"><textarea class="" name="s_time_etc" placeholder="영업시간 관련된 공지사항이 추가로 있으실경우 이곳에 적어주세요."></textarea></div>
								</li>
							</ul>
					</div>
				</div>
				
				<div class="inputbox">
					<div class="inputtitle">메뉴등록</div>
					<div class="inputs">
					<ul>
						<li>
							<span class="timebox2">메뉴명</span>
							<span class="menubox">설명</span>
							<span class="timebox2">가격</span>
							<span class="timebox" title="체크하시면 예약기능이 활성화됩니다.">예약</span>
						</li> 
					</ul>
					<ul>
						<li>
							<span class="timebox2"><input class="timebox2 t1" type="text" name="s_time"/></span>
							<input id="t1" class="menubox" type="text" name="s_time"/>
							<input id="t2" class="timebox2" type="text" name="s_time"/>
							<input class="settime" class="timebox" type="button" style=" width:48px;" value="설정"/>
							<span id="show_menu" class="btn btn2 timebox2" style="height:24px; width:48px;line-height: 10px">
								+
							</span>
						</li> 
						<li>
							<span class="timebox2"><input class="timebox2 t1" type="text" name="s_time"/></span>
							<input class="menubox t1" type="text" name="s_time"/>
							<input class="timebox2 t2" type="text" name="s_time"/>
							<input class="settime" class="timebox" type="button" style=" width:48px;" value="설정"/>
						</li> 
					</ul>
					</div>
				</div>
				<div class="inputbox lastbox">
					<div class="inputtitle">계좌등록</div>
					<div class="inputs">
						<select name="s_bank">
							<option>--은행선택--</option>
							<option>신한</option>
							<option>기업</option>
							<option>하나</option>
							<option>우리</option>
							<option>농협</option>
						</select>
						<input name="s_account"/>
					</div>
					
				</div>
				<br>
					<div id="bot" class="flright" >
						<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
						<input class="btn greenbtn" value="입점신청" type="submit"/>
					</div>
					<br>
					<br>
					<br><br>
					<br>
					<br>
				
			</div>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../all/footer.jsp" />