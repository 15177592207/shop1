<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>

<%
connDB conn=new connDB();
chStr chStr=new chStr();
String id=request.getParameter("ID");
ResultSet rs=conn.executeQuery("select * from tb_BBS where BBSID="+id);
rs.next();
String title=rs.getString("BBSTitle");
String content=rs.getString("BBSContent");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div id="mk04">
<h4 class="heading"><%=title%></h4>
<table width="349" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="349"><%=content%></td>
  </tr>
</table>
<%conn.close();%>
</div>
</body>
</html>
