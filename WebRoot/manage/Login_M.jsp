<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理</title>
<link rel="stylesheet" href="css/login_m.css" type="text/css" />

</head>
<body>
	<!-- Header -->
	<header id="top">
	  <div class="wrapper-login">
			<!-- Title/Logo - can use text instead of image -->
			<div id="title">
			  <!--<span>Administry</span> demo-->
              <img src="images/login_M.jpg" width="360" height="124"></div>
			<!-- Main navigation -->
		  <nav id="menu">
				<ul class="sf-menu">
					<li class="current"><a href="#">Login</a></li>
				</ul>
		</nav>
			<!-- End of Main navigation -->
			<!-- Aside links --><!-- End of Aside links -->
	  </div>
	</header>
	<!-- End of Header -->
	<!-- Page title -->
	<div id="pagetitle">
		<div class="wrapper-login"></div>
	</div>
	<!-- End of Page title -->
	
	<!-- Page content -->
	<div id="page">
		<!-- Wrapper -->
		<div class="wrapper-login">
				<!-- Login form -->
				<section class="full">					
					
					<h3>管理员登录</h3>
					
					<div class="box box-info"></div>

					<form action="Login_M_deal.jsp" method="post" name="loginform" id="loginform">

						<p>
							<label class="required" for="username">用户名</label>
							<br/>
							<input type="text" id="manager" class="full" value="" name="manager"/>
						</p>
						
						<p>
							<label class="required" for="password">密　码</label>
							<br/>
							<input type="password" id="PWD" class="full" value="" name="PWD"/>
						</p>
						
						<p>验证码 <input name="code" type="text" id="code" /><img src="../img.jsp">
						</p>
						
					  <p>
						<input type="submit" class="btn btn-green big" value="登录"/>
						
						　　
						<input name="" type="reset" class="btn btn-green big" value="重置"/>
						&nbsp; <a href="index.jsp"></a></p>
						<div class="clear">&nbsp;</div>

				  </form>
					
					<form id="emailform" style="display:none" method="post" action="#">
						<div class="box">
							<p id="emailinput">
								<label for="email">Email:</label><br/>
								<input type="text" id="email" class="full" value="" name="email"/>
							</p>
							<p>
								<input type="submit" class="btn" value="Send"/>
							</p>
						</div>
					</form>
					
				</section>
				<!-- End of login form -->
				
		</div>
		<!-- End of Wrapper -->
	</div>
	<!-- End of Page content -->
	
	<!-- Page footer -->
<footer id="bottom"></footer>

</body>
</html>