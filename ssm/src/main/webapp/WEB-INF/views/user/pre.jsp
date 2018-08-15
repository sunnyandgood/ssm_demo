<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/resources/layout/_css.jsp"/>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <form  class="form-horizontal" method="post">

                        <input type="hidden" name="id">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control"  name="userName">
                                <div id="nameMsg"></div>
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

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <div class="btn btn-primary" onclick="save()">保存内容</div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<jsp:include page="/resources/layout/_script.jsp"/>
<script>
    arr = location.href.split("/");
    id = arr[arr.length-1];

    $.get('${ctx}/user/'+id,function (r) {
        u = r.user;
        // console.log(u);
        $('[name=id]').val(id);
        $('[name=userName]').val(u.userName);
        $('[name=email]').val(u.email);
        if(u.gender==1){
            //男：
            $(':radio').first().prop('checked',true);
            $(':radio').last().prop('checked',false);
        }else{
            //女:
            $(':radio').first().prop('checked',false);
            $(':radio').last().prop('checked',true);
        }
    });

    function save(){
        $.post('${ctx}/user/update',$('form').serialize(),function (r) {
            if(r.code==200){
                parent.$('#table').bootstrapTable('refresh');
                var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                parent.layer.close(index); //再执行关闭
            }
            layer.msg(r.message);
        });
    }
</script>
<%--<script>--%>
    <%--// console.log(location.href);--%>
    <%--arr = location.href.split("/");--%>
    <%--id = arr[arr.length-1];--%>
    <%--// alert(id);--%>

    <%--$.get('${ctx}/user/' + id,function (r) {--%>
        <%--user1 = r.user;--%>
        <%--alert(user1.userName);--%>
        <%--console.log(user1);--%>
    <%--})--%>
<%--</script>--%>
</html>
