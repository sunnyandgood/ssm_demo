<%@page pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/layout/_css.jsp"/>

</head>
<body>
	<body class="gray-bg">
		<div class="wrapper wrapper-content animated fadeInRight">
			<div class="row">
				<div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>基本</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                            <a class="dropdown-toggle" data-toggle="dropdown" href="table_basic.html#">
                                <i class="fa fa-wrench"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-user">
                                <li><a href="table_basic.html#">选项1</a>
                                </li>
                                <li><a href="table_basic.html#">选项2</a>
                                </li>
                            </ul>
                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>姓名</th>
                                    <th>生日</th>
                                    <th>性别</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="student" items="${studentList}" varStatus="status">
                            	<tr>
                            		<td>${status.count}</td>
                            		<td>${student.name}</td>
                            		<td>${student.birthday }</td>
                            		<td>${student.gender}</td>
                            		<td><a href="" class="btn btn-warning btn-sm"><span class="fa fa-pencil"></span></a>
                            		<a href="${ctx}/StudentServlet/removeById?id=${student.sid}" class="btn btn-danger btn-sm"><span class="fa fa-remove"></span></a></td>
                            	</tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div id="page"></div>
                    </div>
                </div>
            </div>
			</div>
		</div>
	</body>
</body>
<jsp:include page="/resources/layout/_script.jsp"/>
<script src="${ctx}/js/plugins/jquery-bootstrap-pagination/jquery-bootstrap-pagination.js"></script>
<script>
$('#page').pagination({
    total_pages: ${pageCount},
    current_page: ${pageNum},
    prev:'上一页',
    next:'下一页',
    display_max:4,
    callback: function(event, page) {
    	location="${ctx}/StudentServlet/listAllByPage?pageNum="+page;
    }
});
</script>
</html>