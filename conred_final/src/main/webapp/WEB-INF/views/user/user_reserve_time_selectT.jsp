<%@page import="com.hk.conred.dtos.STimeDto"%>
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
	.times_result{width: 250px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0; clear: both; height: 30px;line-height: 30px;margin-bottom: 40px;margin-top: 40px;}
	.selector{display: none;}
	.times:hover{background-color: #00FF00;cursor: pointer;}
	.reserve_time_select{border: 1px solid #A4A4A4; width: 500px; height: auto; margin: 0 auto; border-radius: 10px;margin-bottom: 400px;}
	.time_box{margin: 0 auto; width: 400px; height: auto;}
	
	
</style>  
<script>   
	function isWeek(d){
		var kk="";
		switch (d) {
		case 1:
			kk="일요일";
			break;
		case 2:
			kk="월요일";
			break;
		case 3:
			kk="화요일";
			break;
		case 4:
			kk="수요일";
			break;
		case 5:
			kk="목요일";
			break;
		case 6:
			kk="금요일";
			break;
		case 0:
			kk="토요일";
			break;
		
		}
		return kk;
	}
	
	//해당날짜 선택시
	var datestr; 
	function aaa(ele){   	
		
		var a="09:00am";
		var c="11:00am";
		var b=a.split(":");
		var d=c.split(":");
// 		alert(parseInt(d[0]-b[0]));
		var num=new Date(ele.value);
		
		datestr=$(".selector").val(); 
		var day_result=$(".times_result").children();
		day_result.eq(1).empty();
		day_result.eq(0).text(datestr+" , ");
		
		//공백
		var emptyDay=$(".prevMonthDay").length;
		//클릭->요일
		// 	alert((emptyDay+num.getDate())%7);
		var	store_time_day=isWeek((emptyDay+num.getDate())%7);
		var store_seq=$("input[name=store_seq]").val();
		var menu_seq=$("input[name=menu_seq]").val();
		var addContent;
		var open;
		var close; 
		
		$.ajax({ 
			url:"user_selectWeek_ajax.do",
			method:"post",
			data:{"menu_seq":menu_seq,"store_seq":store_seq,"store_time_day":store_time_day},
			dataType:"json",
			success:function(obj){
				var lists=obj.listWeek;
				$.each(lists,function(i){
					open=lists[i].store_time_open.split(":");
					close=lists[i].store_time_close.split(":");
	// 				alert(parseInt(open[0])+4); 
	// 				alert(open[0]);
					var ing=parseInt(close[0]-open[0]);
	// 				alert(ing);
					 
					for (var j = 0; j < ing; j++) {
						addContent+= '<input class="times" onclick="bbb()" value="'+ (parseInt(open[0])+j)+':00' +'" readonly="readonly">';
					}
					
					$(".time_box").empty();
					$(".time_box").append(addContent);
					$(".time_box").css("height", "auto");			
				})
					   
			}
		});
		

		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			
			//요일별 휴무여부
			var getMon=$("input[name=mon]").val();
			var getTue=$("input[name=tue]").val();
			var getWed=$("input[name=wed]").val();
			var getThu=$("input[name=thu]").val();
			var getFri=$("input[name=fri]").val();
			var getSat=$("input[name=sat]").val();
			var getSun=$("input[name=sun]").val();
			//요일별 번호
			var monNum=parseInt($("input[name=monNum]").val())+1;
			var tueNum=parseInt($("input[name=tueNum]").val())+1;
			var wedNum=parseInt($("input[name=wedNum]").val())+1;
			var thuNum=parseInt($("input[name=thuNum]").val())+1;
			var friNum=parseInt($("input[name=friNum]").val())+1;
			var satNum=parseInt($("input[name=satNum]").val())+1;
			var sunNum=parseInt($("input[name=sunNum]").val())-6;
			
			if(getMon=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==monNum){//월
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getTue=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getWed=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getThu=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getFri=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==friNum){//금
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getSat=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==satNum){//토
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getSun=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
		});
		
	}
	
	 

	
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
		
		//공백
		var emptyDay;
		//요일별 휴무여부
		var getMon=$("input[name=mon]").val();
		var getTue=$("input[name=tue]").val();
		var getWed=$("input[name=wed]").val(); 
		var getThu=$("input[name=thu]").val();
		var getFri=$("input[name=fri]").val();
		var getSat=$("input[name=sat]").val();
		var getSun=$("input[name=sun]").val();
		//요일별 번호
		var monNum=parseInt($("input[name=monNum]").val())+1;
		var tueNum=parseInt($("input[name=tueNum]").val())+1;
		var wedNum=parseInt($("input[name=wedNum]").val())+1;
		var thuNum=parseInt($("input[name=thuNum]").val())+1;
		var friNum=parseInt($("input[name=friNum]").val())+1;
		var satNum=parseInt($("input[name=satNum]").val())+1;
		var sunNum=parseInt($("input[name=sunNum]").val())-6;
		
		
		//store,menu seq
		var store_seq=$("input[name=store_seq]").val();
		var menu_seq=$("input[name=menu_seq]").val();
		
		//////////////////////////////////AJAX
		$(".flatpickr-months").click(function(){
			$.ajax({
				url:"user_reserve_time_ajax.do",
				method:"post",
				data:{"store_seq":store_seq,"menu_seq":menu_seq},
				dataType:"json",
				success:function(obj){
					$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
						emptyDay=$(".prevMonthDay").length;
						if(getMon=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==monNum){//월
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getTue=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getWed=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getThu=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getFri=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==friNum){//금
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getSat=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==satNum){//토
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						if(getSun=="Y"){
							if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
								$(this).css({"pointer-events":"none","color":"red"});
							}
						}
						
						

					});
				}
			});
		});
		
		//첫로딩 
		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			emptyDay=$(".prevMonthDay").length;
			if(getMon=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==monNum){//월
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getTue=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getWed=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getThu=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getFri=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==friNum){//금
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getSat=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==satNum){//토
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			if(getSun=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
					$(this).css({"pointer-events":"none","color":"red"});
				}
			}
			
			

		});
		

		
		
		
		
	})  
