<%--
  Created by IntelliJ IDEA.
  User: sunny
  Date: 2018/8/18
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/resources/layout/_css.jsp"/>
    <link rel="stylesheet" href="${ctx}/resources/css/plugins/Huploadify/Huploadify.css">
    <%--<jsp:include page="/resources/layout/_css.jsp"/>--%>
    <%--<link rel="stylesheet" href="${ctx}/resources/css/plugins/Huploadify/Huploadify.css"/>--%>
</head>
<body>
<%-- <form action="${ctx}/upload" method="post" enctype="multipart/form-data">
     <input type="file" name="file">
     <input type="submit" value="提交">
 </form>--%>
<h1>上传相册</h1>
<form action="${ctx}/uptest1">
    <div id="imageUpload" name="img"></div>    <%--   (上传控件)--%>
    <input type="submit" value="提交">
</form>

<h1>上传头像</h1>
<form action="${ctx}/uptest2">
    <div id="imageUpload2" name="img2"></div>    <%--   (上传控件)--%>
    <input type="submit" value="提交">
</form>
</body>
<jsp:include page="/resources/layout/_script.jsp"/>
<script src="${ctx}/resources/js/plugins/Huploadify/jquery.Huploadify.js"></script>
<script src="${ctx}/resources/js/my.js"></script>
<%--<jsp:include page="/resources/layout/_script.jsp"/>--%>
<%--<script src="${ctx}/resources/js/plugins/Huploadify/jquery.Huploadify.js"></script>--%>
<%--<script src="${ctx}/resources/js/my.js"></script>--%>
<script>
    upload($('#imageUpload'),true,'${ctx}/upload2','${ctx}');
    upload($('#imageUpload2'),false,'${ctx}/upload2','${ctx}');
</script>
</html>

