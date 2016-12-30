<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
String ID=request.getParameter("ID");
connDB conn=new connDB();
conn.executeUpdate("delete from Tb_picture where PictureID="+ID);
response.sendRedirect("index.jsp?id=15");
%>
