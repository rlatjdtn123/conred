<%@page import="com.hk.conred.dtos.ReserveDto"%>
<%@page import="java.util.List"%>
<%@page import="com.hk.conred.dtos.MenuDto"%>
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
/* 	.selector{display: none;} */
	#container{box-sizing:border-box; border:1px solid grey; border-bottom-width:0.1px; width:1000px;margin: 0 auto;}/*실제로 이 안에 뭘 넣을땐 height값 빼주기*/
	.flatpickr-calendar{margin: 0 auto; width: 600px !important; height: 400px !important;}
	.flatpickr-rContainer{margin: 0 auto !important;}
	.day_result_box{width: 355px;margin: 0 auto;border:solid #D8D8D8;border-width:1px 0 1px 0;  height: 40px;line-height: 40px; margin-top: 60px;margin-bottom: 400px;}
	.selector{display: none;}
	.reserve_success{width: 100px;height: 25px; margin-left: 20px;font-size: 13px;line-height: 26px;border-width:0; display: none;border-radius: 10px;font-weight: bold;} 
	.reserve_success:hover {background-color: lightgrey;}
 	.gongback{display: none;} 
	.sungsoobox{margin-top: 100px;}
	
	
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
	
	 //공백
	 var emptyDay;
	 $(function(){ 
// 		 ((endDay.getTime()-startDay.getTime()/(1000*60*60*24)));       //  1초---> 1000ms
			var stay=$("input[name=stay]").val(); 
		 	for (var i = 0; i < stay; i++) { 
			 	var num=new Date($("input[name=sall1]").val());
			 	alert(num.getDay()); 
				var day_resultS=$("input[name=sall"+i+"]").val(); 
 				var day_resultE=$("input[name=eall"+i+"]").val(); 
 				alert(day_resultE-day_resultS);
			}
// 		  	var stay=document.getElementsByClassName('reserve_sdate')[1].value;
// 		 	alert(stay);
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

			//첫로딩 
			$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
				emptyDay=$(".prevMonthDay").length;
				if(getMon=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==monNum){//월
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getTue=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getWed=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getThu=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getFri=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==friNum){//금
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getSat=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==satNum){//토
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
				if(getSun=="Y"){
					if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
						$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
					}
				}
		
				
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
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getTue=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getWed=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getThu=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getFri=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==friNum){//금
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getSat=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==satNum){//토
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								if(getSun=="Y"){
									if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
										$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
									}
								}
								
								

							});
						}
					});
				});
				
		
	 	});
	 
	 })
	var datestr; 
	function aaa(ele){
// 		alert($(".flatpickr-day").text());
		datestr=$(".selector").val();
		
		var dates=datestr.split("to");
		var startDay=new Date(dates[0]);
		var endDay=new Date(dates[1]); 
		$("#reserve_sdate").val(dates[0]); 
		$("#reserve_edate").val(dates[1]);
	
		
		var resultDay=Math.ceil((endDay.getTime()-startDay.getTime())/(1000*60*60*24));
		$(".day_result_box").children("span").eq(0).text(dates[0]);
		$(".day_result_box").children("span").eq(1).text(dates[1]); 
		
		
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
		
		if(resultDay>4){
			alert("5일을 넘길수 없습니다."); 
			$(".selector").val("");
			$(".flatpickr-day").removeClass("selected startRange endRange inRange");
			$(".day_result_box").children("span").empty();
			$(".gongback").css("display", "none"); 
			$(".reserve_success").css("display", "none");
		}
		
		//~마지막 요일 찍을시
		if($(".endRange").length==1){
			
			var rs=dates[0].split("-");
	 		var re=dates[1].split("-"); 
			var date_price=(parseInt(re[2])-parseInt(rs[2]));//숙박기간
			var price_result=$("input[name=reserve_price]").val()*date_price;//숙박기간*1박가격
			$("#reserve_pirce").val(price_result);   
			
			$(".reserve_success").css("display", "inline") ;
			$(".gongback").css("display", "inline");	
			
			//
			var result=$(".reserve_success");
			var gong=$(".gongback");
			var box=$(".day_result_box");
			//
			
			$.each($(".inRange"),function(i){
// 				alert($(".inRange").eq(i).text()); 			
				if(getMon=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==monNum){//월
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text("");
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요"); 
					} 
				} 
				if(getTue=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==tueNum){//화
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text(""); 
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				if(getWed=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==wedNum){//수
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text("");
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				if(getThu=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==thuNum){//목
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text(""); 
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				if(getFri=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==friNum){//금
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text("");
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				if(getSat=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==satNum){//토
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text("");
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				if(getSun=="Y"){
					if((parseInt($(".inRange").eq(i).text())+emptyDay)%7==sunNum){//일
						result.css("display", "none"); 
						gong.css("display", "none");
						box.find("span").text("");
						$(".flatpickr-day").removeClass("selected startRange endRange inRange");
						alert("해당날짜는 매장 쉬는날입니다 다른날을 선택해주세요");
					}
				}
				
				
				
			})
			
			
			
			
			
			
			
		
			
			
			
		} 
		
		
		//일수선택시
		$(".dayContainer > span").not(".flatpickr-disabled").not(".prevMonthDay").not(".nextMonthDay").each(function(){
			
			
			if(getMon=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==monNum){//월
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			} 
			if(getTue=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==tueNum){//화
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getWed=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==wedNum){//수
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getThu=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==thuNum){//목
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getFri=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==friNum){//금
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSat=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==satNum){//토
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
			if(getSun=="Y"){
				if((parseInt($(this).text())+emptyDay)%7==sunNum){//일
					$(this).css({"pointer-events":"none","color":"#ccc","background-color":"#f8f8f8","border-radius":"1px"});
				}
			}
		});
		
	}
	
</script>
</head>
<%
	List<MenuDto> list=(List<MenuDto>)request.getAttribute("list");
	List<ReserveDto> stay_reserve_list=(List<ReserveDto>)request.getAttribute("stay_reserve_list");
%> 
<%!
	
%>
<body>
<input type="hidden" name="mon" value="<%=list.get(0).getStore_time_break()%>"/><input type="hidden" name="monNum" value="<%=list.get(0).getRownum()%>"/>
<input type="hidden" name="tue" value="<%=list.get(1).getStore_time_break()%>"/><input type="hidden" name="tueNum" value="<%=list.get(1).getRownum()%>"/>
<input type="hidden" name="wed" value="<%=list.get(2).getStore_time_break()%>"/><input type="hidden" name="wedNum" value="<%=list.get(2).getRownum()%>"/>
<input type="hidden" name="thu" value="<%=list.get(3).getStore_time_break()%>"/><input type="hidden" name="thuNum" value="<%=list.get(3).getRownum()%>"/>
<input type="hidden" name="fri" value="<%=list.get(4).getStore_time_break()%>"/><input type="hidden" name="friNum" value="<%=list.get(4).getRownum()%>"/>
<input type="hidden" name="sat" value="<%=list.get(5).getStore_time_break()%>"/><input type="hidden" name="satNum" value="<%=list.get(5).getRownum()%>"/>
<input type="hidden" name="sun" value="<%=list.get(6).getStore_time_break()%>"/><input type="hidden" name="sunNum" value="<%=list.get(6).getRownum()%>"/>
<input type="hidden" name="stay" value="<%=stay_reserve_list.size()%>">
<% 
	for(int i=0;i<stay_reserve_list.size();i++){
		%>
			<input type="hidden" name="sall<%=i%>" value="<%=stay_reserve_list.get(i).getReserve_sdate()%>"/>
		<%
	}
	for(int i=0;i<stay_reserve_list.size();i++){ 
		%>
			<input type="hidden" name="eall<%=i%>" value="<%=stay_reserve_list.get(i).getReserve_edate()%>"/>
		<%
	}
%>

<form action="reserve_successS.do" method="post">
<input type="hidden" name="store_seq" value="<%=list.get(0).getStore_seq()%>"/>
<input type="hidden" name="menu_seq" value="<%=list.get(0).getMenu_seq()%>"/>
<input type="hidden" name="reserve_price" id="reserve_pirce" value="<%=list.get(0).getMenu_price()%>"/>
<input type="hidden" name="reserve_sdate" id="reserve_sdate" value=""/>
<input type="hidden" name="reserve_edate" id="reserve_edate" value=""/>

	<div id="container">  
		<div class="sungsoobox">
			<input type="text" class="selector" placeholder="날짜를 선택하세요." onchange="aaa(this)"/>
			<a class="input-button" title="toggle" data-toggle><i class="icon-calendar"></i></a>
		</div>
		<div class="day_result_box">예약 날짜 : <span></span><p class="gongback"> ~ </p><span></span><input class="reserve_success" type="submit" value="예약하기"/> </div>
	</div>
</form>
<script type="text/javascript">

$(".selector").flatpickr({  
	inline: true,
 	mode: "range",
    minDate: "today",
    dateFormat: "Y-m-d"
  

});	


</script>
</body>
</html>
<jsp:include page="../all/footer.jsp" /> 