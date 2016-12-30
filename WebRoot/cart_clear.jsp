<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*"%>
<%
session.removeAttribute("cart");
response.sendRedirect("cart_null.jsp");
%>
