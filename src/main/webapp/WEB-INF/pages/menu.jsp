<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-locale-zh_CN.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-2.0.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/ext/theme-triton/resources/theme-triton-all.css">
<script type="text/javascript">
Ext.onReady(function(){
	var width=$(window).width();
	var height=$(window).height();
	var path='<%=request.getContextPath()%>';
	var store=Ext.create('Ext.data.Store',{
	    storeId:'simpsonsStore',
	    fields:['id', 'title', 'parentNode','code', 'haveChild', 'link', 'rank', 'dateCreated','lastUpdated'],
	    pageSize:20,
	    autoLoad: true,
	    proxy: {
	        type: 'ajax',
	        url:path+'/index/menu',
	        reader: {
	            type: 'json',
	            root: 'data',
	        }
	    }
	});

	Ext.create('Ext.grid.Panel', {
	    store: store,
	    width:width,
	    selModel: { selType: 'checkboxmodel',singleSelect:true }, //选择框,并设置只能单选
	    forceFit:true,//使列自适应比例宽度
	    columns: [
	        { header: 'ID',  dataIndex: 'id' },
	        { header: '标题', dataIndex: 'title' },
	        { header: '节点标识', dataIndex: 'code' },
	        { header: '父节点标识', dataIndex: 'parentNode' },
	        { header: '是否有子节点', dataIndex: 'haveChild' },
	        { header: '链接', dataIndex: 'link' },
	        { header: '等级', dataIndex: 'rank' },
	        { header: '创建时间', dataIndex: 'dateCreated' },
	        { header: '最后更新时间', dataIndex: 'lastUpdated' },
	    ],
	    tbar:[
	          {xtype: 'button', text: 'Button 1',iconCls: "saveIcon"}
	          ],
	   
	    renderTo: "body"
	});
});

</script>
<title>Insert title here</title>
</head>
<body id="body">

</body>
</html>