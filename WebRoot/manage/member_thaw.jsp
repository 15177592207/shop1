<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>





<%
connDB conn=new connDB();

if(request.getParameter("ID")!=""){

	//此处有代码删除
	int  ID =Integer.parseInt(request.getParameter("ID"));

	String sql = "update  Tb_member set MemberFreeze=0 where MemberID = "+ ID;
	int ret = 0;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('该会员信息已经被成功解冻！');window.location.href='index.jsp?id=2';</script>");
		}else{
		out.println("<script language='javascript'>alert('操作失败！');window.location.href='index.jsp?id=2';</script>");
	}
}
%>