</script> 
</head>
<%
	List<MenuDto> list=(List<MenuDto>)request.getAttribute("list");
%>
<body>
<input type="hidden" name="mon" value="<%=list.get(0).getStore_time_break()%>"/><input type="hidden" name="monNum" value="<%=list.get(0).getRownum()%>"/>
<input type="hidden" name="tue" value="<%=list.get(1).getStore_time_break()%>"/><input type="hidden" name="tueNum" value="<%=list.get(1).getRownum()%>"/>
<input type="hidden" name="wed" value="<%=list.get(2).getStore_time_break()%>"/><input type="hidden" name="wedNum" value="<%=list.get(2).getRownum()%>"/>
<input type="hidden" name="thu" value="<%=list.get(3).getStore_time_break()%>"/><input type="hidden" name="thuNum" value="<%=list.get(3).getRownum()%>"/>
<input type="hidden" name="fri" value="<%=list.get(4).getStore_time_break()%>"/><input type="hidden" name="friNum" value="<%=list.get(4).getRownum()%>"/>
<input type="hidden" name="sat" value="<%=list.get(5).getStore_time_break()%>"/><input type="hidden" name="satNum" value="<%=list.get(5).getRownum()%>"/>
<input type="hidden" name="sun" value="<%=list.get(6).getStore_time_break()%>"/><input type="hidden" name="sunNum" value="<%=list.get(6).getRownum()%>"/>
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>"/>
<input type="hidden" name="menu_seq" value="<%=list.get(0).getMenu_seq()%>"/>
<input type="hidden" name="menu_seq" value="<%=list.get(0).getMenu_seq()%>"/>
<div id="container">
	<div style="width:700px;margin:0 auto">
		<div class="sungsoobox">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa(this)"/>
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
			<span style="opacity: 0.5;margin-left: 255px;color: red;">*빨간날은 매장 휴무일 입니다.</span>
		</div>
		<br><br>
		<div class="reserve_time_select" >
			<div class="time_box">	
				
			</div>
				<div class="times_result">예약 시간 : <span></span>&nbsp;<span></span></div> 
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