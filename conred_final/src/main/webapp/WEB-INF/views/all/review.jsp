<%@page import="com.hk.conred.dtos.SDto"%>
<%@page import="com.hk.conred.dtos.ReplyDto"%>
<%@page import="java.util.List"%>
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
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
/* 	#sticky{position: sticky; top:71px;} */
	#navi2{width:998px;background-color: lightblue;clear:both;position:relative;top:-20px;text-align: center;line-height: 40px;border-top: 1px solid grey;}
	.home{border-bottom:1px solid white;background-color: white;text-decoration: underline;border-right:1px solid grey;border-left:1px solid grey;}
	
	#pagename{z-index:-1;font-size: 20px;position: relative;left:100px;margin-top:20px;margin-bottom:30px;display: inline-block;}
	.mybox{padding:20px;border-top:1px solid grey; width:700px;height:370px; font-size: 15px; margin-left: 150px;min-height: 370px;}
	.myboxmargin{margin-top:30px;}
	#main{width: 930px;height: 250px;margin-left:70px; padding-top: 25px;} 
	#main2{font-size: 20px;}  
	#main2{}  
	.pf{float: left; width: 40px;height: 40px;}     
	.dt{margin-left: 600px;}
	.info{min-height: 250px;}      
	.contents{display:inline-block;padding: 10px; width: 669px;height:80px;text-overflow: ellipsis; overflow: hidden;word-break:keep-all;min-height: 80px; clear: both; margin-bottom: 15px;}        
	.info2{background-color: #fafafa;  height: 80px;padding: 10px;text-overflow: ellipsis; overflow: hidden;display:inline-block; width: 600px; min-height: 80px;border-radius:5px;word-break:keep-all;margin-left: 33px;}
	.bot{margin: 0 auto; text-align: center;}
	 
	 .modal-title{margin-left: 400px;}
	.modal-body span{margin: 5px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer{width: 897px; height: 630px;border-width: 0px;}
	.inputs{width:600px;float: left;height:auto;}
	
	 

     .my_button {
         display: inline-block; width: 200px;  text-align: center; padding: 10px; background-color: #006BCC;color: #fff;
         text-decoration: none; border-radius: 5px; float: left;}
	.modal_Btn{border: 0; margin-left: 690px; height: 50px;border-radius: 5px; background-color: #94B8FD;}
	.modal_Btn:hover{background-color: #4a83ed;} 
 	.overfive{float: left;} 
 	.star_bigtle{margin-left: 65px; float: left;}
/*  	.upload_message{height: 40px; width: 400px;margin-left: 215px; text-align: center; line-height: 37px;} */
  	 .content_detail{background-color: #fafafa;margin-left: 528px;border-width: 0;}
	 .content_detail:hover {background-color: grey;} 
     .star_table{width: 200px; height: 80px;background-color: #fafafa;border-radius: 5px; padding: 10px;float: left;}
      .starz{width:17px;height:auto;display: inline-block;margin:-2px;margin-bottom:4px;}
      .small_star{width: 25px;height: auto;margin: -2px;margin-bottom:4px;}
      .big_star{width: 50px;height: auto;}
      .buttondle{background-color: #585858; color: white;border-radius: 5px;}
      .user_avg{float: right; font-size: 20px;padding-top: 17px;}
      .star_score{float: left;}
      .tle_final{width: 700px;border-top: 1px solid grey;margin-left: 150px;margin-bottom: 200px;}
      .bigNumber{font-size: 25px;font-weight: bold;} 
      
      
      #preview img {width: 180px;height: 100px;overflow: hidden;}
	#preview p {text-overflow: ellipsis;overflow: hidden;}
	.preview-box {border: 0px solid grey;padding: 5px;border-radius: 2px;margin-bottom: 5px;margin-right:5px;
				display: inline-block;
    			border-radius: 5px;
    			border-right-width: 1px;
    			border-bottom-width: 1px;}
	.thumbnail{margin-bottom:0px;}
       input[type=file] {display: none;}
</style>   
<script type="text/javascript">


	//////////////스크롤 페이징
	var count = 1;
	$(function(){
		var store_seq=$("input[name=store_seq]").val();
		//스크롤 바닥 감지 
		window.onscroll = function(e) {
		    //추가되는 임시 콘텐츠
		    //window height + window scrollY 값이 document height보다 클 경우,
		    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		    	//실행할 로직 (콘텐츠 추가) 
		        count++;
		        var addContent ="";
				$.ajax({
					url:"review_ajax.do", 
					method:"post", 
					data:{"pnum":count,"store_seq":store_seq},
					dataType:"json", 
					success:function(obj){  
						var lists=obj.list;  
						$.each(lists,function(i){
							addContent+= ' <div class="bigtle" > '
										+	'	<div class="mybox">     '     
										+	'	<img src="./img/profile_default.png" class="pf"/>  '
										+	'	<div class="info">        '
										+	'		<button class="content_detail buttondle">자세히 보기</button><br> '
										+	'		<span style="color:#919191;">닉네임: '+ lists[i].user_id +' </span><span style="float:right;color:#919191;">'+ lists[i].reply_regdate +' </span><br>'
										+	'		<div class="star_table">'
										+	'			<table class="star_score">'
										+	'				<tr> '
										+	'					<td>서비스</td>'
										+	'					<td>'
							 			+	'		            <td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_service) +'</td>         		'
										+	'					</td> '
										+	'				</tr>'
										+	'				<tr>'
										+	'					<td>가격</td>'
										+	'					<td>'
										+	'					<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price) +'</td>         		'
										+	'					</td> '
										+	'				</tr>'
										+	'				<tr>'
										+	'					<td>청결도</td>'
										+	'					<td>'
							+'									<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean) +'</td>         		'
							+'									</td> '
							+'								</tr>'
						+	'							</table>'
						+							'<div class="user_avg">'+ Math.round(((lists[i].reply_clean+lists[i].reply_price+lists[i].reply_service)/3)*10)/10 +'</div>'
						+	'						</div>'
						+	'						<div class="user_review_img" ></div>     '
						+	'						<div class="contents">'
						+	'							<span style="font-weight: bold;">리뷰내용</span><br>'
						+	'							<span>'+ lists[i].reply_content +'</span>'
						+	'						</div> '
						+	'					</div>   '
						+	'					<div class="info2">     '
						+	'						<span style="font-weight: bold;">매장답변</span><br> '
						+'								<span>'+ (lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer) +'</span>			'							
						+'						</div> '
						+'					</div>   '
						+'				</div>      '
						+'				<br><br>';
							
							
						});
		        		$('.bigbig').append(addContent);		
					}
				});
		   
	
				}   
		    }
	
	//////////////////////////자세히보기
	
		$("body").on("click",".content_detail",function(){
			if($(this).parent().parent().css("height")=="370px"){   
				$(this).parent().parent().css("height","auto");  
				$(this).parent().parent().find(".contents").css({"overflow":"visible","height":"auto","word-break":"break-all"});
				$(this).parent().parent().find(".info2").css({"overflow":"visible","height":"auto","word-break":"break-all"});
			}else{
				$(this).parent().parent().css("height","370px");    
				$(this).parent().parent().find(".contents").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
				$(this).parent().parent().find(".info2").css({"height":"80px","overflow":"hidden","word-break":"keep-all"});
			}   
		});      
   
	});//$(function(){}) onload 끝  
	
	
	//////////////모달창
	$(document).ready(function(){
		
		//숨겨져있을때  -> 모달영역밖에누를때포함
		$(".modal").on("hidden.bs.modal", function(){
			  $("textarea").val("");
			  $("input[type=radio]").prop("checked",false); 
			  $("b").text("0"); 
			 
		}); 
		
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
// 		    alert($(".star-input01").find(":checked").val());
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
		    	$(this).parents(".star-input02").find("b").text($(this).val());
		  })
		    .on("mouseover", ".star-input02 label", function(){
		    	$(this).parents(".star-input02").find("b").text($(this).text());
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
	        
	        
		  //닫기버튼
// 		  $(".btn-default").click(function(){ 
// 			  $("input[type=radio]").prop("checked",false); 
// 			  $("b").text("0");
// 			  $("textarea").val(""); 
// 			  alert($("textarea").val().length);  
			 
// 		  });  
		   
		   

	      ////완료버튼   
		  $(".close").click(function(){
// 			  $(".bigtle").empty();
			  var store_seq=$("input[name=store_seq]").val();
			  var reply_content=$("textarea").val();
			  var reply_service=$(".star-input01").find(":checked").val();
			  var reply_price=$(".star-input02").find(":checked").val();
		      var reply_clean=$(".star-input03").find(":checked").val();
		      var addReview ="";
		      
		      if($("textarea").val().length<=100){
				  alert("100자 이상 작성해주세요"); 
				  $("textarea").focus();
		    	  return false;
			  }
		      if(reply_service==0||reply_service==null||reply_price==0||reply_price==null||reply_clean==0||reply_clean==null){
		    	  alert("평점을 입력해주세요");
		    	  return false;
		      }  
		      
			  $.ajax({
				  url:"store_review_ajax.do",
				  method:"post",
				  data:{"store_seq":store_seq,"reply_content":reply_content,"reply_service":reply_service,"reply_price":reply_price,"reply_clean":reply_clean},
				  dataType:"json",
				  success:function(obj){
					   var lists=obj.list;			 	  
					   $(".bigtle").empty();
					   $.each(lists,function(i){
							addReview+= 	'	<div class="mybox">     '     
										+	'	<img src="./img/profile_default.png" class="pf"/>  '
										+	'	<div class="info">        '
										+	'		<button class="content_detail buttondle">자세히 보기</button><br> '
										+	'		<span style="color:#919191;">닉네임: '+ lists[i].user_id +' </span><span style="float:right;color:#919191;">'+ lists[i].reply_regdate +' </span><br>'
										+	'		<div class="star_table">'
										+	'			<table class="star_score">'
										+	'				<tr> '
										+	'					<td>서비스</td>'
	 									+	'					<td>'
							 			+	'		            <td>'+ star_fill(lists[i].reply_service)+star_half(lists[i].reply_service)+star_empty(lists[i].reply_serivce) +'</td>         		'
										+	'					</td> '
										+	'				</tr>'
										+	'				<tr>'
										+	'					<td>가격</td>'
										+	'					<td>'
										+	'					<td>'+ star_fill(lists[i].reply_price)+star_half(lists[i].reply_price)+star_empty(lists[i].reply_price) +'</td>         		'
										+	'					</td> '
										+	'				</tr>'
										+	'				<tr>'
										+	'					<td>청결도</td>'
										+	'					<td>'
							+'									<td>'+ star_fill(lists[i].reply_clean)+star_half(lists[i].reply_clean)+star_empty(lists[i].reply_clean) +'</td>         		'
							+'									</td> '
							+'								</tr>'
						+	'							</table>'
						+							'<div class="user_avg">'+ Math.round(((lists[i].reply_clean+lists[i].reply_price+lists[i].reply_service)/3)*10)/10 +'</div>'
						+	'						</div>'
						+	'						<div class="user_review_img" ></div>     '
						+	'						<div class="contents">'
						+	'							<span style="font-weight: bold;">리뷰내용</span><br>'
						+	'							<span>'+ lists[i].reply_content +'</span>'
						+	'						</div> '
						+	'					</div>   '
						+	'					<div class="info2">     '
						+	'						<span style="font-weight: bold;">매장답변</span><br> '
						+'								<span>'+ (lists[i].reply_answer==null?"아직 답변이 없습니다.":lists[i].reply_answer) +'</span>			'							
						+'						</div> '
						+'					</div>   ';	
						
						});
					   
					    $(".bigtle").append(addReview);
					  
				  }
				  
			  }); 

			   
	      });  
		   
		  
		  
	    });
	});
	
	
	
	
	
	
	///////////////파일업로드
	
	
 
	
	
	
	
	//////////////평점 한개,반개,빈거
	function star_fill(val){
		 var v="";
		for(var i=0;i<Math.floor(val);i++){	 
			v+='<img class="starz" src="img/star_fill.png">';	
		}
		return v;
	 }

	function star_half(val){
		var v="";
		if(0<Math.ceil(val)-Math.floor(val)){	
			v+='<img class="starz" src="img/star_half.png">';
		}
		return v;
	}
	function star_empty(val){
		var v="";
		for(var i=0;i<(5-Math.ceil(val));i++){
			v+='<img class="starz" src="img/star_empty.png">';
		} 
		return v;
	}
	
	


	 
	
</script>  
</head>
<% 
	List<ReplyDto> list=(List<ReplyDto>)request.getAttribute("list");
	ReplyDto list_avg=(ReplyDto)request.getAttribute("list_avg");
%>
<body>
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>"/>
<form action="user_review_img.do" method="post" enctype="multipart/form-data">
	<!-- 모탈창 부분 -->
	<div class="modal fade" id="myModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	  		<!-- Modal content-->
	   		<div class="modal-content">
	     		<div class="modal-header"> 
	     			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
					<div class="inputbox">
					<div class="inputs">
					<!-- 파일업로드 관련 -->
					    <div class="wrapper">
					        <div class="body">
					            <!-- 첨부 버튼 -->
					            <div id="attach">
					                <label class="btn f_insert" for="uploadInputBox">사진 첨부하기</label>
					                <input id="uploadInputBox" style="display: none" type="file" name="photos" multiple="multiple" />
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

						</div>
					</div>
	       			<textarea rows="20" cols="120" style="resize: none;" placeholder="리뷰 작성 해주세요."></textarea>
	     		</div>
	   		</div>  
		</div> 
	</div>
</form>


<div id="container"> 
	<div id="main">
		<span id="main2">리뷰&nbsp;<%for(int i=0;i<Math.floor(list_avg.getAll_avg());i++){
				%>
					<img src="img/star_fill.png" class="big_star">
				<%
			}
			if(0<Math.ceil(list_avg.getAll_avg())-Math.floor(list_avg.getAll_avg())){
				%>
				<img src="img/star_half.png" class="big_star">
				<%
			}
			for(int i=0;i<(5-Math.ceil(list_avg.getAll_avg()));i++){
				%>
					<img src="img/star_empty.png" class="big_star">
				<%
			}
		%>
		<span class="bigNumber" ><%=list_avg.getAll_avg()%></span>/5 &nbsp; &nbsp; &nbsp;후기<%=list_avg.getReply_count()%>개|답변<%=list_avg.getAnswer_count()%>개</span><br>
		<span>최근6개월 누적평점</span><button class="modal_Btn">리뷰 작성</button><br/><br/>
		<table>
			<col width="50px;">  
			<tr> 
				<td><span>서비스</span></td>
				<td>
				<%for(int i=0;i<Math.floor(list_avg.getService_avg());i++){
					%>
					<img src="img/star_fill.png" class="small_star">
					<%
				}
				if(0<Math.ceil(list_avg.getService_avg())-Math.floor(list_avg.getService_avg())){
					%>
					<img src="img/star_half.png" class="small_star">
					<%
				}
				for(int i=0;i<5-Math.ceil(list_avg.getService_avg());i++){
					%>
					<img src="img/star_empty.png" class="small_star">
					<%
				}
				%>
				</td>
				<td><span><%=list_avg.getService_avg()%>/5</span></td>
			</tr>
			<tr>
				<td><span>가격</span></td>
				<td>
				<%for(int i=0;i<Math.floor(list_avg.getPrice_avg());i++){
					%>
					<img src="img/star_fill.png" class="small_star">
					<%
				}
				if(0<Math.ceil(list_avg.getPrice_avg())-Math.floor(list_avg.getPrice_avg())){
					%>
					<img src="img/star_half.png" class="small_star">
					<%
				}
				for(int i=0;i<5-Math.ceil(list_avg.getPrice_avg());i++){
					%>
					<img src="img/star_empty.png" class="small_star">
					<%
				}
				%>
				</td>
				<td><span><%=list_avg.getPrice_avg()%>/5</span></td>
			</tr>
			<tr>
				<td><span>청결도</span></td>
				<td>
				<%for(int i=0;i<Math.floor(list_avg.getClean_avg());i++){
					%>
					<img src="img/star_fill.png" class="small_star">
					<%
				}
				if(0<Math.ceil(list_avg.getClean_avg())-Math.floor(list_avg.getClean_avg())){
					%>
					<img src="img/star_half.png" class="small_star">
					<%
				}
				for(int i=0;i<5-Math.ceil(list_avg.getClean_avg());i++){
					%>
					<img src="img/star_empty.png" class="small_star">
					<%
				}
				%>
				</td>
				<td><span><%=list_avg.getClean_avg()%>/5</span></td>
			</tr>
		</table>  
	</div>  
	<%
	for(ReplyDto dto:list){ 
	%>
   <div class="bigtle" > 
		<div class="mybox">          
			<img src="./img/profile_default.png" class="pf"/>  
			<div class="info">        
				<button class="content_detail buttondle">자세히 보기</button><br> 
				<span style="color:#919191;">닉네임:<%=dto.getUser_id()%> </span><span style="float:right; color:#919191;"><%=dto.getReply_regdate()%></span><br>
				<div class="star_table">
					<table class="star_score">
						<tr> 
							<td>서비스</td>
							<td>
							<%
								for(int i=0;i<Math.floor(dto.getReply_service());i++){
									%>
									<img class="starz" src="img/star_fill.png">				
									<%					
								}
								if(0<Math.ceil(dto.getReply_service())-Math.floor(dto.getReply_service())){
									%>
									<img class="starz" src="img/star_half.png">		
									<%
								}
								for(int i=0;i<5-Math.ceil(dto.getReply_service());i++){
									%>
									<img class="starz" src="img/star_empty.png">			
									<%					
								}
							%>
							</td> 
						</tr>
						<tr>
							<td>가격</td>
							<td>
							<%
								for(int i=0;i<Math.floor(dto.getReply_price());i++){
									%>
									<img class="starz" src="img/star_fill.png">				
									<%					
								}
								if(0<Math.ceil(dto.getReply_price())-Math.floor(dto.getReply_price())){
									%>
									<img class="starz" src="img/star_half.png">		
									<%
								}
								for(int i=0;i<5-Math.ceil(dto.getReply_price());i++){
									%>
									<img class="starz" src="img/star_empty.png">			
									<%					
								}
							%>
							</td> 
						</tr>
						<tr>
							<td>청결도</td>
							<td>
							<%
								for(int i=0;i<Math.floor(dto.getReply_clean());i++){
									%>
									<img class="starz" src="img/star_fill.png">				
									<%					
								}
								if(0<Math.ceil(dto.getReply_clean())-Math.floor(dto.getReply_clean())){
									%>
									<img class="starz" src="img/star_half.png">		
									<%
								}
								for(int i=0;i<5-Math.ceil(dto.getReply_clean());i++){
									%>
									<img class="starz" src="img/star_empty.png">			
									<%					
								}
							%>
							</td> 
						</tr>  
					</table>   
					<div class="user_avg"><%=Math.round(((dto.getReply_clean()+dto.getReply_price()+dto.getReply_service())/3)*10d)/10d%></div>
				</div>  
				<div class="contents">
					<span style="font-weight: bold;">리뷰내용</span><br>
					<span><%=dto.getReply_content()%></span>
				</div> 
			</div>   
			<div class="info2">     
				<span style="font-weight: bold;">매장답변</span><br> 
				<%if(dto.getReply_answer()==null||dto.getReply_answer().equals("")){
				%>
					<span>아직 답변이 없습니다.</span>										
				<%
				}else{
				%>
					<span><%=dto.getReply_answer()%></span>										
				<%
				}
				%>
			</div> 
		</div>   
	</div>      
	<br><br>
	<%
	}
	%>
    <div class="bigbig">
        
    </div>
    <div class="tle_final"></div>    
</div> 
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 