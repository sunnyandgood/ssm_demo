<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%--<jsp:include page="/resources/layout/_css.jsp"/>--%>
<jsp:include page="/resources/layout/_css.jsp"/>
<link rel="stylesheet" href="${ctx}/resources/css/plugins/datapicker/bootstrap-datepicker.css">
</head>
<body style="padding-top: 40px">
<div class="col-sm-12">
    <div class="ibox float-e-margins">
        <div class="ibox-content">
            <form method="post" class="form-horizontal" >
                <div class="form-group">
                    <label class="col-sm-2 control-label">姓名</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="userName">
                    </div>
                </div>
                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" value="1"  name="gender">
                            男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="2"  name="gender">
                            女
                        </label>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">email</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="email">
                        <div id="birthdayMsg"></div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">生日</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="birthday">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">班级</label>
                    <div class="col-sm-10">
                        <select name="cId" class="form-control"></select>
                    </div>
                </div>

                <div class="hr-line-dashed"></div>
                <div class="form-group">
                    <div class="col-sm-4 col-sm-offset-2">
                        <div class="btn btn-primary" onclick="insert()">确认添加</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="/resources/layout/_script.jsp"/>
</body>
<script src="${ctx}/resources/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="${ctx}/resources/js/plugins/datapicker/bootstrap-datepicker.zh-CN.min.js"></script>
<script>
    //datepicker:
    $('[name=birthday]').datepicker({
        format: "yyyy-mm-dd",
        language: "zh-CN",
        orientation: "top left",
        autoclose: true,
        todayHighlight: true
    });

    //查询所有班级
    $.get('${ctx}/classroom/list',function (r) {
        classrooms = r['classrooms'];
        $('select').empty();
        for (i in classrooms) {
            str = '<option value="' + classrooms[i]['id'] + '">' + classrooms[i]['name'] + '</option>';
            $('select').append(str);
        }
    });

    function insert(){
        $.post('${ctx}/user/insert',$('form').serialize(),function (r) {
            // if(r.code==200){
            //     parent.$('#table').bootstrapTable('refresh');
            //     var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            //     parent.layer.close(index); //再执行关闭
            // }
            layer.msg(r.message);
        });
    }
</script>
</html>