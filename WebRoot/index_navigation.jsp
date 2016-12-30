<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="Home.css" />
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
#Layer1 {
	position:absolute;
	width:213px;
	height:76px;
	z-index:21;
	top: -23px;
	visibility: visible;
	left: 742px;
}
-->
</style>
</head>
<body>
<table width="940" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <%
  String goodsName="null";
 String username=(String)session.getAttribute("username");
 if(username==null || username==""){
  %>
    <td width="43" height="24"><a href="login_user.html">登录|</a></td>
	  <td width="35"><a href="register.jsp">注册|</a></td>
    <td width="75"><a href="cart_see.jsp">　我的购物车|</a></td>
    <td width="185"><a href="./manage/Login_M.jsp">　后台账户登录|</a></td>
    <td width="115"><marquee scrollamount="2">游客，欢迎您！购物请先登录！</marquee></td>
	<%
	}
	else
	{
	%>
	<td width="32" height="24"><a href="logout.jsp">退出|</a></td>
    <td width="144"><a href="cart_see.jsp">我的购物车|</a></td>
	 <td width="185"><a href="./manage/Login_M.jsp">　后台账户登录|</a></td>
    <td width="277"><marquee scrollamount="2"><%=username%>，欢迎您！祝你购物愉快！
    </marquee></td>
	<%
	}
	%>
    <td width="55" align="right"><a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&touid=%E9%99%88%E8%8A%9D%E5%A6%AE&siteid=cntaobao&status=2&charset=utf-8"><img border="0" src="http://amos.alicdn.com/online.aw?v=2&uid=%E9%99%88%E8%8A%9D%E5%A6%AE&site=cntaobao&s=2&charset=utf-8" alt="点这里给我发消息" /></a>犀利哥</td>
    <td width="54" align="right"><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=862164018&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:862164018:45 &r=0.4317254757042974" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
恋空</td>
  </tr>
</table>
 <div id="logo">
   <div align="left">
     <p>&nbsp;</p>
     <p><a href="#"><img src="images/top1.jpg" width="254" height="38" /></a> </p>
   </div>
   <div class="right_head"></div>
 </div>
<div id="mk01">
  <div id="header">
  <div class="banner">
    <div class="tabbar">
      <div class="tabs">
        <div class="float_icon">新</div>
        <p><a href="index.jsp" title="首 页" class="actived" style="margin-left:0;padding-left:0;"> 首页</a> <a href="index.jsp?id=2" title="关于我们">全部商品</a> <a href="index.jsp?id=3" title="新上架">新上架</a> <a href="index.jsp?id=4" title="特价商品">特价商品</a> <a href="account.jsp" title="账户管理">账户管理</a> <a href="index.jsp?id=7&amp;&amp;goodsName=<%=goodsName%>" title="交流区">信用评价</a> </p>
        <p><a href="contact.jsp" title="联系我们">联系我们</a> </p>
      </div>
	  
      <div class="bg">
        <div class="nw"></div>
        <div class="cen"></div>
        <div class="cen"></div>
        <div class="cen"></div>
        <div class="cen"></div>
        <div class="cen"></div>
        <div class="ne"></div>
      </div>
    </div>
  </div>
  <p>&nbsp;</p>
  <div class="bar"></div>
  <div id="Layer1">
          <div id="header_right">
            <ul id="language">
                <li><a></a></li>
                <li><a></a></li>
                <li><a></a></li>
            </ul>
            <div class="cleaner"></div>
            <div id="templatemo_search">
                <form action="index.jsp?id=5" method="post">
                  <input type="text" value="输入要查询的商品……"   name="cx" id="cx" title="keyword" onblur="if(this.value == '') { this.value = '输入要查询的商品……'; }" onfocus="if(this.value == '输入要查询的商品……') { this.value = ''; }" class="txt_field" />
                  <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
              </form>
            </div>
    </div></div>
</div>  	 
</div>   
</body>
</html>
