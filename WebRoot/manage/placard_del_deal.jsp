<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.DB.connDB"%>

<%
	//此处有代码删除
connDB conn=new connDB();
String ID[]=request.getParameterValues("delid");
String bbsID="";

if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		bbsID=bbsID+ID[i]+",";
	}
	bbsID=bbsID.substring(0,bbsID.length()-1);
	int ret=-1;
		//此处有代码删除
		String sql="Delete From tb_BBS Where BBSID in("+bbsID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('公告信息删除失败!');window.location.href='index.jsp?id=4';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('公告信息删除成功!');window.location.href='index.jsp?id=4';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='placardmanage.jsp';</script>");
}
%>
