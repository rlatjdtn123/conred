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
	.filebox .upload-name { display : inline-block; padding: .5em .75em; height:34px;/* label의 패딩값과 일치 */
						
						font-size: inherit; font-family: inherit; line-height: normal;
						vertical-align: middle; background-color: #f5f5f5; border: 1px solid #ebebeb;
						border-bottom-color: #e2e2e2; border-radius: .25em; -webkit-appearance: none;
						/* 네이티브 외형 감추기 */
						-moz-appearance: none; appearance: none; }
						
	#timeboxhead{line-height: 29px;}
	.timebox{display: inline-block;width:50px;text-align: center;margin-left:10px;margin-right:10px;}
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
	
	/*--파일업로드관련--*/
	#preview img {width: 180px;height: 100px;overflow: hidden;}
	#preview p {text-overflow: ellipsis;overflow: hidden;}
	.preview-box {border: 0px solid grey;padding: 5px;border-radius: 2px;margin-bottom: 5px;margin-right:5px;
				display: inline-block;
    			border-radius: 5px;
    			border-right-width: 1px;
    			border-bottom-width: 1px;
					}
	.thumbnail{margin-bottom:0px;}
/* 	.del_btn{float: right;display: inline-block;} */
/* 	.f_name{float:left;display: inline-block;margin-left:0px;} */
	.f_insert{margin:0px;display: inline-block;float: left;}
	.attach_count{display: inline-block;margin:5px 10px 15px;font-size:18px;}
