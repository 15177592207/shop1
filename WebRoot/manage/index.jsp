<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理</title>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
</head>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
	float: left;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(images/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
#all div left {
	float: left;
	width: 200px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	position: relative;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
}
</style>
<body><%
if(session.getAttribute("manager")==null){
out.print("<script>alert('请先登录！');document.location='Login_M.jsp';</script>");
}%>
<div id="all">
  <div><table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="99%" valign="top"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="74%" height="38" class="admin_txt"><img src="images/thaw.gif" width="15" height="15" />管理员
		<%=session.getAttribute("manager")%>： 您好,感谢登陆使用！　<img src="images/back.gif" width="16" height="16" /><a href="logout_admin.jsp">退出</a></td>
        <td width="22%"><a href="#" target="_self" onClick="logout();"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table></div>

  <div><img src="images/top2.jpg" /></div>
  <div id="container"><jsp:include page="index_left.jsp" />
  </div>
  <%
  
String s=request.getParameter("id");
if(s==null)
s="1";
int choice=Integer.parseInt(s);
switch(choice){
case 1:
%>
  <div id="container2"><jsp:include page="index_right.jsp" /></div>
<%
break;
case 2:
%>
<div id="container2"><jsp:include page="member_manage.jsp" /></div>
<%
break;
case 3:
%>
<div id="container2"><jsp:include page="order_manage.jsp" /></div>
<%
break;
case 4:
%>
<div id="container2"><jsp:include page="placard_manage.jsp" /></div>
<%
break;
case 5:
%>
<div id="container2"><jsp:include page="superType.jsp" /></div>
<%
break;
case 6:
%>
<div id="container2"><jsp:include page="super_add.jsp" /></div>
<%
break;
case 7:
%>
<div id="container2"><jsp:include page="subType.jsp" /></div>
<%
break;
case 8:
%>
<div id="container2"><jsp:include page="sub_add.jsp" /></div>
<%
break;
case 9:
%>
<div id="container2"><jsp:include page="goods_add.jsp" /></div>
<%
break;
case 10:
%>
<div id="container2"><jsp:include page="goods_modify.jsp" /></div>
<%
break;
case 11:
%>
<div id="container2"><jsp:include page="goods_del.jsp" /></div>
<%
break;
case 12:
%>
<div id="container2"><jsp:include page="placard_add.jsp" /></div>


<%
break;
case 15:
%>
<div id="container2"><jsp:include page="picture_space.jsp" /></div>
<%
break;
case 16:
%>
<div id="container2"><jsp:include page="goods_show.jsp" /></div>

<%
break;
case 18:
%>
<div id="container2"><jsp:include page="comment_manage.jsp" /></div>
<%
break;
case 19:
%>
<div id="container2"><jsp:include page="comment_reply.jsp" /></div>
  <%
break;
}
%>
  
</body>
</html>
