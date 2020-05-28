<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">   
	$(document).ready(function(){
	    $("#myBtn").click(function(){
	        $("div.modal").modal(); 
	    });
	});
</script>  
</head>
<body> 
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog">

  		<!-- Modal content-->
   		<div class="modal-content">
     		<div class="modal-header">
       			<button type="button" class="close" data-dismiss="modal">×</button>
       			<h4 class="modal-title">Modal Header</h4>
     		</div>
     		<div class="modal-body">
       			<p>Some text in the modal.</p>
     		</div>
     		<div class="modal-footer">
       			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
     		</div>
   		</div>
	</div>
</div>
<div>
	<button id="myBtn">모달 실행하기</button>
</div>

</body>
</html>