<%@page import="com.hk.conred.dtos.SDto"%>
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

<!-- 시간지정용 데이트피커 소스 -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

<style type="text/css">
	.greenbtn:hover{background-color: #04B404;color:white} 
	.redbtn:hover{background-color: #FE2E2E;color:white} 
	.clrboth{clear: both;}
	.flright{float: right;}
	.flleft{float: left;}
	.btn{background-color: grey;margin-left:10px;color:white;}
	.btn2{margin-left:0px;}

	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;height:auto;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	
	#regist{font-weight: bold; font-size: 20px;margin-bottom: 40px;}
	 
	#tle{margin:0 auto;padding-top:40px;width: 800px;}
	.inputbox{margin-top:0px;margin-bottom:-5px; padding:26px 10px 26px;height:auto;width:800px; display: inline-block;border: 0px solid lightgrey;border-bottom-width: 1px;}
	.inputbox:hover{background-color: #f3f3f3;}
	.lastbox{border: 0px solid lightgrey;}
	.inputtitle{float:left;height:auto;line-height: 200%;padding-right:20px;width:140px;}
	input{margin-top:2px;}
	textarea{margin-top:2px;resize: none;}
	select {position:relative;top:1px;height:26px;}
	.form-control{width:180px;}
	.inputs{width:600px;float: left;height:auto;}
	.width_500{width:500px;}
	
	
	textarea[name=store_time_other]{width:544px;}
	textarea[name=store_intro_simple]{width:500px;}
	textarea[name=store_intro]{width:500px;height:100px;}
	textarea[name=store_address]{width:220px;height:100px;}
	
	.catechkboxes_big{width:150px;height:100px;float: left;}
	.catechkboxes{float: left;}
	.catechkbox{padding-bottom:10px;}
	input[name=category_code_small],input[name=category_code]{margin-left:10px;}
	
	.filebox input[type="file"] { position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; }
 	.filebox label { display: inline-block; padding: .5em .75em;  font-size: inherit; line-height: normal; 
 					vertical-align: middle; background-color: grey; cursor: pointer; border: 1px solid #ebebeb; 
					border-bottom-color: #e2e2e2; border-radius: .25em; margin-bottom: 0px;}
	.filebox .upload-name { display: inline-block; padding: .5em .75em; height:34px;/* label의 패딩값과 일치 */
						
						font-size: inherit; font-family: inherit; line-height: normal;
						vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none;
						/* 네이티브 외형 감추기 */
						-moz-appearance: none; appearance: none; }
						
	#timeboxhead{line-height: 29px;}
	.timebox{display: inline-block;width:50px;text-align: center;}
	.timebox2{display: inline-block; width:140px;text-align: center;}
	.menubox{display: inline-block; width:310px;text-align: center;}
	ul{list-style: none;padding:0px;}
 	li{width:650px;} 
/* 	.hidmenu{display: none;} */
	
	.timepicker{width:140px;}
	
	#show_menu,#show_time,.hide_menu{margin-bottom:2.5px;}
	
	input[name=store_maxdate],input[name=store_maxman]{width:30px;background-color: #f0f0f0;border:1px solid grey}
	.subinfo{font-size:12px;color: grey;}
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
		$("#show_time").on('click',function(){
			$(".hidmenu").slideToggle()
			if($(".ronly").attr("readonly")=="readonly"){//토글 다시 올렸을때
// 				$(".ronly").removeAttr("readonly");
				$(".ronly").css({"background-color":"white"});
				$("#t1").attr('disabled', false);
				$("#t2").attr('disabled', false);
				$(".hidmenu").find($(".timepicker"))
				.attr('disabled', true);
				
			}else{//토글 내렸을 때
				for (var i = 0; i < 5; i++) {//평일값이 월화수목금에 똑같이 들어가게
					var t1val=$("#t1").val();
					$(".t1").eq(i).val(t1val);
					var t2val=$("#t2").val();
					$(".t2").eq(i).val(t2val);
				}
// 				$(".ronly").attr("readonly","readonly");//평일줄 리드온리로 바뀌고
				$(".ronly").css("background-color","lightgrey");//평일줄 백그색 바뀌고
				$("#t1").attr('disabled', true);//평일왼쪽 클릭안먹고 값도 안넘어가고(아예 아무것도 안되는것임)
				$("#t2").attr('disabled', true);//평일오른쪽 클릭안먹고
				$(".hidmenu").find($(".timepicker"))
				.attr('disabled', false);//하이드메뉴는 타임픽커작동하고
				if($("input:checkbox[name=store_time_day]").is(":checked")==true){
					$(".hidmenu").find($(".timepicker"))
					.attr('disabled', true);//휴점일에 체크가되어있을때 타임피커는 멈춘다.
				}
				
			}
		});
		
// 		if($("input[name=s_time]").eq(0).is(":checked")){
// 			alert('dfd');
// 		}
		
		$("#show_menu").click(function(){
			$("#menuboxes").append('<li>'+
			'<input class="timebox2 t1" type="text" name="menu_name" style="width:110px;"/> '+
			'<input class="menubox t1" type="text" name="menu_content"/> '+
			'<input class="timebox2 t2" type="text" name="menu_price"/> '+
			'<select class="settime" name="menu_state" style="width:70px;">'+
			'<option value="N">미사용</option><option value="T">시간제</option><option value="S">숙박제</option>'+
			'</select> '+
			'<span class="btn btn2 timebox2 hide_menu" style="height:24px; width:48px;line-height: 10px">-</span>'+
			'</li> ');
		});
		
		$("body").on("click",".hide_menu",function(){
			$(this).parent("li").remove();
		});

		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있다가 없어질 경우
		//readonly 다시 주기
		$("body").on("change",".settime",function(){
			var n=0;
			var t=0;
			var s=0;
			for (var i = 0; i < $("input[name=menu_name]").length; i++) {
				if($(".settime").eq(i).val()=="S"){
					s++;
				}else if($(".settime").eq(i).val()=="T"){
					t++;
				}else if($(".settime").eq(i).val()=="N"){
					n++;
				}
			}
			if(s>0){ //'숙박제'가 0보다크면 readonly 없애기
// 				alert("숙박제가 입력가능해집니다");
				$("input[name=store_maxdate]").removeAttr("readonly");
				$("input[name=store_maxdate]").css("background-color","white");
			}
			if(t>0){ //'시간제'가 0보다크면 readonly 없애기
// 				alert("시간제가 입력가능해집니다");
				$("input[name=store_maxman]").removeAttr("readonly");
				$("input[name=store_maxman]").css("background-color","white");
			}

			if(s==0){ //'숙박제'가 0이면 안에 값 지우고readonly 처리
// 				alert("숙박제가 리드온리처리됩니다.");
				$("input[name=store_maxdate]").val("");
				$("input[name=store_maxdate]").attr("readonly","readonly");
				$("input[name=store_maxdate]").css("background-color","#f2f2f2");
			}
			if(t==0){ //'시간제'가 0이면 안에 값 지우고 readonly 처리
// 				alert("시간제가 리드온리처리됩니다.");
				$("input[name=store_maxman]").val("");
				$("input[name=store_maxman]").attr("readonly","readonly");
				$("input[name=store_maxman]").css("background-color","#f2f2f2");
			}
		});
		$('.timepicker').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '0',
		    maxTime: '23:50pm',
		    defaultTime: '9',
		    startTime: '00:00',
		    dynamic: false	,
		    dropdown: true,
		    scrollbar: true
		});
		
 		$("body").on("change","input:checkbox[name=breakday]",function(){//breakday체크박스가 바뀌면
			if($(this).is(":checked")==true){//만약 체크가 되어있으면
				$(this).parent().find($(".timepicker"))//타임피커의 값 없애고, 회색처리, 못쓰게, 네임도지우기
				.val("")
				.css("background-color","#f2f2f2")
// 				.attr('disabled', true)
				.removeAttr('name')
				;
				$(this).attr('name','store_time_time');
				
				if($(this).parent().find($(".timepicker")).attr('id')=="t1"){//그랬는데 알고보니 '평일'이었다면
					$(".hidmenu").find($(".timepicker"))//모든 히든메뉴의 타임피커 값 없애고, 회색처리, 못쓰게, 네임도지우기
					.val("")
					.css("background-color","#f2f2f2")
// 					.attr('disabled', true)
					.removeAttr('name')
					;
					
					$(".hidmenu").find("input:checkbox[name=breakday]")//체크박스이름을 store_time_day로 전환
					.attr('name','store_time_day');
				}
			}
		});
		$("body").on("change","input:checkbox[name=store_time_time]",function(){
			if($(this).is(":checked")==false){
				$(this).parent().find($(".timepicker")).eq(0)
				.val("9:00 AM")
				.css("background-color","#ffffff")
// 				.attr('disabled', false)
				.attr('name','store_time_time1');
				
				$(this).parent().find($(".timepicker")).eq(1)
				.val("9:00 AM")
				.css("background-color","#ffffff")
// 				.attr('disabled', false)
				.attr('name','store_time_time2');
				
				$(this).attr('name','breakday');
				
				if($(this).parent().find($(".timepicker")).attr('id')=="t1"){
					$(".hidmenu").find($(".timepicker"))
					.val("9:00 AM")
					.css("background-color","#ffffff")
// 					.attr('disabled', false)
					.attr('name','store_time_time')
					;
					
					$(".hidmenu").find("input:checkbox[name=store_time_day]")
					.attr('name','breakday');
				}
			}
		}); 
	});
	
	

</script>
</head>
<%
	SDto sdto=(SDto)request.getAttribute("sdto");
// 	sdto.getStore_seq();
	SDto asd=(SDto)session.getAttribute("asdf");
%>
<body>
<div id="container">
<!-- <div class="modal fade" id="layerpop" > -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       header -->
<!--       <div class="modal-header"> -->
<!--         닫기(x) 버튼 -->
<!--         <button type="button" class="close" data-dismiss="modal">×</button> -->
<!--         header title -->
<!--         <h4 class="modal-title">Header</h4> -->
<!--       </div> -->
<!--       body -->
<!--       <div class="modal-body"> -->
<!--             flkqnwkrtj -->
<!--       </div> -->
<!--       Footer -->
<!--       <div class="modal-footer"> -->
<!--         Footer -->
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button> -->
<!--       </div> -->
<!--     </div> -->
<!--   </div> -->
<!-- </div> -->
<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
<!--       header -->
<!--       <div class="modal-header"> -->
<!--         닫기(x) 버튼 -->
<!--         <button type="button" class="close" data-dismiss="modal">×</button> -->
<!--         header title -->
<!--         <h4 class="modal-title">Header</h4> -->
<!--       </div> -->
<!--       body -->
      <div class="modal-body">
            
        <button type="button" class="btn btn-default" data-dismiss="modal">시간예약제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">숙박예약제</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">설정안함제</button>
      </div>
<!--       Footer -->
      <div class="modal-footer">
        Footer
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
	<form action="owner_regist_menu.do" method="post">
		<div id="tle">
			<div id="regist" class="testmod">
				매장 정보 입력
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장명</div>
					<div class="inputs"><input class="form-control" type="text" name="store_name" placeholder="예)양평 동물병원"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">대표명</div>
					<div class="inputs"><input class="form-control" type="text" readonly/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">홈페이지 링크</div>
					<div class="inputs"><input class="width_500 form-control" type="text" name="store_path" placeholder="홈페이지 링크를 입력해주세요."/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">사진업로드</div>
					<div class="inputs">
						<div class="filebox">
							<input class="upload-name" value="파일선택" disabled="disabled">
							<label class="btn" for="filename02">업로드</label>
							<input type="file" id="filename02" class="upload-hidden">
<!-- 							<input type="file" id="filename02" class="upload-hidden" required="required"> -->
						<div class="subinfo">
							<br>
							* 매장의 사진을 최소 5개 업로드해주세요.
						</div>
						<div class="subinfo">
							* 메뉴의 사진을 올리고싶다면 해당 사진 입력란에 메뉴명을 적어주세요.
						</div>
						<div class="subinfo">
							* 가로1200px*세로400px에 가까운 사진일수록 매장사진이 이쁘게 들어갑니다.
						</div>
						</div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">간단소개<br>(30자이내)</div>
					<div class="inputs">
						<textarea class="form-control" name="store_intro_simple" placeholder="매장이름과 함께 지도에 노출될 간단 소개글을 입력해주세요. (40자 이내)"></textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장소개<br>(500자이내)</div>
					<div class="inputs">
						<textarea class="form-control" name="store_intro" placeholder="매장의 상세소개글을 입력해주세요. (500자 이내)"></textarea>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업상태</div>
					<div class="inputs">
						<select class="form-control" name="store_state">
							<option value="O">영업중</option>
							<option value="B">휴업중</option>
							<option value="C">폐점</option>
						</select>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">매장<br>전화번호</div>
					<div class="inputs"><input class="form-control" type="text" name="store_phone" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">담당자<br>전화번호</div>
					<div class="inputs"><input class="form-control" type="text" name="store_phone_manager" placeholder="'-' 없이 입력"/></div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">주소</div>
					<div class="inputs">
						<textarea name="store_address" class="flleft form-control" placeholder="주소"></textarea>
						<button type="button" class="btn flleft">주소찾기</button>
						<div class="inputs"><input class="form-control" name="store_address_detail" placeholder="상세주소"/></div>
					</div>
				</div>
				<div class="inputbox">
					<div class="inputtitle">영업시간등록</div>
					<div class="inputs">
							<ul>
								<li id="timeboxhead">
									<span class="timebox">휴점일</span>
									<span class="timebox2">요일</span>
									<span class="timebox2">오픈시간</span>
									<span class="timebox2">&nbsp;&nbsp;마감시간</span>
								</li> 
							</ul>
							<ul>
								<li>
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2 weekbox">평일</span>
									<input type="hidden" name="store_time_day" value="평일">
									<input id="t1" class="timebox2 ronly timepicker form-control" name="store_time_time"/> - <input id="t2" class="timebox2 ronly timepicker form-control" name="store_time_time2"/>
									<span id="show_time" class="btn timebox2" style="height:24px; width:48px;line-height: 10px">
										▼
									</span>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">월요일</span>
									<input type="hidden" name="store_time_day" value="월요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_time" /> - <input class="timebox2 t2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">화요일</span>
									<input type="hidden" name="store_time_day" value="화요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_time"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">수요일</span>
									<input type="hidden" name="store_time_day" value="수요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_time"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox " type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">목요일</span>
									<input type="hidden" name="store_time_day" value="목요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_time"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li class="hidmenu">
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">금요일</span>
									<input type="hidden" name="store_time_day" value="금요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_time"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">토요일</span>
									<input type="hidden" name="store_time_day" value="토요일">
									<input class="timebox2 timepicker form-control" name="store_time_time"/> - <input class="timebox2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">일요일</span>
									<input type="hidden" name="store_time_day" value="일요일">
									<input class="timebox2 timepicker form-control" name="store_time_time"/> - <input class="timebox2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="breakday" value="휴점일"/>
									<span class="timebox2">공휴일</span>
									<input type="hidden" name="store_time_day" value="공휴일">
									<input class="timebox2 timepicker form-control" name="store_time_time"/> - <input class="timebox2 timepicker form-control" name="store_time_time2"/>
								</li> 
								<li>
									<br>
									<div class="inputs"><textarea class="form-control" name="store_time_other" placeholder="영업시간 관련된 공지사항이 추가로 있으실경우 이곳에 적어주세요."></textarea></div>
								</li>
							</ul>
					</div>
				</div>
				<div class="inputbox lastbox">
					<div class="inputtitle">계좌등록</div>
					<div class="inputs">
						은행
						<select class="form-control" name="store_bank">
							<option>--은행선택--</option>
							<option value="신한">신한</option>
							<option value="기업">기업</option>
							<option value="하나">하나</option>
							<option value="우리">우리</option>
							<option value="농협">농협</option>
							<option value="국민">국민</option>
						</select>
						<br>
						계좌번호
						<input class="form-control" name="store_account" placeholder="'-' 없이 입력"/>
					</div>
					
				</div>
				<br>
					<div id="bot" class="flright" >
						<input class="btn greenbtn" value="전단계로" onclick="location.href='owner_regist_certify.do'" type="button"/>
						<input class="btn redbtn" value="취소" onclick="location.href='index.jsp'" type="button"/>
						<input class="btn greenbtn" value="다음 단계로" type="submit"/>
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