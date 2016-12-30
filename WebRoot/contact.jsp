<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- // Stylesheets // -->
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div id="wrapper_sec">
  <div><jsp:include page="index_navigation.jsp"/></div>


<div id="mk02"><div id="crumb">
    	<ul class="breadcrumb">
        	<li>我的位置</li>
            <li class="last"><a href="#">账户管理</a></li>
        </ul>
        <ul class="network">
        	<li>分享:</li>
            <li><a href="#"><img src="images/twitter.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/delicious.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/blogger.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/facebook.gif" alt="" /></a></li>
        </ul>
    </div></div>
<div><jsp:include page="index_left.jsp"/></div>
<div class="col2">
<div class="contact"> 
            	<h3 class="heading">联系我们</h3> 
                <div class="mapsec"> 
                	<h6>我们介绍</h6> 
                    <p> 
                    	CCL电子商城成立于2010年8月30日8点30分30秒 自成立以来 本公司以服务顾客为主 获得广大顾客的支持 并在2011年3月20号荣获国家创业公司50强 ！！！</p> 
                    <div class="clear"></div> 
                    <br /> 
                    <p> 
                    	<span class="bold">电话：</span> 123-040-536<br /> 
                        <span class="bold">地址：</span> 123-040-536<br /> 
                        <span class="bold">邮箱：</span> info@website.com<br /> 
                    </p> 
                    <div class="map"> 
                        <img src="images/goods/sj1.jpg" alt="" width="154" height="129"/>
                    	<div class="clear"></div> 
                  </div> 
                </div> 
                <div class="contact_form"> 
                	<h6>联系我们</h6> 
                    <form method="post"  id="contactform"> 
                    <ul> 
                    	<li> 
                        	<input type="text" value="姓名" onblur="if(this.value == '') { this.value = '姓名'; }" onfocus="if(this.value == '姓名') { this.value = ''; }" name="contactname" id="contactname" class="bar required" /> 
                        </li> 
                        <li>    
                            <input type="text" value="邮箱地址" onblur="if(this.value == '') { this.value = '邮箱地址'; }" onfocus="if(this.value == '邮箱地址') { this.value = ''; }" name="email" id="emailvox" class="bar required email" /> 
                        </li> 
                        <li> 
                            <input type="text" value="主题" onblur="if(this.value == '') { this.value = '主题'; }" onfocus="if(this.value == '主题') { this.value = ''; }" name="subject" class="required bar" /> 
                        </li> 
                        <li> 
                            <textarea id="message" name="内容"  class="required"></textarea> 
                        </li> 
                        <li> 
                        <button type="submit" class="submit" >提交</button>
                        </li> 
                    </ul> 
                    </form> 
                </div> 
            </div>
            </div>
  </div>


<div class="clear"></div>
<!-- Footer -->
<div id="footer">
	<!-- Inner Footer Contents -->
<jsp:include page="copyright.jsp"/>	
</div>
</body>
</html>
