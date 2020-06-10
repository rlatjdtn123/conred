<%@page import="com.hk.conred.dtos.MenuDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<jsp:include page="../all/header.jsp" />
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

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<style type="text/css">
	#container{box-sizing:border-box; border:1px solid grey; border-top-width:0px; border-bottom-width:0.1px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.flatpickr-calendar{margin: 0 auto; width: 500px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	
	.times{width: 80px;height:34px; border: 1px solid green;float: left; margin: 10px; text-align: center;line-height: 34px; background-color: #edfbdc; border: 0;}
	.times_result{width: 250px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0; clear: both; height: 30px;line-height: 30px;}
	.selector{display: none;}
	.times:hover{background-color: #00FF00;cursor: pointer;}
	.reserve_time_select{border: 1px solid #A4A4A4; width: 500px; height: 250px; margin: 0 auto; border-radius: 10px;margin-bottom: 400px;}
	
</style>  
<script>   

	var datestr; 
	function aaa(){   //(0-일)(1-월)(2-화)(3-수)(4-목)(5-금)(6-토)
		var day_of_week=$(".flatpickr-weekdaycontainer").children("span")//요일
		var sun=day_of_week.eq(0).text(); //일요일
		var mon=day_of_week.eq(1).text(); //일요일
		var tue=day_of_week.eq(2).text(); //일요일
		var wed=day_of_week.eq(3).text(); //일요일
		var thu=day_of_week.eq(4).text(); //일요일
		var fri=day_of_week.eq(5).text(); //일요일 
		var sat=day_of_week.eq(6).text(); //일요일
		datestr=$(".selector").val(); 
		var day_result=$(".times_result").children();
		//day_result.eq(0).empty(); 
		day_result.eq(1).empty();
		day_result.eq(0).text(datestr+" , ");
			 
	}
	
	 
// 	function bbb(ele){
// 		$(ele).css( "backgroud-color", "yellow");
		
// 	}
	
	$(function(){
		$(".times").click(function(){
			var timeval=$(this).val(); 
			if(datestr==null){
				timeval=null; 
				alert("날짜먼저 선택해주세요"); 
			}else{
				$(".times_result").children("span").eq(1).text(timeval);
				$(".times").css("background-color", "#edfbdc");
				$(this).css("background-color", "#00FF00");
			}
			
		})
	}) 
</script>
</head>
<%
	List<MenuDto> list=(List<MenuDto>)request.getAttribute("list");
%>
<body>
<div id="container">
	<div style="width:700px;margin:0 auto">
		<div class="sungsoobox">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa()"/>
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
		</div>
		<br><br>
		<div class="reserve_time_select" >
			<div style="margin: 0 auto; width: 400px; height: 250px;">
				<input class="times" onclick="bbb()" value="10:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="11:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="12:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="13:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="14:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="15:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="16:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="17:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="18:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="19:00" readonly="readonly">
				<input class="times" onclick="bbb()" value="20:00" readonly="readonly">
				<div class="times_result">예약 시간 : <span></span>&nbsp;<span></span></div> 
			</div>
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
<jsp:include page="../all/footer.jsp" /> 