<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2018/8/17
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
    <jsp:include page="/resources/layout/_css.jsp"/>
    <link rel="stylesheet" href="${ctx}/resources/css/plugins/Huploadify/Huploadify.css"/>
</head>
<body>

    <%--<form action="${ctx}/upload" method="post" enctype="multipart/form-data">--%>
        <%--<input type="file" name="file"/>--%>
        <%--<input type="submit" value="提交">--%>
    <%--</form>--%>

<input type="text" name="xx"/>    <%--(回填表单,用于提交表单的图片数据库存储)--%>
<div class="imageUpload"></div>    <%--   (上传控件)--%>
<%--<div class="preview"></div>                 &lt;%&ndash; (预览)&ndash;%&gt;--%>


</body>
<jsp:include page="/resources/layout/_script.jsp"/>
<script src="${ctx}/resources/js/plugins/Huploadify/jquery.Huploadify.js"></script>

<script>
    $('.imageUpload').each(function(){
        var aa = function(obj){
            obj.Huploadify({
                auto:true,
                fileTypeExts:'*.jpg;*.png;',
                multi:true,
                //formData:{name:'image0'},
                fileSizeLimit:9999,
                showUploadedPercent:true,//是否实时显示上传的百分比，如20%
                showUploadedSize:true,
                removeTimeout:9999999,
                uploader:'${ctx}/upload',
                onUploadComplete:function(file,data,response){
                    //获得回填数据
                    data_json = JSON.parse(data);
                    src = "${ctx}"+data_json.path;
                    //此处obj为上传控件  ,代表每个imageUpload
                    //回填表单
                    obj.prev().val(data_json.path);
                    //填充预览图
                    str = '<div class="preview"></div>';
                    obj.after(str);
                    obj.next().append("<img src='"+src+"'/>");
                    setTimeout(function(){
                        obj.find('.uploadify-queue-item').html('');
                    },1000);
                }
            });
        }
        aa($(this));
    });
<%--$('.imageUpload').each(function(){--%>
    <%--var aa = function(obj){--%>
        <%--obj.Huploadify({--%>
            <%--auto:true,--%>
            <%--fileTypeExts:'*.*;',--%>
            <%--multi:true,--%>
            <%--//formData:{name:'image0'},--%>
            <%--fileSizeLimit:9999,--%>
            <%--showUploadedPercent:true,//是否实时显示上传的百分比，如20%--%>
            <%--showUploadedSize:true,--%>
            <%--removeTimeout:9999999,--%>
            <%--uploader:'${ctx}/upload',--%>
            <%--onUploadComplete:function(file,data,response){--%>
                <%--//获得回填数据--%>
                <%--data_json= JSON.parse(data);--%>
                <%--src = "${ctx}"+data_json.path;--%>
                <%--//此处obj为上传控件  ,代表每个imageUpload--%>
                <%--//回填表单--%>
                <%--obj.prev().val(data_json.path);--%>
                <%--//填充预览图--%>
                <%--obj.next().html("<img src='"+src+"' style='height:250px'/>");--%>
                <%--setTimeout(function(){--%>
                    <%--obj.find('.uploadify-queue-item').html('');--%>
                <%--},1000);--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    <%--aa($(this));--%>
<%--});--%>
</script>
</html>
