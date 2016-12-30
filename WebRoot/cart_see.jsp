<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%@ page import="commerce.goodselement"%>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
	String username = "";
	username = (String) session.getAttribute("username");
	if (username == "" || username == null) {
		out
				.println("<script langauage='javascript'>alert('请先登录！');window.location.href='login_user.html';</script>");
	} else {
		chStr chStr = new chStr();
		connDB conn = new connDB();
		Vector cart = (Vector) session.getAttribute("cart");
		if (cart == null || cart.size() == 0) {
			response.sendRedirect("cart_null.jsp");
		} else {
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- // Stylesheets // -->
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/styleadd.css" />
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

	

<html>
	<head>


		<title>查看购物车</title>



	</head>

	<body>

		<div id="wrapper_sec">
  <div><jsp:include page="index_navigation.jsp"/></div>


<div id="mk02"><div id="crumb">
    	<ul class="breadcrumb">
        	<li>我的位置</li>
            <li class="last"><a href="#">购物车</a></li>
        </ul>
        <ul class="network">
        	<li>分享:</li>
            <li><a href="#"><img src="images/twitter.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/delicious.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/blogger.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/facebook.gif" alt="" /></a></li>
        </ul>
    </div></div>

			<div id="content_sec">
			<form method="post" action="cart_modify.jsp" name="form1">
			<div>
			<div id="content_sec">
    		<div class="col3">
        	<h2 class="heading">购物车</h2>
        	<div class="shoppingcart">
            	<ul class="tablehead">
                	<li class="remove">移除</li>
                    <li class="thumb">详情</li>
                    <li class="title">产品名称</li>
                    <li class="price">单价</li>
                    <li class="qty">数量</li>
                    <li class="total">金额</li>
                </ul>
			<%
			float sum=0;
			int ID=-1;
			String goodsname="";
			for(int i=0;i<cart.size();i++){
			goodselement goodsitem=(goodselement)cart.elementAt(i);
			sum=sum+goodsitem.number*goodsitem.goodsNowprice;
			ID=goodsitem.goodsID;
			if (ID>0){
				ResultSet rs_goods=conn.executeQuery("select * from tb_goods where goodsID="+ID);
				if (rs_goods.next()){
					goodsname=rs_goods.getString("goodsname");
					
				}
			}
				%>
				 <ul class="cartlist">
                	<li class="remove txt"><a href="cart_move.jsp?ID=<%=i%>"><img src="images/delete.gif" alt="" /></a></li>
                    <li class="thumb"><a href="goods_details.jsp?id=<%=ID%>">查看</a></li>
                    <li class="title txt"><a href="detail.html"><%=goodsname%></a></li>
                    <li class="price txt">￥<%=goodsitem.goodsNowprice%></li>
                    <li class="qty"><input name="num<%=i%>" size="7" type="text" class="txt_grey" value="<%=goodsitem.number%>" onBlur="check(this.form)"></li>
                    <li class="total txt">￥<%=(goodsitem.goodsNowprice*goodsitem.number)%></li>
                </ul>
				  <script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("请不要输入非法字符");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("请输入修改的数量");myform.num<%=i%>.focus();return;}	
				myform.submit();
			}
			-->
		</script>
                <%
				}
				%>
				<ul class="cartlist">
                	<li class="remove txt"></li>
                    <li class="thumb"></li>
                    <li class="title txt"></li>
                    <li class="price txt"></li>
                    <li class="qty"></li>
                    <li class="total txt">合计总金额：￥<%=sum%></li>
                </ul>
				<ul class="cartlist">
                	<li class="thumb"><a href="index.jsp">继续购物</a>|</li>
                    <li class="thumb"><a href="cart_checkout.jsp">去收银台结账</a>|</li>
                    <li class="thumb"><a href="cart_clear.jsp">清空购物车</a> |</li>
                    <li class="thumb"><a href="#">修改数量</a></li>                   
                </ul>
                </div>
                </div>
                </div>
                
			
			
			</form>
			
		</div>
	</body>
</html>
<%
conn.close();}}

%>