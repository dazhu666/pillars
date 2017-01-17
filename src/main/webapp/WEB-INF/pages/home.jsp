<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ext/ext-locale-zh_CN.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery-2.0.3.min.js"></script>
<%String path=request.getContextPath(); %> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/ext/theme-triton/resources/theme-triton-all.css">
  <script type="text/javascript">
  Ext.onReady(function(){
	  var list=[];
	  var menu2List=[];
	  var menu1List=[];
	  var path="<%=request.getContextPath()%>";
	  $.ajax({
		  url:path+"/index/menu",
		  type:"post",
		  async:false,
		  dataType:"json",
		  success:function(d){
			  list=d.data;
			  for(i=0;i<list.length;i++){
				  if(list[i].rank==1){
					  var menu1Item={code:list[i].code,title:list[i].title};
					  menu1List.push(menu1Item);
				  }
				  if(list[i].rank==2){
					  var menu2Item={code:list[i].code,title:list[i].title,parentCode:list[i].parentNode};
					  menu2List.push(menu2Item);
				  }
			  }
			  
		  }
	  });
	  var menu3List=[];
	  for(i=0;i<menu1List.length;i++){
		  var title=menu1List[i].title;
		  var parentCode=menu1List[i].code;
		  var items=[];
		  for(i=0;i<menu2List.length;i++){
			  if(menu2List[i].parentCode==parentCode){
				  var treeItem={ text: menu2List[i].title, leaf: true }
				  items.push(treeItem);
			  }
		  }
			  var store = Ext.create('Ext.data.TreeStore', {
				    root: {
				        expanded: true,
				        children: items
				    }
				});

				var treepane=Ext.create('Ext.tree.Panel', {
				    title:title,
				    width: 200,
				    height: 150,
				    store: store,
				    rootVisible: false,
				});
			 
			  menu3List.push(treepane)
		  
	  }
	  //获取浏览器的高度
	  var height=$(window).height();
	  //获取浏览器宽度
	  var width=$(window).width();
	 var top= Ext.create('Ext.panel.Panel',{
		  region: "north",
		  height:1,
		  width:width,
		  //bodyStyle:'background:#5fa2dd;border:0;',
				 //url('+path+'/images/tu11464_2.jpg)
	  });
	  
	  
	 var left= Ext.create('Ext.panel.Panel', {
		 region: "west",
		    title: '菜单',
		    width: 300,
		    autoScroll:true,
		    height:height*0.9-5,
		    layout: {
		        // layout-specific configs go here
		        type: 'accordion',
		        titleCollapse: true,
		        animate: true,
		    },
		    items: menu3List,

		});
	  
	 var right= Ext.create('Ext.panel.Panel',{
		 region: "center",
		  title:"主界面",
		  width:width-305,
		  height:height*0.9-5,

		  html: '<iframe id="frame1" src="'+path+'/index/menus" frameborder="0" width="100%" height="100%"></iframe>'
		  
	  });

	  new Ext.Viewport({
		  title: "Viewport",
		  layout: "border",
		  defaults: {
			  bodyStyle: "background-color: #FFFFFF;",
			  frame: true
		  },
		  items: [
			  top,left,right

		  ],

	  });
	
  });
  </script>
</head>
<body>
</body>
</html>