/* 	.attach_count::after{clear:both;} */
	/*-------------*/
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

		$("#show_time").on('click',function(){

			for (var i = 0; i < 5; i++) {//평일값이 월화수목금에 똑같이 들어가게
				var t1val=$("#t1").val();
				$(".t1").eq(i).val(t1val);
				var t2val=$("#t2").val();
				$(".t2").eq(i).val(t2val);
			}
				
		});
		
		$("body").on("change","input:checkbox[name=store_time_break]",function(){
			if($(this).is(':checked') == true){
				$(this).attr('value', 'Y');
				$(this).parent().find("input:hidden[name=store_time_break]").attr("disabled",true);
			}
			if($(this).is(':checked') == false){
				$(this).attr('value', 'N');
				$(this).parent().find("input:hidden[name=store_time_break]").attr("disabled",false);
			}
		});
		
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
		    timeFormat: 'HH:mm ',
		    interval: 30,
		    minTime: '0',
		    maxTime: '23:50pm',
		    defaultTime: '9',
		    startTime: '00:00',
		    dynamic: false	,
		    dropdown: true,
		    scrollbar: true
		});
		
 		
		
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
			$(".attach_count").text();
		});
	});
	
	/////////-------------------파일업로드관련
	
    //임의의 file object영역
    var files = {};
    var previewIndex = 0;

    // image preview 기능 구현
    // input = file object[]
    function addPreview(input) {
        if (input[0].files) {
            //파일 선택이 여러개였을 시의 대응
            for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
                var file = input[0].files[fileIndex];
                if(validation(file.name)) continue;
                setPreviewForm(file);
            }
        } else
            alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
    }
    
    function setPreviewForm(file, img){
        var reader = new FileReader();
        
        //div id="preview" 내에 동적코드추가.
        //이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
        reader.onload = function(img) {
            var imgNum = previewIndex++;
            $("#preview").append(
                    "<div class=\"preview-box\" value=\"" + imgNum +"\">" +
                    "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>" +
                    "<p class=\"f_name\">" + file.name + "</p>" +
                    "<div class=\"f_name\"><input class=\"form-control\" type=\"text\" name=\"새컬럼명(코멘트)\" placeholder=\"사진제목/이름(선택사항)\"></div>" +
                    "<a class=\"del_btn\" href=\"#a\" value=\"" + imgNum + "\" onclick=\"deletePreview(this)\">" +
                    "삭제" + "</a>"
                    + "</div>"
            );
            files[imgNum] = file;   
            $(".attach_count").text($(".preview-box").length+"/30");
        };
        
        reader.readAsDataURL(file);
    }

    //preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
    function deletePreview(obj) {
        var imgNum = obj.attributes['value'].value;
        delete files[imgNum];
        $(".attach_count").text($(".preview-box").length-1+"/30");
        $("#preview .preview-box[value=" + imgNum + "]").remove();
//         resizeHeight();
    }

    //client-side validation
    //always server-side validation required
    function validation(fileName) {
        fileName = fileName + "";
        var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
        var fileNameExtension = fileName.toLowerCase().substring(
                fileNameExtensionIndex, fileName.length);
        if (!((fileNameExtension === 'jpg')
                || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
            alert('jpg, gif, png 확장자만 업로드 가능합니다.');
            return true;
        } else {
            return false;
        }
    }
    
    /////////-------------------
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
					<!-- 파일업로드 관련 -->
					    <div class="wrapper">
					        <div class="body">
					            <!-- 첨부 버튼 -->
					            <div id="attach">
					                <label class="btn f_insert" for="uploadInputBox">사진 첨부하기</label>
					                <input id="uploadInputBox" style="display: none" type="file" name="filedata" multiple />
					            </div>
					            <div class="attach_count">
					            	0/30
					            </div>
					            <!-- 미리보기 영역 -->
					            <div id="preview" class="content"></div>
					            
					            <!-- multipart 업로드시 영역 -->
<!-- 					            <form id="uploadForm" style="display: none;" /> -->
					        </div>
					        <div class="footer">
<!-- 					            <button class="submit"><a href="#" title="등록" class="btnlink">등록</a></button> -->
					        </div>
					    </div>
					    
<!-- 					성수가만든거 -->
<!-- 						<div class="imgs_wrap">     -->
				          
<!-- 					    </div>           -->
<!-- 					    <div class="input_wrap">   -->
<!-- 					        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a> -->
<!-- 				    		<div class="upload_message"></div> -->
<!-- 					        <input type="file" id="input_imgs" multiple/> -->
<!-- 					    </div>   -->
<!-- 					내가만든거 -->
<!-- 						<div class="filebox"> -->
<!-- 							<input class="upload-name" value="파일선택" disabled="disabled"> -->
<!-- 							<label class="btn" for="filename02">업로드</label> -->
<!-- 							<input type="file" id="filename02" class="upload-hidden"> -->
<!-- <!-- 							<input type="file" id="filename02" class="upload-hidden" required="required"> --> 
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
									<span class="timebox" style="margin:0px">휴점일</span>
									<span class="timebox mar_right1">요일</span>
									<span class="timebox2">오픈시간</span>
									<span class="timebox2">&nbsp;&nbsp;마감시간</span>
								</li> 
							</ul>
							<ul>
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox weekbox mar_right1">월요일</span>
									<input type="hidden" name="store_time_day" value="월요일">
									<input id="t1" class="timebox2 ronly timepicker form-control" name="store_time_open"/> - <input id="t2" class="timebox2 ronly timepicker form-control" name="store_time_close"/>
									<span id="show_time" class="btn timebox2" style="height:24px; width:100px;line-height: 10px">
										평일 맞추기
									</span>
									<span class="subinfo">*월요일기준</span>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">화요일</span>
									<input type="hidden" name="store_time_day" value="화요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">수요일</span>
									<input type="hidden" name="store_time_day" value="수요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox " type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">목요일</span>
									<input type="hidden" name="store_time_day" value="목요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">금요일</span>
									<input type="hidden" name="store_time_day" value="금요일">
									<input class="timebox2 t1 timepicker form-control" name="store_time_open"/> - <input class="timebox2 t2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">토요일</span>
									<input type="hidden" name="store_time_day" value="토요일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">일요일</span>
									<input type="hidden" name="store_time_day" value="일요일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
								</li> 
								<li>
									<input class="timebox" type="checkbox" name="store_time_break"/>
									<input type="hidden" name="store_time_break" value="N"/>
									<span class="timebox">공휴일</span>
									<input type="hidden" name="store_time_day" value="공휴일">
									<input class="timebox2 timepicker form-control" name="store_time_open"/> - <input class="timebox2 timepicker form-control" name="store_time_close"/>
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