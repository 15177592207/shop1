<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs_te=conn.executeQuery("select * from V_goods where isSale=1");
int te_ID=0;
String te_goodsname="";
float te_nowprice=0;
String te_leixin="";
String te_introduce="";
String te_picture="";

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
            	<h4 class="heading">特价商品</h4>
				<ul>
				  <%
				  while (rs_te.next()){
					te_ID=rs_te.getInt("GoodsID");
					te_goodsname=rs_te.getString("goodsName");
					te_nowprice=rs_te.getFloat("GoodsNowPrice");
					te_leixin=rs_te.getString("GoodsType");
					te_introduce=rs_te.getString("GoodsIntroduce");
					te_picture=rs_te.getString("GoodsPicture");
				  	if(te_introduce.length()>10){
	                te_introduce=te_introduce.substring(0,8)+"...";
	                } 
				  %>
				  
            	
                	<li>
                    	<a href="goods_details.jsp?id=<%=te_ID%>" class="thumb"><img src="images/<%=te_picture%>" alt="" width="154" height="129" /></a><br />
                        <a href="goods_details.jsp?id=<%=te_ID%>" class="colr bold title"><%=te_goodsname%></a>    
                        <a href="#" class="addwish clear"><%=te_leixin%></a><br />
                        <a href="#" class="addwish"><%=te_introduce%></a><br />
                        <div class="clear"></div>
                        <p class="left price">￥<%=te_nowprice%></p>
						<%if (username!=null && username!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=te_ID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=te_ID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
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
