<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>
<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script> -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">
	.flatpickr-calendar{margin: 0 auto; width: 500px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	
	.times{width: 80px;height:34px; border: 1px solid green;float: left; margin: 10px; text-align: center;line-height: 34px; background-color: #9FF781;}
	.times_result{width: 250px;margin: 0 auto;border: 1px solid red; clear: both; height: 50px;}
	
</style>   
<script>   
	  	  
	function aaa(){   
		var datestr=$(".selector").val();  
// 		alert(datestr);
		
	}
	
</script>
 
</head> 
<body>
<div style="width:700px;margin:0 auto">
	<div class="sungsoobox">
		<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa()"/>
		<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
	</div>
	<br><br>
	<div style="border: 1px solid black; width: 500px; height: 350px; margin: 0 auto; border-radius: 10px;">
		<div style="margin: 0 auto; width: 400px; height: 300px;">
			<div class="times">10:00</div>
			<div class="times">11:00</div>
			<div class="times">12:00</div>  
			<div class="times">13:00</div>
			<div class="times">14:00</div>
			<div class="times">15:00</div> 
			<div class="times">16:00</div> 
			<div class="times">17:00</div>
			<div class="times">18:00</div>
			<div class="times">19:00</div>
			<div class="times">20:00</div> 
			<div class="times_result"></div> 
		</div>
	</div>
</div>
	

<script type="text/javascript">

$(".selector").flatpickr({  
	inline: true,
 	mode: "single",
    minDate: "today",
    dateFormat: "Y-m-d"
  

});	
</script>
</body>
</html>