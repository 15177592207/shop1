<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
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
<div class="col2">
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="80"><div align="center"><img src="images/center_empty.gif" width="608" height="80" /></div></td>
          </tr>
            <tr valign="top">
              <td height="134" align="left"><table width="85%"  border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="24" colspan="2" align="center">&nbsp;</td>
                    </tr>
                    <tr>
                      <td width="48%" height="38" align="right" class="word_orange">您的购物车为空！</td>
                      <td width="52%" rowspan="3" align="right" valign="bottom"><img src="images/cart.gif" width="150" height="186"></td>
                    </tr>
                    <tr>
                      <td height="57" align="right"><input name="Button" type="button" class="btn_grey" value="我要购买商品！" onClick="window.location.href='index.jsp'"></td>
                    </tr>
                    <tr>
                      <td height="72" align="right">&nbsp;</td>
                    </tr>
                </table>
              </td>
            </tr>
            <tr>
              <td height="38" align="right"><div align="center"><img src="images/center02.gif" /><a href="sale.jsp"><br>
                <br>
              </a></div></td>
          </tr>
      </table></div>
</div>
</body>
</html>
