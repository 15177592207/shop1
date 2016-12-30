<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
ResultSet rs_new=conn.executeQuery("select top 4 GoodsID,GoodsName,GoodsNowPrice,GoodsType,GoodsIntroduce,GoodsPicture from tb_goods where IsNew=1 order by GoodsINTime desc");
int new_ID=0;
String new_goodsname="";
float new_nowprice=0;
String new_leixin="";
String new_introduce="";
String new_picture="";
ResultSet rs_re=conn.executeQuery("select top 4 GoodsID,GoodsName,GoodsNowPrice,GoodsType,GoodsIntroduce,GoodsPicture from tb_goods where GoodsHit>1 order by GoodsINTime desc");
int re_ID=0;
String re_goodsname="";
float re_nowprice=0;
String re_leixin="";
String re_introduce="";
String re_picture="";
ResultSet rs_te=conn.executeQuery("select top 4 GoodsID,GoodsName,GoodsNowPrice,GoodsType,GoodsIntroduce,GoodsPicture from tb_goods where IsSale=1 order by GoodsINTime desc");
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
            	<h4 class="heading">新品上市</h4>
				<ul>
				  <%
				  while (rs_new.next()){
					new_ID=rs_new.getInt(1);
					new_goodsname=rs_new.getString(2);
					new_nowprice=rs_new.getFloat(3);
					new_leixin=rs_new.getString(4);
					new_introduce=rs_new.getString(5);
					new_picture=rs_new.getString(6);
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
            	<h4 class="heading">最热商品</h4>
				<ul>
				 <%while (rs_re.next()){
					re_ID=rs_re.getInt(1);
					re_goodsname=rs_re.getString(2);
					re_nowprice=rs_re.getFloat(3);
					re_leixin=rs_re.getString(4);
					re_introduce=rs_re.getString(5);
					re_picture=rs_re.getString(6);
				  		if(re_introduce.length()>10){
	                re_introduce=re_introduce.substring(0,8)+"...";
	                } 
				  %>
				
                	<li>
                    	<a href="goods_details.jsp?id=<%=re_ID%>" class="thumb"><img src="images/<%=re_picture%>" alt=""  width="154" height="129"/></a><br />
                        <a href="goods_details.jsp?id=<%=re_ID%>" class="colr bold title"><%=re_goodsname%></a>    
                        <a href="#" class="addwish clear"><%=re_leixin%></a><br />
                        <a href="#" class="addwish"><%=re_introduce%></a><br />
                        <div class="clear"></div>
                        <p class="left price">￥<%=re_nowprice%></p>
						<%if (username!=null && username!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=re_ID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=re_ID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
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
            	<h4 class="heading">特价商品</h4>
				<ul>
				 <%while (rs_te.next()){
					te_ID=rs_te.getInt(1);
					te_goodsname=rs_te.getString(2);
					te_nowprice=rs_te.getFloat(3);
					te_leixin=rs_te.getString(4);
					te_introduce=rs_te.getString(5);
					te_picture=rs_te.getString(6);
				  		if(te_introduce.length()>10){
	                te_introduce=te_introduce.substring(0,8)+"...";
	                } 
				  %>

                    <li>
                    	<a href="goods_details.jsp?id=<%=te_ID%>" class="thumb"><img src="images/<%=te_picture%>" alt="" width="154" height="129"/></a><br />
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
