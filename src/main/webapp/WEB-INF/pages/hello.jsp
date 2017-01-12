<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/1/11
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<%
  String basePath=request.getContextPath();
%>
<script type="text/javascript" src="<%=basePath%>/js/jquery-2.0.3.min.js"></script>
<script>
  function a(){
    $.ajax({
      type:"post",
      dataType:"json",
      url:"<%=basePath%>/hello/login",
      success:function(d){
        alert(d.aa);
      }
    });
  }

</script>
<body>
<h1>${dd}</h1>
<input type="button" value="请求" onclick="a()">
</body>
</html>
