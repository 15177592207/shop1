<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
String username="";
username=(String)session.getAttribute("username");
if(username=="" || username==null){
	out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
}else{
    
    String orderID=request.getParameter("orderID");	
	String pl=new String(request.getParameter("pl").getBytes("iso-8859-1"));
	connDB conn=new connDB();
	ResultSet rs=conn.executeQuery("select * from V_order_detail where orderID='"+orderID+"'");
	rs.next();
	
	
	int goodsID=rs.getInt("goodsID");
	String GoodsName=rs.getString("GoodsName");
	float price=rs.getFloat("price");
	
	int number=rs.getInt("number"); 
	
	conn.executeUpdate("insert tb_comment(CommentName,OrderID,GoodsID,price,number,CommentCotent,GoodsName) values('"+username+"','"+orderID+"','"+goodsID+"','"+price+"','"+number+"','"+pl+"','"+GoodsName+"')");
	
	conn.executeUpdate("update tb_order set IsComments=1 where orderID="+orderID);
	
	out.print("<script>alert('评论成功！');document.location='account.jsp';</script>");
	conn.executeUpdate("update Tb_goods set Sold_total=Sold_total+1 where GoodsName='"+GoodsName+"' ");
	}
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>

</body>
</html>
