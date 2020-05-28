<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">   
	$(document).ready(function(){
	    $("#modal_Btn").click(function(){
	        $("div.modal").modal(); 
	    });
	});
	
	
	
	
	
	
	$(document).ready(function(){
		   var fileTarget = $('.filebox .upload-hidden'); // -> 사진이 들어갈 경로  input태그(아이디input_file) -> 라벨로 연결함  /// 그밑에 input태그(클래스 upload-name)으로 같이나옴

		    fileTarget.on('change', function(){
		        if(window.FileReader){
		            // 파일명 추출
		            var filename = $(this)[0].files[0].name;
		        } 
 
		        else {
		            // Old IE 파일명 추출
		            var filename = $(this).val().split('/').pop().split('\\').pop();
		        };

		        $(this).siblings('.upload-name').val(filename);
		    });

		    //preview image 
		    var imgTargets = new Array(5);
		    for (var i = 0; i < imgTargets.length; i++) {
			    var imgTargets[i] = $('.preview-image .upload-hidden');
			}
			
		    imgTargets.on('change', function(){
		        var parent = $(this).parent();
		        parent.children('.upload-display').remove();

		        if(window.FileReader){
		            //image 파일만
		            if (!$(this)[0].files[0].type.match(/image\//)) return;
		            
		            var reader = new FileReader();
		            reader.onload = function(e){
		                var src = e.target.result;
		                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');							
		            }
		            reader.readAsDataURL($(this)[0].files[0]);
		        }

		        else {
		            $(this)[0].select(); 
		            $(this)[0].blur();
		            var imgSrc = document.selection.createRange().text;
		            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

		            var img = $(this).siblings('.upload-display').find('img');
		            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
		        }
		    }); 
		});
	
	
	
	
	
	 
	
</script>  
<style type="text/css"> 
	.modal-title{margin-left: 400px;}
	.modal-body span{margin: 85px;}
	textarea:focus::-webkit-input-placeholder { color: transparent; }
	.modal-footer  div{border: 1px solid black;width: 153px; height: 110px; float: left;}
	
	
	
	
	
	
	
	.where {
	  display: block;
	  margin: 25px 15px;
	  font-size: 11px;
	  color: #000;  
	  text-decoration: none;
	  font-family: verdana;
	  font-style: italic;
	} 
	
	.filebox input[type="file"] {
	    position: absolute;
	    width: 1px;
	    height: 1px;
	    padding: 0;
	    margin: -1px;
	    overflow: hidden;
	    clip:rect(0,0,0,0);
	    border: 0;
	}
	
	.filebox label {
	    display: inline-block;
	    padding: .5em .75em;
	    color: #999;
	    font-size: inherit;
	    line-height: normal;
	    vertical-align: middle;
	    background-color: #fdfdfd;
	    cursor: pointer;
	    border: 1px solid #ebebeb;
	    border-bottom-color: #e2e2e2;
	    border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
	    display: inline-block;
/* 	    padding: .5em .75em; */
	    font-size: inherit; 
	    font-family: inherit;
	    line-height: normal;
	    vertical-align: middle; 
	    background-color: #f5f5f5;  
	  border: 1px solid #ebebeb;
	  border-bottom-color: #e2e2e2;
/* 	  border-radius: .25em; */
	  -webkit-appearance: none; /* 네이티브 외형 감추기 */
	  -moz-appearance: none;
	  appearance: none;
	  width: 98px;
	}
	
	/* imaged preview */
	.filebox .upload-display {
	}
	
	@media(min-width: 768px) {
	    .filebox .upload-display {
	        display: inline-block;
	    }
	}
	
	.filebox .upload-thumb-wrap {
	    display: inline-block;
	    width: 150px;
	    height:110px; 
	    vertical-align: middle;
	    border: 1px solid #ddd;
/* 	    border-radius: 5px; */
	    background-color: #fff; 
	    float: left;
	}
	
	.filebox .upload-display img {
	    display: block;
	    max-width: 100%;
	    width: 100% \9;
	    height: 100px;    
	}
	
	.filebox.bs3-primary label {
	  color: #fff;
	  background-color: #337ab7;
	    border-color: #2e6da4;
	}
		
	
	
	
	
	
	  
</style> 
</head>
<body>      
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">

	<div class="modal-dialog modal-lg">
  		<!-- Modal content-->
   		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">리뷰 작성 완료</button>
       			<h4 class="modal-title">가게이름</h4>
     		</div>
     		<div class="modal-body">
     			
       			<span>서비스 ☆☆☆☆☆</span>|<span>가격 ☆☆☆☆☆</span>|<span>청결도 ☆☆☆☆☆</span>
     		</div> 
     		<div class="modal-footer">   
     			<div class="filebox bs3-primary preview-image" style="margin-bottom: 30px;"> 
     				<input type="file" id="input_file" class="upload-hidden"> 
     				<input class="upload-name"  disabled="disabled" style="background-color: white;border: 0;" >
     			</div>
     			
     			
<!--      			<div class="filebox bs3-primary preview-image"> -->
<!--      				<input type="file" id="input_file" class="upload-hidden">  -->
<!--      				<input class="upload-name"  disabled="disabled" style="background-color: white;border: 0;" > -->
<!--      			</div> -->
<!--      			<div class="filebox bs3-primary preview-image"> -->
<!--      				<input type="file" id="input_file" class="upload-hidden">  -->
<!--      				<input class="upload-name"  disabled="disabled" style="background-color: white;border: 0;" > -->
<!--      			</div> -->
<!--      			<div class="filebox bs3-primary preview-image"> -->
<!--      				<input type="file" id="input_file" class="upload-hidden">  -->
<!--      				<input class="upload-name"  disabled="disabled" style="background-color: white;border: 0;" > -->
<!--      			</div> -->
<!--      			<div class="filebox bs3-primary preview-image"> -->
<!--      				<input type="file" id="input_file" class="upload-hidden">  -->
<!--      				<input class="upload-name"  disabled="disabled" style="background-color: white;border: 0;" > -->
<!--      			</div> -->
       			<textarea rows="20" cols="120" style="resize: none;" placeholder="리뷰 작성 해주세요."></textarea>
       			<div class="filebox bs3-primary preview-image" style="width: 600px;height: 30px;border: 0;">
				    <input class="upload-name" value="파일선택" disabled="disabled" >
				    <label for="input_file" style="float: left;">업로드</label>  
				  	<input type="file" id="input_file" class="upload-hidden"> 
				</div>
     		</div>
   		</div>  
	</div> 
</div>
<div>
	<button id="modal_Btn">모달 실행하기</button>
</div>


<div class="filebox bs3-primary preview-image">
    <input class="upload-name" value="파일선택" disabled="disabled" style="width: 200px;">
    <label for="input_file">업로드</label> 
  	<input type="file" id="input_file" class="upload-hidden"> 
</div>
</body>
</html>