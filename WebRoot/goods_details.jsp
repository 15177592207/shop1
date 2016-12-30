<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
chStr chStr=new chStr();
connDB conn=new connDB();
int ID=Integer.parseInt(request.getParameter("id"));
String sql="select * from tb_goods where GoodsID="+ID;
ResultSet rs=conn.executeQuery(sql);
if(rs.next()){
	String goodsName=rs.getString("goodsName");
	String type=rs.getString("GoodsType");
	String introduce=rs.getString("GoodsIntroduce");
	float nowPrice=rs.getFloat("GoodsNowPrice");
	int hit=rs.getInt("GoodsHit");
	int hitadd=hit+1;
	conn.executeUpdate("update tb_goods set GoodsHit='"+hitadd+"' where goodsID="+ID);
	String picture1=rs.getString("GoodsPicture1");
	String picture2=rs.getString("GoodsPicture2");
	String picture3=rs.getString("GoodsPicture3");
	String picture4=rs.getString("GoodsPicture4");
	String picture5=rs.getString("GoodsPicture5");
	String picture6=rs.getString("GoodsPicture6");
	if(introduce.length()>26){
	introduce=introduce.substring(0,26);
	}
ResultSet rs_new=conn.executeQuery("select top 4 GoodsID,GoodsName,GoodsNowPrice,GoodsType,GoodsIntroduce,GoodsPicture from tb_goods where IsNew=1 order by GoodsINTime desc");
int new_ID=0;
String new_goodsname="";
float new_nowprice=0;
String new_leixin="";
String new_introduce="";
String new_picture="";	
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

<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000;
	font-size: 18px;
}
-->
</style>
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
<div class="col2">
     
    <!-- Column2 Section -->
        <div class="col2">
        	<h4 class="heading"><%=goodsName%></h4>
            <!-- Product Detail -->
            <div class="prod_detail">
            	<div class="big_thumb">
                	<div id="gallery" class="ad-gallery">
                      <div class="ad-image-wrapper">
                      </div>
                      <div class="ad-nav">
                        <div class="ad-thumbs">
                          <ul class="ad-thumb-list">
                            <li>
                              <a href="images/<%=picture1%>">
                                <img src="images/<%=picture1%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture2%>">
                                <img src="images/<%=picture2%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture3%>">
                                <img src="images/<%=picture3%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture4%>">
                                <img src="images/<%=picture4%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture5%>">
                                <img src="images/<%=picture5%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture1%>">
                                <img src="images/<%=picture1%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                            <li>
                              <a href="images/<%=picture2%>">
                                <img src="images/<%=picture2%>" alt="" class="image0" width="42" height="42" />
                              </a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </div>
                </div>
                <div class="desc">
                	<div class="quickreview">
                    	<a href="#" class="bold black left"><u><%=introduce%></u></a>
                        <div class="clear"></div>
                        <p class="avail"><span class="bold">货号: </span>2805-002</p>
                        <div class="clear"></div>
                        <br />
                        <h6 class="colr">简单说明</h6>
                        <p>简称：<%=introduce%></p>
                        <p>组合形式: 单件&nbsp;&nbsp;&nbsp;款式: 流行 &nbsp;&nbsp;&nbsp;板型: 绿色型</p>
                        <p>
                        颜色分类: 白色 浅灰色实物要深些 粉色 黄绿 深桃红 黑色 紫罗兰 墨绿 橙色 玫红色 深灰实物要深些 大红 黄色 鲜绿 宝石蓝 酒红色（深红色）
                        </p>
                        <p>类型：<%=type%></p>
                    </div>
                    <div class="addtocartsec">
                    	<h5 class="bold"><span class="STYLE1"><%=nowPrice%></span>元</h5>
                        <ul class="margn addicons">
                            <li>
                            	<a href="#">收藏</a>
                            </li>
                            <li>
							<form action="index.jsp?id=7" method="post" name="f"><input name="goodsName" type="hidden" value="<%=goodsName%>" /><input name="" type="submit" value="查看评论" />
							</form>
                            	                    	</li>
                        </ul>
                        <ul class="left qt">
                   	    	<li class="bold qty">数量</li>
							<form id="form1" name="add" method="post" action="cart_add.jsp?goodsID=<%=ID%>">
                            <li><input name="n" type="text" class="bar" id="n" />
                            </li>
                            <li><a href="#" class="simplebtndrk" onclick="add.submit()"><span>添加到购物车</span></a></li>
							</form>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="prod_desc">
                	<div class="cont_sec">
                        <h4 class="heading">详细描述</h4>
                        <p>
                        <img src="images/<%=picture6%>"  width="700" height="1381"/>                        </p>
                    </div>
                </div>
            </div>
            <div class="listings">
            	<h4 class="heading">您可能感兴趣</h4>
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
						<%if (session.getAttribute("username")!=null && session.getAttribute("username")!=""){%>
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
					<%}%>
                   
              </ul>
            </div>
            <div class="clear"></div>
        </div>
    </div></div>
	<div class="clear"></div>
<!-- Footer -->
<div id="footer">
	<!-- Inner Footer Contents -->
<jsp:include page="copyright.jsp"/>	
</div>
</body>
</html>
<%
}conn.close();
%>
