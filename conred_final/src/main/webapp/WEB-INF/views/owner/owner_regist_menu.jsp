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
	.inputs{width:600px;float: left;height:auto;}
	.width_500{width:500px;}
	
	
	textarea[name=store_time_other]{width:370px;}
	textarea[name=store_simple_intro]{width:500px;}
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
	.filebox .upload-name { display: inline-block; padding: .5em .75em; height:25px;/* label의 패딩값과 일치 */
						
						font-size: inherit; font-family: inherit; line-height: normal;
						vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none;
						/* 네이티브 외형 감추기 */
						-moz-appearance: none; appearance: none; }
						
	.timebox{display: inline-block;width:50px;text-align: center;}
	.timebox2{display: inline-block; width:80px;text-align: center;}
	.menubox{display: inline-block; width:310px;text-align: center;}
	ul{list-style: none;padding:0px;}
 	li{width:650px;} 
	.hidmenu{display: none;}
	
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
		$("#show_time").click(function(){
			$(".hidmenu").toggle();
			if($(".ronly").attr("readonly")=="readonly"){
				$(".ronly").removeAttr("readonly");
				$(".ronly").css({"background-color":"white","border-width":"1px","border-radius":"3px","height":"26px"});
				$(".ronly").css("border-width","1px");
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
		
// 		$("body").on("click",".settime",function(){
// 			$('div.modal').modal();
// 		})

		//만약 메뉴등록에서 예약 셀렉트박스에 시간제, 숙박제가 있을 경우
		//readonly 풀어주기
// 		$("body").on("change",".settime",function(){
// 			if($(this).val()=="T"){
// 				alert("당일:시간제");
// 				$("input[name=store_maxman]").removeAttr("readonly");
// 			}else if($(this).val()=="S"){
// 				alert("숙박:숙박제");
// 				$("input[name=store_maxdate]").removeAttr("readonly");
// 			}
// 		});
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
	});
	
	

</script>
</head>
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
	<form action="owner_regist_finish.do" method="post">
		<div id="tle">
			<div id="regist" class="testmod">
				서비스/메뉴 정보 입력
			</div> 
			<div>
				<div class="inputbox">
					<div class="inputtitle">매장종류</div>
					<div class="inputs">
						<div class="catechkboxes_big">
							<div class="catechkbox">
								대표 매장종류<br>
								*한가지만 선택<br>
								*지도위의 아이콘용
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>동물병원
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>카페/식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>식품/용품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>숙박
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>돌봄서비스
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>미용
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>체험
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>분양/교배
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code" value="A"/>장례
							</div>
						</div>
						<div class="catechkboxes">
							<div class="catechkbox">
								해당되는 항목을 모두 체크해주세요<br>
								*대표 매장종류에 해당되지 않아도 선택 가능합니다<br>
								*
								
							</div> 
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="a1"/>종합
								<input type="checkbox" name="category_code_small" value="a2"/>내과
								<input type="checkbox" name="category_code_small" value="a3"/>외과
								<input type="checkbox" name="category_code_small" value="a4"/>치과
								<input type="checkbox" name="category_code_small" value="a5"/>24시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="b1"/>동반가능 카페
								<input type="checkbox" name="category_code_small" value="b2"/>동반가능 식당
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="c1"/>용품
								<input type="checkbox" name="category_code_small" value="c2"/>식품
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="d1"/>글램핑/카라반
								<input type="checkbox" name="category_code_small" value="d2"/>펜션
								<input type="checkbox" name="category_code_small" value="d3"/>풀빌라
								<input type="checkbox" name="category_code_small" value="d4"/>호텔
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="e1"/>호텔
								<input type="checkbox" name="category_code_small" value="e2"/>펫시터
								<input type="checkbox" name="category_code_small" value="e3"/>유치원
								<input type="checkbox" name="category_code_small" value="e4"/>펫택시
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="f1"/>미용
								<input type="checkbox" name="category_code_small" value="f2"/>목욕
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="g1"/>놀이터
								<input type="checkbox" name="category_code_small" value="g2"/>운동장
								<input type="checkbox" name="category_code_small" value="g3"/>훈련
								<input type="checkbox" name="category_code_small" value="g4"/>수영장
								<input type="checkbox" name="category_code_small" value="g5"/>스튜디오
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="h1"/>분양 
								<input type="checkbox" name="category_code_small" value="h2"/>교배
								<input type="checkbox" name="category_code_small" value="h3"/>유기견
							</div>
							<div class="catechkbox">
								<input type="checkbox" name="category_code_small" value="i1"/>장례
							</div>
						</div>
					</div>
				</div>
				
				<div class="inputbox">
					<div class="inputtitle">메뉴등록</div>
					<div  class="inputs">
					<ul>
						<li>
							<span class="timebox2" style="width:110px;">메뉴명</span>
							<span class="menubox">설명</span>
							<span class="timebox2">가격</span>
							<span class="timebox" title="체크하시면 예약기능이 활성화됩니다." style="width:70px;">예약</span>
						</li> 
					</ul>
					<ul id="menuboxes">
						<li>
							<input class="timebox2 t1" type="text" name="menu_name" style="width:110px;" placeholder="멍멍개껌"/>
							<input id="t1" class="menubox" type="text" name="menu_content" placeholder="강아지들에게 인기만점인 멍멍개껌입니다~"/>
							<input id="t2" class="timebox2" type="text" name="menu_price" placeholder="10000"/>
							<select class="settime" name="menu_state" style="width:70px;">
								<option value="N">미사용</option>
								<option value="T">시간제</option>
								<option value="S">숙박제</option>
							</select>
							<span id="show_menu" class="btn btn2 timebox2" style="height:24px; width:48px;line-height: 10px">
								+
							</span>

						</li> 
						<li>
							<input class="timebox2 t1" type="text" name="menu_name" style="width:110px;"/>
							<input class="menubox t1" type="text"  name="menu_content"/>
							<input class="timebox2 t2" type="text" name="menu_price"/>
							<select class="settime"  name="menu_state" style="width:70px;">
								<option value="N">미사용</option>
								<option value="T">시간제</option>
								<option value="S">숙박제</option>
							</select>
<!-- 							<input class="settime" class="timebox" type="button" style=" width:48px;" value="설정"/> -->
							<span class="btn btn2 timebox2 hide_menu" style="height:24px; width:48px;line-height: 10px">
								-
							</span>
						</li> 
					</ul>
					</div>
				</div>
				<div class="inputbox lastbox">
					<div class="inputtitle">예약관련 설정</div>
					<div class="inputs">
						<div>※최대 예약일 : <input type="text" name="store_maxdate" placeholder="0"  readonly/>일</div>
						<div class="subinfo">*최대 몇 일까지 예약 가능한가요? 1박2일의 경우 : 2일</div>
						<div class="subinfo">*시간제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
						<br>
						<div>※시간당 최대 허용인원 : <input type="text" name="store_maxman" placeholder="0" readonly/>명</div>
						<div class="subinfo">*한시간에 몇 명의 예약을 받을 수 있나요?</div>
						<div class="subinfo">*숙박제 예약메뉴가 있는경우에 한해 작성가능합니다.</div>
					</div>
				</div>
			
				<br>
					<div id="bot" class="flright" >
						<input class="btn greenbtn" value="이전 단계로" onclick="location.href='owner_regist_store.do'" type="button"/>
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