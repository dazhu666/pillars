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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/ext/theme-triton/resources/icon.css">
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
	          {xtype: 'button', text: '添加',iconCls: "Add",handler:function(){

				  var parentCodes;
				  $.ajax({
					  type:"post",
					  dataType:"json",
					  url:path+'/index/menu',
					  async:false,
					  success:function(d){
						  parentCodes= d.data;
					  }
				  });
				  var list=[];
				  for(var i=0;i<parentCodes.length;i++){
					  var codeItem={text:parentCodes[i].title,value:parentCodes[i].code};
					  list.push(codeItem);
				  }
				  var fileItmes=[
					  {fieldName:"标题",fieldValue:"title",text:"",fieldType:"text"},
					  {fieldName:"节点标识",fieldValue:"code",text:"",fieldType:"text"},
					  {fieldName:"父节点",fieldValue:"parentNode",list:list,fieldType:"comb"},
					  {fieldName:"链接",fieldValue:"title",text:"",fieldType:"text"}
				  ];
				  search(fileItmes);
			  }}
	          ],
	   
	    renderTo: "body"
	});
});


function search(fieldItemsList,url) {
	var Form;
	var Win;
	var formItmes = [];
	var container = Ext.create('Ext.container.Container', {
		layout: "hbox", margin: "0 0 5 0", items: [
			{
				xtype: 'datefield',
				fieldLabel: '时间',
				labelWidth: 80,
				flex: 3,
				name: 'beginDate',
				format: 'Y-m-d',
			}, {
				xtype: 'datefield',
				flex: 2.2,
				fieldLabel: '~',
				labelWidth: 10,
				name: 'endDate',
				format: 'Y-m-d',
			}
		]
	});
	//formItmes.push(container);
	for (w = 0; w < fieldItemsList.length; w++) {
		var formItem;
		if (fieldItemsList[w].fieldType == "comb") {
			formItem = Ext.create('Ext.form.ComboBox', {
				fieldLabel: fieldItemsList[w].fieldName,
				labelWidth: 80,
				width: 280,
				name: fieldItemsList[w].fieldValue,
				value: "",
				store: Ext.create('Ext.data.Store', {
					fields: [
						'value', 'text'
					],
					data: fieldItemsList[w].list
				}),
				emptyText: '--请选择--',
				editable: false,
				//隐藏的value域与store中配置的value对应
				valueField: 'value',
				//用来显示的域与store中配置的text对应
				displayField: 'text',
			});
		} else {
			formItem = Ext.create('Ext.form.field.Text', {
				fieldLabel: fieldItemsList[w].fieldName,
				labelWidth: 80,
				width: 280,
				name: fieldItemsList[w].fieldValue
			});
		}
		if(fieldItemsList[w].fieldType == "data"){
			formItem=Ext.create("Ext.form.field.Date",{
				fileLabel:fieldItemsList[w].fieldName,
				name:fieldItemsList[w].fieldValue,
			});
		}
		formItmes.push(formItem);
	}

	Form = Ext.create('Ext.form.Panel', {

		width: 500,
		bodyPadding: '5 5 5 5',
		buttonAlign: 'center',
		defaultType: 'textfield',
		defaults: {
			msgTarget: 'side'
		},
		items: formItmes,
		buttons: [
			{
				text: '确定',
				handler: function () {
					Form.submit({
						url:url,
						success:function(form,response){

						}
					});
				}
			}, {
				text: '关闭',
				handler: function () {
					Win.hide();
				}
			}
		]
	});

	Win = Ext.create('Ext.window.Window', {
		title: '新增',
		plain: true,
		modal: true,
		resizable: false,
		closeAction: 'hide',
		items: [Form]
	});
	Form.getForm().reset();
	Win.show();
}

</script>
<title>Insert title here</title>
</head>
<body id="body">

</body>
</html>