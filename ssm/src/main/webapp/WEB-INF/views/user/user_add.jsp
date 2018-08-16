<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/layout/_css.jsp"/>
</head>
<body>
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <form method="get" class="form-horizontal" action="${ctx}/StudentServlet/addStudent">
                <div class="form-group">
                    <label class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="name">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="birthday">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        性别
                    </label>

                    <div class="col-sm-10">
                        <div class="radio">
                            <label>
                                <input type="radio" checked="" value="男" id="optionsRadios1" name="gender">男
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" value="女" id="optionsRadios2" name="gender">女
                            </label>
                        </div>
                    </div>
                </div>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <div class="btn btn-primary">保存内容</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/resources/layout/_script.jsp"/>
</body>
</html>