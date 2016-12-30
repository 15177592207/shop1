<%@ page contentType="image/jpeg" import="com.wgh.dao.*" %>
<%
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);
VerifyCode vc = new VerifyCode(response);
String rand =vc.createRandImage();
session.setAttribute("rand",rand);
%> 