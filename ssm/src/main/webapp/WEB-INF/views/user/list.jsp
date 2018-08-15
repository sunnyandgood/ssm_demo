<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<jsp:include page="/resources/layout/_css.jsp"/>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="${ctx}/resources/css/plugins/bootstrap-table/bootstrap-table.min.css"/>

</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					学生列表
				</div>
				<div class="ibox-content">
					<table id="table"> </table>
				</div>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/resources/layout/_script.jsp"/>
<!-- Latest compiled and minified JavaScript -->
<script src="${ctx}/resources/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<!-- Latest compiled and minified Locales -->
<script src="${ctx}/resources/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script>
    $('#table').bootstrapTable({
		url:'${ctx}/user/list',
        columns: [{
           checkbox:true
		}, {
            // field: 'id',
            title: '序号',
            formatter:function(value,row,index){
                //return index+1; //序号正序排序从1开始
                var pageSize=$('#table').bootstrapTable('getOptions').pageSize;//通过表的#id 可以得到每页多少条
                var pageNumber=$('#table').bootstrapTable('getOptions').pageNumber;//通过表的#id 可以得到当前第几页
                return pageSize * (pageNumber - 1) + index + 1;    //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
            }
        }, {
            field: 'userName',
            title: '学生姓名'
        }, {
            field: 'gender',
            title: '性别',
            formatter:function(v1){
                if(v1==1){
                    return '男';
                }else if(v1==2){
                    return '女';
                }else{
                    return v1;
                }
            }
        }, {
            field: 'email',
            title: '邮箱'
        },{
            field: 'caozuo',
            title: '操作',
            formatter:function(v1,v2,v3){
                /* console.log(v1);
                console.log(v2);
                console.log(v3); */
                return ['<a class="edit" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-pencil"></i>',
                    '</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
                    '<a class="remove" href="javascript:void(0)" title="Remove">',
                    '<i class="glyphicon glyphicon-remove"></i>',
                    '</a>'].join('');
            },
            events:'caocuoEvents'
        }],
        pagination:true,
		pageSize:5,
		pageList:[5,10,15,20,25,30,],
		search:true,
		showRefresh:true,
		showColumns:true,
		clickToSelect:true,
		sidePagination:'server',
        queryParamsType:''
    });
    window.caocuoEvents = {
        'click .edit': function (e, value, row) {
            // layer.open({
            //     icon:2,
            //     content:row['id']
            // });
            layer.open({
                type: 2,
                area: ['800px', '350px'],
                content: '${ctx}/user/preUpdate/' + row['id'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
            });
        },
        'click .remove': function (e, value, row) {
            if(confirm('是否删除')){
                $.post('${ctx}/user/delete/'+row['id'],function(r){

                    if(r.code==200){
                        $('#table').bootstrapTable('refresh');
                    }
                    layer.msg(r.message);
                });
            }
        }
    };
</script>
</html>