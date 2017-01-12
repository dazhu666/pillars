<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
        <title>admin登录</title>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/font-awesome.css" />
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/unicorn-login.css" />
    		<script type="text/javascript" src="<%=request.getContextPath() %>/js/respond.min.js"></script>
	<script>
		  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		  ga('create', 'UA-44987299-1', 'bootstrap-hunter.com');
		  ga('send', 'pageview');

		</script></head>    <body>
        <div id="container">
            <div id="logo">
                <img src="<%=request.getContextPath() %>/images/login_log.jpg" alt="" />
            </div>
            <div id="user">
                <div class="avatar">
                    <div class="inner"></div>
                    <img src="img/demo/av1_1.jpg" />
                </div>
                <div class="text">
                    <h4>Hello,<span class="user_name"></span></h4>
                </div>
            </div>
            <div id="loginbox">            
                <form id="loginform" action="index.html">
    				<p>Enter username and password to continue.</p>
                    <div class="input-group input-sm">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span><input class="form-control" type="text" id="username" placeholder="Username" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" type="password" id="password" placeholder="Password" />
                    </div>
                    <div class="form-actions clearfix">
                        <div class="pull-left">
                            <a href="#registerform" class="flip-link to-register blue">Create new account</a>
                        </div>
                        <div class="pull-right">
                            <a href="#recoverform" class="flip-link to-recover grey">Lost password?</a>
                        </div>
                        <input type="submit" class="btn btn-block btn-primary btn-default" value="Login" />
                    </div>
                    <div class="footer-login">
                        <div class="pull-left text">
                            Login with
                        </div>
                        <div class="pull-right btn-social">
                            <a class="btn btn-facebook" href="#"><i class="fa fa-facebook"></i></a>
                            <a class="btn btn-twitter" href="#"><i class="fa fa-twitter"></i></a>
                            <a class="btn btn-google-plus" href="#"><i class="fa fa-google-plus"></i></a>
                        </div>
                    </div>

                </form>
                <form id="recoverform" action="#">
    				<p>Enter your e-mail address below and we will send you instructions how to recover a password.</p>
    				<div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span><input class="form-control" type="text" placeholder="E-mail address" />
                    </div>
                    <div class="form-actions clearfix">
                        <div class="pull-left">
                            <a href="#loginform" class="grey flip-link to-login">Click to login</a>
                        </div>
                        <div class="pull-right">
                            <a href="#registerform" class="blue flip-link to-register">Create new account</a>
                        </div>
                        <input type="submit" class="btn btn-block btn-inverse" value="Recover" />
                    </div>
                </form>
                <form id="registerform" action="#">
                    <p>Enter information required to register:</p>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span><input class="form-control" id="r_name" name="login" type="text" placeholder="Enter Username" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" id="r_password" name="password" type="password" placeholder="Choose Password" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span><input class="form-control" id="r_password2" type="password" placeholder="Confirm password" />
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span><input class="form-control" id="r_mobile" name="mail" type="text" placeholder="Enter E-mail address" />
                    </div>
                    <div class="form-actions clearfix">
                        <div class="pull-left">
                            <a href="#loginform" class="grey flip-link to-login">Click to login</a>
                        </div>
                        <div class="pull-right">
                            <a href="#recoverform" class="grey flip-link to-recover">Lost password?</a>
                        </div>
                        <input type="button" class="btn btn-block btn-success" value="Register" onclick="reg()"/>
                    </div>
                </form>
            </div>
        </div>
       
        <script src="<%=request.getContextPath() %>/js/jquery-2.0.3.min.js"></script>  
        <script src="<%=request.getContextPath() %>/js/jquery-ui.custom.min.js"></script>
        <script src="<%=request.getContextPath() %>/js/unicorn.login.js"></script> 
        <script type="text/javascript">
        function reg(){
        	if($("#r_name").val()=="" || $("#r_password").val()=="" || $("#r_password2").val()=="" || $("#r_mobile").val()==""){
        		highlight_error($("#r_name"));
        		highlight_error($("#r_password"));
        		highlight_error($("#r_password2"));
        		highlight_error($("#r_mobile"));
        		login_register.effect('shake');
        		return;
        	}else{
        	
        		 $.ajax({
            		url:"<%=request.getContextPath()%>/user/register",
            		type:"post",
            		dataType:"json",
            		data:$("#registerForm").serialize(),
            		success:function(d){
            			alert(d.message);
            		},
            		error:function(){
            			
            		}
            	});
        	}
        }
        </script>
    </body>
</html>