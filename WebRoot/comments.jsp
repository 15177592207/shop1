<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
String orderID=request.getParameter("orderID");	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<form id="form1" name="form1" method="post" action="comments_deal.jsp?orderID=<%=orderID%>">
  <table width="492" height="331" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="211"><label>
        <textarea name="pl" cols="70" rows="15" id="pl"></textarea>
      </label></td>
    </tr>
    
    <tr>
      <td height="120"><label>
        <input type="submit" name="Submit" value="评论" />
       　　　  
       <input type="reset" name="Submit2" value="重置" />
      </label></td>
    </tr>
  </table>
</form>
</body>
</html>
