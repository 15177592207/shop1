<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%@ page import="com.wgh.DB.chStr"%>

<%@ page import="com.wgh.DB.connDB"%>
<%@page import="java.sql.ResultSet"%>


<html>
	<head>

		<title>添加购物车</title>



	</head>

	<body>
		<%
			
chStr chStr=new chStr();
connDB conn=new connDB();
int ID=Integer.parseInt(request.getParameter("goodsID"));
String sql="select * from tb_goods where goodsID="+ID;
ResultSet rs=conn.executeQuery(sql);
float nowprice=0;
if(rs.next()){
	nowprice=rs.getFloat("GoodsNowPrice");
}
goodselement mygoodselement=new goodselement();
mygoodselement.goodsID=ID;
mygoodselement.goodsNowprice=nowprice;
mygoodselement.number=1;
boolean Flag=true;
Vector cart=(Vector)session.getAttribute("cart");
if(cart==null){
	cart=new Vector();
}else{
	for(int i=0;i<cart.size();i++){
		goodselement goodsitem=(goodselement)cart.elementAt(i);
		if(goodsitem.goodsID==mygoodselement.goodsID){  
			goodsitem.number++;
			cart.setElementAt(goodsitem,i);
			Flag=false;
		}
	}
}
if(Flag)cart.addElement(mygoodselement);
session.setAttribute("cart",cart);
conn.close();
response.sendRedirect("cart_see.jsp");
			
		%>
	</body>
</html>
