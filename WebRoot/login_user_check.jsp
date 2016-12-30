<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.wgh.DB.MD5"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>


		<title>登录提示</title>



	</head>

	<body>
		<%
			connDB conn = new connDB();
			chStr chStr = new chStr();
             MD5 md = new MD5();
			String username = chStr.chStr(request.getParameter("username"));

			try {
				ResultSet rs = conn
						.executeQuery("select * from tb_Member where MemberName='"
								+ username + "'and Memberfreeze=0");
				
				if (rs.next()) {
				  // md.getMD5ofStr(chStr.chStr(m.getMemberPWD()))
					String PWD = md.getMD5ofStr(request.getParameter("pwd"));
					if (PWD.equals(rs.getString("MemberPWD"))) {
						session.setAttribute("username", username);
						response.sendRedirect("index.jsp");

					} else {
						out
								.println("<script langauage='javascript'>alert('您输入的用户名或密码错误，请与管理员联系！');window.location.href='index.jsp';</script>");
					}
				}else{
					out.println("<script langauage='javascript'>alert('您输入的用户名或密码错误，或您的账户已经被冻结，请与管理员联系！');window.location.href='index.jsp';</script>");
				}

			} catch (Exception e) {
				out.println("<script langauage='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
			}
			
			conn.close();
		%>
	</body>
</html>
