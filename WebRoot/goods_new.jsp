<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs_new=conn.executeQuery("select * from V_goods where isNew=1");
int new_ID=0;
String new_goodsname="";
float new_nowprice=0;
String new_leixin="";
String new_introduce="";
String new_picture="";

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
            	<h4 class="heading">新品上市</h4>
				<ul>
				  <%
				  while (rs_new.next()){
					  new_ID=rs_new.getInt("GoodsID");
					  new_goodsname=rs_new.getString("goodsName");
					new_nowprice=rs_new.getFloat("GoodsNowPrice");
					new_leixin=rs_new.getString("GoodsType");
					new_introduce=rs_new.getString("GoodsIntroduce");
					new_picture=rs_new.getString("GoodsPicture");
				  	if(new_introduce.length()>10){
	                new_introduce=new_introduce.substring(0,8)+"...";
	                } 
				  %>
				  
            	
                	<li>
                    	<a href="goods_details.jsp?id=<%=new_ID%>" class="thumb"><img src="images/<%=new_picture%>" alt="" width="154" height="129" /></a><br />
                        <a href="goods_details.jsp?id=<%=new_ID%>" class="colr bold title"><%=new_goodsname%></a>    
                        <a href="#" class="addwish clear"><%=new_leixin%></a><br />
                        <a href="#" class="addwish"><%=new_introduce%></a><br />
                        <div class="clear"></div>
                        <p class="left price">￥<%=new_nowprice%></p>
						<%if (username!=null && username!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=new_ID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=new_ID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
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
