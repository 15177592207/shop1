<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<%@ page import="com.wgh.dao.SuperTypeDaoImpl"%>
<jsp:useBean id="SuperType" scope="page" class="commerce.SuperType">
<jsp:setProperty name="SuperType" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.wgh.DB.chStr"/>
<jsp:useBean id="conn" scope="page" class="com.wgh.DB.connDB"/>

<%
String typename=chStr.chStr(SuperType.gettypename());
ResultSet rs=conn.executeQuery("select * from tb_superType where typename='"+typename+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该大分类信息已经添加，请添加新的大分类信息！');window.location.href='super_add.jsp';</script>");
}else{
	int ret=0;
        SuperTypeDaoImpl ins_SuperType=new SuperTypeDaoImpl();
        ret=ins_SuperType.insert(SuperType);
	if (ret!=0){
          out.println("<script language='javascript'>alert('大分类信息添加成功！');window.location.href='index.jsp?id=5';</script>");
        }else{
          out.println("<script language='javascript'>alert('大分类信息添加失败！');window.location.href='index.jsp?id=6';</script>");
        }
}
%>