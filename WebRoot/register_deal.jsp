<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.dao.MemberDaoImpl"%>
<%@ page import="com.wgh.DB.chStr"%>
<jsp:useBean id="member" scope="request" class="commerce.member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<html>
	<head>
		<title>用户注册成功!</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

	</head>

	<body>
		<%
			connDB conn = new connDB();
			chStr chStr = new chStr();
			request.setCharacterEncoding("gb2312");
			String username = chStr.chStr(request.getParameter("memberName"));
			if (username.equals("")) {
				out
						.print("<script>alert('用户名不能为空！请重新注册！');document.location='register.jsp';</script>");
			}
			ResultSet rs = conn
					.executeQuery("select * from tb_member where MemberName='"
							+ username + "'");
			if (rs.next()) {
				out
						.println("<script language='javascript'>alert('该用户名已经存在，请重新注册！');window.location.href='register.jsp';</script>");
			} else {
				int ret = 0;
				MemberDaoImpl ins_member = new MemberDaoImpl();
				ret = ins_member.insert(member);
				if (ret != 0) {
					out
							.println("<script language='javascript'>alert('用户注册成功！');window.location.href='index.jsp';</script>");
				} else {
					out
							.println("<script language='javascript'>alert('用户注册失败！');window.location.href='register.jsp';</script>");
				}
			}
		%>
	</body>
</html>
