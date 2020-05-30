<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%response.setContentType("text/html; charset=utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.4.1.js"></script>

<style type="text/css">
	input[type=file] {
            display: none;
     }

     .my_button {
         display: inline-block;
         width: 200px;
         text-align: center;
         padding: 10px;
         background-color: #006BCC;
         color: #fff;
         text-decoration: none;
         border-radius: 5px;
     }



     .imgs_wrap {

         border: 2px solid #A8A8A8;
         margin-top: 30px;
         margin-bottom: 30px;
         padding-top: 10px;
         padding-bottom: 10px;
		 width: 800px;
     }
     .imgs_wrap img {
         max-width: 150px;
         margin-left: 10px;
         margin-right: 10px;
     }
</style>


<script type="text/javascript">

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
                var html = "<a href=\"javascript:void(0);\" onclick=\"deleteImageAction("+index+")\" id=\"img_id_"+index+"\"><img src=\"" + e.target.result + "\" data-file='"+f.name+"' class='selProductFile' title='Click to remove'></a>";
                $(".imgs_wrap").append(html);
                index++;

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
<div>
    <div class="imgs_wrap">
        <img id="img" />
    </div>
</div>
<div>
    <div class="input_wrap">
        <a href="javascript:" onclick="fileUploadAction();" class="my_button">파일 업로드</a>
        <input type="file" id="input_imgs" multiple/>
    </div>
</div>

</body>
</html>