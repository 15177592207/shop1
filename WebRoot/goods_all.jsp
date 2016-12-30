<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs=conn.executeQuery("select * from V_goods");
int ID=0;
String goodsname="";
float nowprice=0;
String leixin="";
String introduce="";
String picture="";
int num=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>
<div id="mk04">
           <div class="listings">
            	<h4 class="heading">全部商品</h4>
				<ul>
				  <%
				  while (rs.next()){
					ID=rs.getInt("GoodsID");
					goodsname=rs.getString("GoodsName");
					nowprice=rs.getFloat("GoodsNowPrice");
					leixin=rs.getString("GoodsType");
					introduce=rs.getString("GoodsIntroduce");
					picture=rs.getString("GoodsPicture");
					if(introduce.length()>10){
	                introduce=introduce.substring(0,8)+"...";
	                } 
				  	
				  %>
				  
            	
                	<li>
                    	<a href="goods_details.jsp?id=<%=ID%>" class="thumb"><img src="images/<%=picture%>" alt="" width="154" height="129" /></a><br />
                        <a href="goods_details.jsp?id=<%=ID%>" class="colr bold title"><%=goodsname%></a>    
                        <a href="#" class="addwish clear"><%=leixin%></a><br />
                        <a href="#" class="addwish"><%=introduce%></a><br />
                        <div class="clear"></div>
                        <p class="left price">￥<%=nowprice%></p>
						<%if (username!=null && username!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=ID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=ID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
						<%
						}
						%>
                  </li>
                    
					<%
					}
					%>
			 </ul>
            </div>
			<div class="listings">
            	<h4 class="heading"></h4>
				</div>
			</div>
</body>
</html>
