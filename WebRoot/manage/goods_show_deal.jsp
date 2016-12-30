<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String name=chStr.chStr(request.getParameter("goodsname"));
ResultSet rs=conn.executeQuery("select * from tb_goods where GoodsName='"+name+"'");
int goodsID=0;
String goodsname="";
String picture1="";
String picture2="";
String picture3="";
String picture4="";
if(rs.next()){
goodsID=rs.getInt("GoodsID");
goodsname=rs.getString("GoodsName");
picture1=rs.getString("GoodsPicture1");
picture2=rs.getString("GoodsPicture2");
picture3=rs.getString("GoodsPicture3");
picture4=rs.getString("GoodsPicture4");
}
conn.executeUpdate("update Tb_picture_show set GoodsID="+"'"+goodsID+"',GoodsName="+"'"+goodsname+"',GoodsPicture="+"'"+picture1+"',GoodsPicture1="+"'"+picture2+"',GoodsPicture2="+"'"+picture3+"',GoodsPicture3="+"'"+picture4+"' where ID=1 ");
conn.close();
out.print("<script>alert('ÐÞ¸Ä³É¹¦£¡');document.location='index.jsp?id=16';</script>");

%>
