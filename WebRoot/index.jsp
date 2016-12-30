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
  <script type="text/javascript" language="javascript">
 
    //加入收藏
 
        function AddFavorite(sURL, sTitle) {
 
            sURL = encodeURI(sURL); 
        try{   
 
            window.external.addFavorite(sURL, sTitle);   
 
        }catch(e) {   
 
            try{   
 
                window.sidebar.addPanel(sTitle, sURL, "");   
 
            }catch (e) {   
 
                alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
 
            }   
 
        }
 
    }
 
    //设为首页
 
    function setHome(url){
 
        if (document.all) {
 
            document.body.style.behavior='url(#default#homepage)';
 
               document.body.setHomePage(url);
 
        }else{
 
            alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
 
        }
 

    }
 
   function sharetofb(url){
 
       window.open("http://www.facebook.com/sharer.php?u=" + url);
 

    }
    
    function sharetowb(url){
 
       window.open("http://service.weibo.com/share/share.php?url=" + url+"&title="+url);
 

    }
  
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电子商城首页</title>
</head>

<body>
<div id="wrapper_sec">
  <div><jsp:include page="index_navigation.jsp"/></div>


<div id="crumb">
    	<ul class="breadcrumb">
        	<li>我的位置</li>
            <li class="last"><a href="#">首页</a></li>
            
         <li> <a onclick="SetHome(window.location)" href="javascript:void(0)">设为首页</a> </li>
         <li> <a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">加入收藏</a></li>
 
			
        </ul>
        <ul class="network">
        
 
    
      
        
        	<li>分享:</li>
            <li><a href="#"><img src="images/twitter.gif" alt="" /></a></li>
            <li><a href="#"><img src="images/delicious.gif"  alt="" /></a></li>
            <li><a href="#"><img src="images/blogger.gif" alt="" /></a></li>
            <li><a href="javascript:void(0)" onclick="sharetofb(window.location.href)"><img src="images/facebook.gif" alt="" /></a></li>
             <li><a onclick="sharetowb(window.location.href)" href="javascript:void(0)"><img src="images/wb.png" style="width: 15px"; alt="" /></a></li>
        </ul>
    </div>
	
<div><jsp:include page="index_left.jsp"/></div>
<div class="col2"><jsp:include page="index_right.jsp"/></div>
<%
  
String s=request.getParameter("id");
if(s==null)
s="1";
int choice=Integer.parseInt(s);
switch(choice){
case 1:
%>
<div class="col2"><jsp:include page="goods_sort.jsp"/></div>
 <%
break;
case 2:
%>
<div class="col2"><jsp:include page="goods_all.jsp"/></div>
<%
break;
case 3:
%>
<div class="col2"><jsp:include page="goods_new.jsp"/></div>
<%
break;
case 4:
%>
<div class="col2"><jsp:include page="goods_sale.jsp"/></div>
<%
break;
case 5:
%>
<div class="col2"><jsp:include page="search_head_deal.jsp"/></div>
<%
break;
case 6:
%>
<div class="col2"><jsp:include page="search_deal.jsp"/></div>
<%
break;
case 7:
%>
<div class="col2"><jsp:include page="comments_view.jsp"/></div>
<%
break;
case 8:
%>
<div class="col2"><jsp:include page="placard_see.jsp"/></div>
 <%
break;
}
%>
</div>
<div class="clear"></div>
<!-- Footer -->
<div id="footer">
	<!-- Inner Footer Contents -->
<jsp:include page="copyright.jsp"/>	
</div>
</body>
</html>
