<%@page pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resources/layout/_css.jsp"/>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.css">
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<!-- <table id="table"></table> -->
		<div class="row">
			<div class="col-sm-12">
				  <div class="ibox float-e-margins">
				  	 <div class="ibox-title">
				  	 	<h5>学生列表</h5>
				  	 </div>
				  	 <div class="ibox-content">
				  	 	<table id="table"></table>
				  	 	 <div class="btn btn-primary" onclick='deleteSelect()'>删除所选</div>
				  	 	 <div class="btn btn-primary" onclick='addStudentPop()'>添加学生</div>
				  	 	 <div class="btn btn-primary" onclick='addStudentPop2()'>添加学生2</div>
				  	 </div>
				  </div>
			</div>
		</div>
	</div>
</body>
<div class="col-sm-12" id="pop" style="display:none">
             <div class="ibox float-e-margins">
                 <div class="ibox-title">
                     <h5>学生添加<small>添加学生</small></h5>
                     <div class="ibox-tools">
                         <a class="collapse-link">
                             <i class="fa fa-chevron-up"></i>
                         </a>
                         <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                             <i class="fa fa-wrench"></i>
                         </a>
                         <ul class="dropdown-menu dropdown-user">
                             <li><a href="form_basic.html#">选项1</a>
                             </li>
                             <li><a href="form_basic.html#">选项2</a>
                             </li>
                         </ul>
                         <a class="close-link">
                             <i class="fa fa-times"></i>
                         </a>
                     </div>
                 </div>
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
                        <div class="btn btn-primary" onclick="save()">保存内容</div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="/resources/layout/_script.jsp"/>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/bootstrap-table.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.js"></script>
<script>
$('#table').bootstrapTable({
    url: '${ctx}/StudentServlet/listAllJsonSearch',
    columns: [
    	{
    		checkbox:true
    		
    	},{
        field: 'name',
        title: '姓名',
        sortable:true
    }, {
        field: 'birthday',
        title: '生日'
    }, {
        field: 'gender',
        title: '性别',
        sortable:true,
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
        field: 'city',
        title: '城市'
    }, {
    	field: 'caozuo',
        title: '操作',
        formatter:function(v1,v2,v3){
        	/* console.log(v1);
        	console.log(v2);
        	console.log(v3); */
        	return ['<a class="like" href="javascript:void(0)" title="Like">',
                '<i class="fa fa-pencil"></i>',
                '</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;',
                '<a class="remove" href="javascript:void(0)" title="Remove">',
                '<i class="glyphicon glyphicon-remove"></i>',
                '</a>'].join('');
        },
        events:'caocuoEvents'
    }],
    pagination:true,
    pageSize:10,
    pageList:[5,10,20],
    search:true,
    showRefresh:true,
    showColumns:true,
    clickToSelect:true,
    sidePagination:'server',
    rowStyle:function(v,index){
    	var classes = ['active', 'success', 'info', 'warning', 'danger'];
        if(index==3){
        	return {classes:'success'};
        }
        return {}; 
    },
    formatLoadingMessage:function(){
    	return '';
    }
});
window.caocuoEvents = {
        'click .like': function (e, value, row) {
        	layer.open({
        		icon:2,
        		content:row['sid']
        	});
        },
        'click .remove': function (e, value, row) {
        	if(confirm('是否删除')){
        		 $.get('${ctx}/StudentServlet/removeByIdJson',{'id':row['sid']},function(r){
            		 if(r){
            			layer.msg('删除成功');
            			 $('#table').bootstrapTable('refresh');
            		 }else{
            			 layer.msg('删除失败');
            		 }
            	 });
        	}
        }
    };

function deleteSelect(){
	arr = $('#table').bootstrapTable('getSelections');
	arr2 = [];
	for(i in arr){
		arr2.push(arr[i]['sid']);
	}
	str = JSON.stringify(arr2);
	$.get('${ctx}/StudentServlet/removeAll',{'sids':str},function(r){
		if(r){
			$('#table').bootstrapTable('hideLoading');
			layer.msg("删除了"+r+"行数据");
		    $('#table').bootstrapTable('refresh');
		}else{
			layer.msg("删除失败");
		}
	});	
}

function addStudentPop(){
	layer.open({
		type:1,
		content:$('#pop')
	});
}
function addStudentPop2(){
	parent.layer.open({
		type:2,
		content:'${ctx}/StudentServlet/listAllByPage?pageNum=1',
		area: ['1000px', '300px'],
		offset:'70px',
		maxmin :true,
		fixed:true
	});
}

function save(){
	//发ajax
	layer.closeAll(); 
}
</script>
</html>