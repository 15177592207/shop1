<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
String orderID=request.getParameter("orderID");
connDB conn=new connDB();
conn.executeUpdate("delete from Tb_comment where orderID="+orderID);
response.sendRedirect("index.jsp?id=18");
%>
