<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body>
<%
connDB conn=new connDB();
String p=request.getParameter("page");
if(request.getParameter("ID")!=""){
	
	//此处有代码删除
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_order set IsEnforce=1 where orderID="+ID;
	int ret=0;
	String str="ordermanage.jsp?Page="+p;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		//out.println("<script language='javascript'>alert('订单执行成功！');window.location.href='ordermanage.jsp';</script>");
		out.println("<script language='javascript'>alert('订单执行成功！');</script>");
		response.sendRedirect("index.jsp?id=3");
		
		}else{
		out.println("<script language='javascript'>alert('订单执行失败！');window.location.href='index.jsp?id=3';</script>");
	}
}
%>

</body>
</html>
