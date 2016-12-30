<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>

<%
connDB conn=new connDB();
chStr chStr=new chStr();
String hf=new String(request.getParameter("hf").getBytes("iso-8859-1"));

String orderID=request.getParameter("orderID");

conn.executeUpdate("update Tb_comment set CommentReply="+"'"+hf+"' where orderID="+orderID);
out.print("<script>alert('»Ø¸´³É¹¦£¡');document.location='index.jsp?id=18';</script>");
//response.sendRedirect("index.jsp?id=18");
%>