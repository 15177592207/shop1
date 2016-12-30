<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>

<%
connDB conn=new connDB();

if(request.getParameter("ID")!=""){
	int  ID =Integer.parseInt(request.getParameter("ID"));

	//此处有代码删除	
	String sql = "update  Tb_member set MemberFreeze=1 where MemberID = "+ ID;
	int ret = 0;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('该会员信息已经被冻结！');window.location.href='index.jsp?id=2';</script>");
		}else{
		out.println("<script language='javascript'>alert('操作失败！');window.location.href='index.jsp?id=2';</script>");
	}
}
%>
