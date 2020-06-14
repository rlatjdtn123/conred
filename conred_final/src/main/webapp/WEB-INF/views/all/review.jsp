<jsp:include page="../all/header2.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
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
<link href="css/star_service.css" rel="stylesheet"> 
<link href="css/star_price.css" rel="stylesheet">
<link href="css/star_clean.css" rel="stylesheet">
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:15px;border:1px solid grey;border-radius:6px;width:935px;height:370px; font-size: 15px; margin-left: 30px;min-height: 370px;background-color: #f2f2f2;}
	.myboxmargin{margin-top:30px;}
	#main{width: 850px;height: 250px;margin: 0 auto; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{} 
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{}      
	.contents{border-radius:5px;display:inline-block;padding: 10px; width: 895px;height:80px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;min-height: 80px; clear: both; background-color: #fafafa;margin-bottom: 15px;}        
	.info2{background-color: #fafafa;  height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 895px; min-height: 80px;border-radius:5px;word-break:keep-all;}
	.bot{margin: 0 auto; text-align: center;}
	.user_review_img{border: 1px solid red;width: 700px;height: 80px;margin-left: 210px;margin-bottom:22px;}
	
	 .modal-title{margin-left: 400px;}
	.modal-body span{margin: 5px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer{width: 897px; height: 630px;border-width: 0px;}
	
	
	input[type=file] {display: none;}
     .my_button {
         display: inline-block; width: 200px;  text-align: center; padding: 10px; background-color: #006BCC;color: #fff;
         text-decoration: none; border-radius: 5px; float: left;}
     .imgs_wrap { width: 880px;height:130px; border: 1px solid black;}
     .imgs_wrap img {max-width: 120px;max-height: 120px;min-width: 120px;min-height: 120px;margin-left: 25px;margin-right: 25px;}
	.input_wrap {margin: 10px 0 10px 0;}
	.modal_Btn{border: 0; margin-left: 300px; height: 50px; }
 	.overfive{float: left;} 
 	.star_bigtle{margin-left: 65px; float: left;}
 	.upload_message{height: 40px; width: 400px;margin-left: 215px; text-align: center; line-height: 37px;}
  	 .content_detail{background-color: #fafafa;margin-left: 765px;border-width: 0;}
	 .content_detail:hover {background-color: grey;} 
     .star_table{width: 200px; height: 80px;background-color: #fafafa;border-radius: 5px; padding: 10px;float: left;}
      .starz{width:17px;height:auto;display: inline-block;margin:-2px;margin-bottom:4px;}
      
      
       
</style>   
<script type="text/javascript">


	//////////////스크롤 페이징
	var count = 0;
	//스크롤 바닥 감지 
	window.onscroll = function(e) {
	    //추가되는 임시 콘텐츠
	    //window height + window scrollY 값이 document height보다 클 경우,
	    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
	    	//실행할 로직 (콘텐츠 추가) 
	        count++;
	        var addContent = ' <div class="mybox">  '       
	    		+'<img src="./img/profile_default.png" class="pf"/>'
	    			+' <div class="info"> '
	    			+	'<span>★★★★★</span><a style="margin-left: 560px;" id="md" onclick="mdTest()">자세히 보기</a> '
	    			+	'<span>닉네임:?? &nbsp;| 미용 / 컷트 </span><br><br><br>   '
	    			+	'<span class="contents">asdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjdddddddddddddddddddd'
	    			+	'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj</span>  ' 
	    		+	'</div>'
	    		+	'<div class="info2"> '   
	    			+'	<span style="font-weight: bold;">가게답변</span><br>'
	    			+	'<span>dddddddddddddddddddddddddddddddddd</span>'
	    		+	'</div>'
	    		+'</div> '     
	    		+'<br><br>';
	        //container에 추가되는 콘텐츠를 append
	        for (var i = 0; i < 20; i++) {
	        	if(count==i){
			        $('#container').append(addContent);		
	        	}
			} 
	    }
	};
 	
	
	
	//////////////////////////자세히보기
	$(function(){
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="370px"){  
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","200px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		});      
   
	});  
	
	
	//////////////모달창
	$(document).ready(function(){
	    $(".modal_Btn").click(function(){
	        $("div.modal").modal();
	        
	        ////////////////////////
	        var $star01 = $(".star-input01")
		    var $result01;
	        var $star_chacked=$star01.find(":checked"); 
		  $(document)
		    .on("focusin", ".star-input01>.input", function(){
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input01>.input", function(){
		    var $this = $(this);
		    setTimeout(function(){
		      if($this.find(":focus").length === 0){
		        $this.removeClass("focus");
		      }
		    }, 100); 
		  })
		    .on("change", ".star-input01 :radio", function(){ 
		    	$(this).parents(".star-input01").find("b").text($(this).val());
		  })
		    .on("mouseover", ".star-input01 label", function(){
		    	$(this).parents(".star-input01").find("b").text($(this).text());
		  })
		    .on("mouseleave", ".star-input01>.input", function(){
		    var $checked = $star01.find(":checked");
		    if($checked.length === 0){
		    	$(this).parents(".star-input01").find("b").text("0");
		    	$(this).parents(".star-input01").find("b").text("0");
		    } else {
		    	$(this).parents(".star-input01").find("b").text($checked.next().text());
		    	$(this).parents(".star-input01").find("b").text($checked.next().text());
		    }
		  }); 
		
		 /////////////////가격 평점
		  var $star02 = $(".star-input02"),
		      $result = $star02.find("output>b");
		  $(document)
		    .on("focusin", ".star-input02>.input", function(){
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input02>.input", function(){
		    var $this = $(this);
		    setTimeout(function(){
		      if($this.find(":focus").length === 0){
		        $this.removeClass("focus");
		      }
		    }, 100); 
		  })
		    .on("change", ".star-input02 :radio", function(){ 
		    	$(this).parents(".star-input01").find("b").text($(this).val());
		  })
		    .on("mouseover", ".star-input02 label", function(){
		    	$(this).parents(".star-input01").find("b").text($(this).text());
		  })
		    .on("mouseleave", ".star-input02>.input", function(){
		    var $checked = $star02.find(":checked");
		    if($checked.length === 0){
		    	$(this).parents(".star-input02").find("b").text("0");
		    } else {
		    	$(this).parents(".star-input02").find("b").text($checked.next().text());
		    }
		  }); 
		
		  /////////////////청결도 평점
		  var $star03 = $(".star-input03"),
		      $result = $star03.find("output>b");
		  $(document)
		    .on("focusin", ".star-input03>.input", function(){ 
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input03>.input", function(){
		    var $this = $(this);
		    setTimeout(function(){
		      if($this.find(":focus").length === 0){
		        $this.removeClass("focus");
		      }
		    }, 100); 
		  }) 
		    .on("change", ".star-input03 :radio", function(){ 
		    	$(this).parents(".star-input03").find("b").text($(this).val());
		  })
		    .on("mouseover", ".star-input03 label", function(){ 
		    	$(this).parents(".star-input03").find("b").text($(this).text());
		  })
		    .on("mouseleave", ".star-input03>.input", function(){
		    var $checked = $star03.find(":checked"); 
		    if($checked.length === 0){
		    	$(this).parents(".star-input03").find("b").text("0");
		    } else {
		    	$(this).parents(".star-input03").find("b").text($checked.next().text());
		    }
		  }); 
	        
	        
	      ////완료버튼  
		  $(".close").click(function(){
	      });  
		   
		  
		  
	    });
	});
	
	
	
	
	
	
	///////////////파일업로드
	// 이미지 정보들을 담을 배열
	var sel_files = [];
	
	
	$(document).ready(function() {
	    $("#input_imgs").on("change", handleImgFileSelect);
	}); 
	
	function fileUploadAction() {
	    console.log("fileUploadAction");
	    $("#input_imgs").trigger('click');
	}
	
	function handleImgFileSelect(e) {
	
	    // 이미지 정보들을 초기화
	    sel_files = [];
	    $(".imgs_wrap").empty();
	
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	    var index = 0;
	    filesArr.forEach(function(f) {
	        if(!f.type.match("image.*")) {
	            alert("확장자는 이미지 확장자만 가능합니다.");
	            return;
	        }
	
	        sel_files.push(f);
	
	        var reader = new FileReader();
	        reader.onload = function(e) {
	            var html = "<a style='width:120px;height:120px;' href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile overfive' title='Click to remove'></a>";
	            $(".imgs_wrap").append(html);
	                index++;
	                if(index>5){ 
						$(".overfive").eq(5).remove();
						$(".upload_message").text("5개까지만 등록할 수 있습니다.").css("color", "red");
					}else{
						$(".upload_message").text("");
					}
	        }
	        reader.readAsDataURL(f);
	        
	    });
	}



	function deleteImageAction(index) {
	    console.log("index : "+index);
	    console.log("sel length : "+sel_files.length);
	
	    sel_files.splice(index, 1);
	
	    var img_id = "#img_id_"+index;
	    $(img_id).remove(); 
	}
	
	function fileUploadAction() {
	    console.log("fileUploadAction");
	    $("#input_imgs").trigger('click');
	}
	

	
	
	
</script> 
</head>
<body>
<!-- 모탈창 부분 -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog modal-lg">
  		<!-- Modal content-->
   		<div class="modal-content">
     		<div class="modal-header"> 
       			<button type="button" class="close" data-dismiss="modal">리뷰 작성 완료</button>
       			<h4 class="modal-title">가게이름</h4>
     		</div>
     		<div class="modal-body"> 
     			<div class="star_bigtle"> 
  				<span class="star-input01">서비스
				    <span class="input">
					    <input type="radio" name="star-input01" id="s1" value="0.5"><label for="s1" class="star_service">0.5</label>
					    <input type="radio" name="star-input01" id="s2" value="1"><label for="s2" class="star_service">1</label>
					    <input type="radio" name="star-input01" id="s3" value="1.5"><label for="s3"class="star_service">1.5</label>
					    <input type="radio" name="star-input01" id="s4" value="2"><label for="s4" class="star_service">2</label>
					    <input type="radio" name="star-input01" id="s5" value="2.5"><label for="s5" class="star_service">2.5</label>
					    <input type="radio" name="star-input01" id="s6" value="3"><label for="s6" class="star_service">3</label>
					    <input type="radio" name="star-input01" id="s7" value="3.5"><label for="s7" class="star_service">3.5</label>
					    <input type="radio" name="star-input01" id="s8" value="4"><label for="s8" class="star_service">4</label>
					    <input type="radio" name="star-input01" id="s9" value="4.5"><label for="s9" class="star_service">4.5</label>
					    <input type="radio" name="star-input01" id="s10" value="5"><label for="s10" class="star_service">5</label>
				    </span>
			    	<output for="star-input"><b>0</b>점</output>
				</span>
				</div>
				<div class="star_bigtle">  
				<span class="star-input02">가격
				    <span class="input">
					    <input type="radio" name="star-input02" id="p1" value="0.5"><label for="p1" class="star_price">0.5</label>
					    <input type="radio" name="star-input02" id="p2" value="1"><label for="p2" class="star_price">1</label>
					    <input type="radio" name="star-input02" id="p3" value="1.5"><label for="p3" class="star_price">1.5</label>
					    <input type="radio" name="star-input02" id="p4" value="2"><label for="p4" class="star_price">2</label>
					    <input type="radio" name="star-input02" id="p5" value="2.5"><label for="p5" class="star_price">2.5</label>
					    <input type="radio" name="star-input02" id="p6" value="3"><label for="p6" class="star_price">3</label>
					    <input type="radio" name="star-input02" id="p7" value="3.5"><label for="p7" class="star_price">3.5</label>
					    <input type="radio" name="star-input02" id="p8" value="4"><label for="p8" class="star_price">4</label>
					    <input type="radio" name="star-input02" id="p9" value="4.5"><label for="p9" class="star_price">4.5</label>
					    <input type="radio" name="star-input02" id="p10" value="5"><label for="p10" class="star_price">5</label>
				    </span>
			    	<output for="star-input"><b>0</b>점</output>
		    	</span>
		    	</div>
		    	<div class="star_bigtle">
			    <span class="star-input03">청결도 
				    <span class="input">
					    <input type="radio" name="star-input03" id="c1" value="0.5"><label for="c1">0.5</label>
					    <input type="radio" name="star-input03" id="c2" value="1"><label for="c2">1</label>
					    <input type="radio" name="star-input03" id="c3" value="1.5"><label for="c3">1.5</label>
					    <input type="radio" name="star-input03" id="c4" value="2"><label for="c4">2</label>
					    <input type="radio" name="star-input03" id="c5" value="2.5"><label for="c5">2.5</label>
					    <input type="radio" name="star-input03" id="c6" value="3"><label for="c6">3</label>
					    <input type="radio" name="star-input03" id="c7" value="3.5"><label for="c7">3.5</label>
					    <input type="radio" name="star-input03" id="c8" value="4"><label for="c8">4</label>
					    <input type="radio" name="star-input03" id="c9" value="4.5"><label for="c9">4.5</label>
					    <input type="radio" name="star-input03" id="c10" value="5"><label for="c10">5</label>
				    </span>
			    	<output for="star-input"><b>0</b>점</output>
		    	</span>
				</div>
     		</div>
     		
     		  
     		<div class="modal-footer">  
				    <div class="imgs_wrap">    
			          
				    </div>          
			    <div class="input_wrap">  
			        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
		    		<div class="upload_message"></div>
			        <input type="file" id="input_imgs" multiple/>
			    </div>   
       			<textarea rows="20" cols="120" style="resize: none;" placeholder="리뷰 작성 해주세요."></textarea>
     		</div>
   		</div>  
	</div> 
</div>


<div id="container"> 
	<div id="main">
		<span id="main2">리뷰 ★★★★★ &nbsp;<b style="font-size: 25px;">4.7</b>/5 &nbsp; &nbsp; &nbsp;후기2343개|답변2033개</span><button class="modal_Btn">리뷰 작성</button><br>
		<span>최근6개월 누적평점</span><br/><br/>
		<table>
			<col width="50px;"> 
			<tr> 
				<td><span>서비스</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
			<tr>
				<td><span>가격</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
			<tr>
				<td><span>청결도</span></td>
				<td>★★★★☆ 4.5<span>/5</span></td>
			</tr>
		</table>  
	</div>  
   <div class="bigtle" > 
		<div class="mybox">          
			<img src="./img/profile_default.png" class="pf"/>  
			<div class="info">        
				<button class="content_detail">자세히 보기</button><br> 
				<span>닉네임:ㄴㅌㅇㅀ</span><span style="margin-left: 595px;">작성일: ㅁㄴㅇ</span><br>
				<div class="star_table">
					<table>
						<tr> 
							<td>서비스</td>
							<td>
									<img class="starz" src="img/star_fill.png">
									<img class="starz" src="img/star_half.png">
									<img class="starz" src="img/star_empty.png">
							</td> 
						</tr>
						<tr>
							<td>가격</td>
							<td>
										<img class="starz" src="img/star_fill.png">
										<img class="starz" src="img/star_half.png">
										<img class="starz" src="img/star_empty.png">
							</td> 
						</tr>
						<tr>
							<td>청결도</td>
							<td>
										<img class="starz" src="img/star_fill.png">
										<img class="starz" src="img/star_half.png">
										<img class="starz" src="img/star_empty.png">
							</td> 
						</tr>
					</table>
				</div>
				<div class="user_review_img" ></div>     
				<div class="contents">
					<span style="font-weight: bold;">리뷰내용</span><br>
					<span>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>
				</div> 
			</div>   
			<div class="info2">     
				<span style="font-weight: bold;">매장답변</span><br>
				<span>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</span>						
			</div>
		</div>  
	</div>      
	<br><br>
    <div class="block">
        
    </div>
    <!-- 반복 -->
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 