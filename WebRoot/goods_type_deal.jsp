<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
String type="";
type=request.getParameter("Type");
String sql_r="";
if(type.equals("null") || type.equals("")){
	out.println("<script language='javascript'>alert('您的操作有误');window.location.href='index.jsp'</script>");
}else{
	ResultSet rs_r=conn.executeQuery("select * from V_goods where subID="+type);
	int num=0;
    int ID=0;
    String goodsName="";
    float nowprice=0;
    String leixin="";
    String introduce="";
    String picture="";
	String subTypename="";
	String superTypename="";
	ResultSet rs_type=conn.executeQuery("select * from V_type where subID="+type);
	if(rs_type.next()){
		superTypename=rs_type.getString(2);
		subTypename=rs_type.getString(3);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- // Stylesheets // -->
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/default.advanced.css" />
<link rel="stylesheet" type="text/css" href="css/contentslider.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.fancybox-1.3.1.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.ad-gallery.css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider-styles.css" />
<link rel="stylesheet" type="text/css" href="Home.css" />
<!-- // Javascript // -->
<script type="text/javascript" src="js/jquery.min132.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.1.js"></script>
<script type="text/javascript" src="js/contentslider.js"></script>
<script type="text/javascript" src="js/ddaccordion.js"></script>
<script type="text/javascript" src="js/acordn.js"></script>
<script type="text/javascript" src="js/jquery.min14.js"></script>
<script type="text/javascript" src="js/jquery.ad-gallery.js"></script>
<script type="text/javascript" src="js/thumbgallery.js"></script>
<script type="text/javascript" src="js/jquery.fancybox-1.3.1.js"></script>
<script type="text/javascript" src="js/coin-slider.js"></script>

<script type="text/javascript" src="js/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="js/scroll.js"></script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div id="wrapper_sec">
  <div><jsp:include page="index_navigation.jsp"/></div>


<div id="mk02"><div id="crumb">
    	<ul class="breadcrumb">
        	<li>我的位置</li>
            <li class="last"><a href="#">首页</a></li>
        </ul>
        <ul class="network">
        	<li>分享:</li>
            <li><a href="#"><img src="images/twitter.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/delicious.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/blogger.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/facebook.gif" alt="" /></a></li>
        </ul>
    </div></div>
<div><jsp:include page="index_left.jsp"/></div>
<div class="col2"><jsp:include page="index_right.jsp"/></div>
<div class="col2"><div id="mk04">
           <div class="listings">	
	
            	<h4 class="heading"><%=superTypename%>(<%=subTypename%>)</h4></td>
							  	  
				<ul>

					  <%
	while(rs_r.next()){
	ID=rs_r.getInt("GoodsID");
	goodsName=rs_r.getString("goodsName");
	introduce=rs_r.getString("GoodsIntroduce");
	nowprice=rs_r.getFloat("GoodsNowPrice");
	picture=rs_r.getString("GoodsPicture");
	leixin=rs_r.getString("GoodsType");
	
	if(introduce.length()>10){
	  introduce=introduce.substring(0,10)+"...";
	}
	%>
				  
				 
            	
                	<li>
                    	<a href="goods_details.jsp?id=<%=ID%>" class="thumb"><img src="images/<%=picture%>" alt="" width="154" height="129" /></a><br />
                        <a href="goods_details.jsp?id=<%=ID%>" class="colr bold title"><%=goodsName%></a>    
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
			 </ul></div>
</div>
</div>
</div>
<div class="clear"></div>
<!-- Footer -->
<div id="footer">
	<!-- Inner Footer Contents -->
<jsp:include page="copyright.jsp"/>	
</div>
</body>
</html>
<%conn.close();}%>