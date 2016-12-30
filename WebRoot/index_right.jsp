<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
ResultSet rs_bbs=conn.executeQuery("select top 5 * from tb_bbs order by BBSUpdatetime desc");
ResultSet rs_sort=conn.executeQuery("select top 10 GoodsID,GoodsName, sum(number) as sumNum from V_order_detail group by GoodsName,GoodsID order by sumNum desc");
ResultSet rs=conn.executeQuery("select * from tb_picture_show");
int ID=0;
String picture1="";
String picture2="";
String picture3="";
String picture4="";
while(rs.next()){
ID=rs.getInt("GoodsID");
picture1=rs.getString("GoodsPicture");
picture2=rs.getString("GoodsPicture1");
picture3=rs.getString("GoodsPicture2");
picture4=rs.getString("GoodsPicture3");
}
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
/* Reset style */
* { margin:0; padding:0; word-break:break-all; }
body { background:#FFF; color:#333; font:12px/1.6em Helvetica, Arial, sans-serif; }
h1, h2, h3, h4, h5, h6 { font-size:1em; }
a { color:#039; text-decoration:none; }
 a:hover { text-decoration:underline; }
ul, li { list-style:none; }
fieldset, img { border:none; }
em, strong, cite, th { font-style:normal; font-weight:normal; }
/* Focus_change style */
#focus_change { position:relative; width:450px; height:295px; overflow:hidden; margin:0px; }
 #focus_change_list { position:absolute; width:1800px; height:295px; }
  #focus_change_list li { float:left; }
  #focus_change_list li img { width:450px; height:295px; }
 .focus_change_opacity { position:absolute; width:450px; height:70px; top:225px; left:0; background:#000; filter:alpha(opacity=50); -moz-opacity:0.5; opacity: 0.5; }
 #focus_change_btn { position:absolute; width:450px; height:65px; top:225px; left:0; }
  #focus_change_btn ul { padding-left:5px; }
  #focus_change_btn li { display:inline; float:left; margin:0 15px; padding-top:12px; }
  #focus_change_btn li img { width:76px; height:50px; border:2px solid #888; }
  #focus_change_btn .current { background:url(http://www.zzsky.cn/effect/images/icon_arrow.gif) no-repeat 37px 8px;}
  #focus_change_btn .current img { border-color:#EEE; }
</style>
<script type="text/javascript">
function $(id) { return document.getElementById(id); }
function moveElement(elementID,final_x,final_y,interval) {
  if (!document.getElementById) return false;
  if (!document.getElementById(elementID)) return false;
  var elem = document.getElementById(elementID);
  if (elem.movement) {
    clearTimeout(elem.movement);
  }
  if (!elem.style.left) {
    elem.style.left = "0px";
  }
  if (!elem.style.top) {
    elem.style.top = "0px";
  }
  var xpos = parseInt(elem.style.left);
  var ypos = parseInt(elem.style.top);
  if (xpos == final_x && ypos == final_y) {
  return true;
  }
  if (xpos < final_x) {
    var dist = Math.ceil((final_x - xpos)/10);
    xpos = xpos + dist;
  }
  if (xpos > final_x) {
    var dist = Math.ceil((xpos - final_x)/10);
    xpos = xpos - dist;
  }
  if (ypos < final_y) {
    var dist = Math.ceil((final_y - ypos)/10);
    ypos = ypos + dist;
  }
  if (ypos > final_y) {
    var dist = Math.ceil((ypos - final_y)/10);
    ypos = ypos - dist;
  }
  elem.style.left = xpos + "px";
  elem.style.top = ypos + "px";
  var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
  elem.movement = setTimeout(repeat,interval);
}
function classNormal(){
 var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
 for(var i=0; i<focusBtnList.length; i++) {
  focusBtnList[i].className='';
 }
}
function focusChange() {
 var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
  focusBtnList[0].onmouseover = function() {
   moveElement('focus_change_list',0,0,5);
   classNormal()
   focusBtnList[0].className='current'
  }
  focusBtnList[1].onmouseover = function() {
   moveElement('focus_change_list',-450,0,5);
   classNormal()
   focusBtnList[1].className='current'
  }
  focusBtnList[2].onmouseover = function() {
   moveElement('focus_change_list',-900,0,5);
   classNormal()
   focusBtnList[2].className='current'
  }
  focusBtnList[3].onmouseover = function() {
   moveElement('focus_change_list',-1350,0,5);
   classNormal()
   focusBtnList[3].className='current'
  }
}
setInterval('autoFocusChange()', 5000);
function autoFocusChange() {
 var focusBtnList = $('focus_change_btn').getElementsByTagName('li');
 for(var i=0; i<focusBtnList.length; i++) {
  if (focusBtnList[i].className == 'current') {
   var currentNum = i;
  }
 }
 if (currentNum==0 ){
  moveElement('focus_change_list',-450,0,5);
  classNormal()
  focusBtnList[1].className='current'
 }
 if (currentNum==1 ){
  moveElement('focus_change_list',-900,0,5);
  classNormal()
  focusBtnList[2].className='current'
 }
 if (currentNum==2 ){
  moveElement('focus_change_list',-1350,0,5);
  classNormal()
  focusBtnList[3].className='current'
 } 
 if (currentNum==3 ){
  moveElement('focus_change_list',0,0,5);
  classNormal()
  focusBtnList[0].className='current'
 }
}
window.onload=function(){
 focusChange();
}
</script>
</head>

<body>

<table width="700" height="98" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="470"><div id="focus_change">
 <div id="focus_change_list" style="top:0; left:0;">
  <ul>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture1%>" border="0" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture2%>" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture3%>" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture4%>" /></a></li>
  </ul>
 </div>
 <div class="focus_change_opacity"></div>
 <div id="focus_change_btn">
  <ul>
   <li class="current"><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture1%>" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture2%>" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture3%>" /></a></li>
   <li><a href="goods_details.jsp?id=<%=ID%>"><img src="images/<%=picture4%>" /></a></li>
  </ul>
 </div>
</div></p>
  
    <p>&nbsp;</p></td>
    <td width="230" align="left" valign="top"><p>
    <table width="200" border="0" align="right" cellpadding="0" cellspacing="0">
  <tr>
    <td>      <div class="shopby">
            	<div class="small_heading">
            		<h5>最新公告</h5>
                </div>
				
                <ul><marquee direction="up" scrollamount="2" onmouseover="this.stop()" onmouseout="this.start()" >
				                <%
int ID_bbs=0;
String title="";
while(rs_bbs.next()){
ID_bbs=rs_bbs.getInt(1);
title=rs_bbs.getString(2);
%><li><a href="index.jsp?id=8&&ID=<%=ID_bbs%>"><%=title%>
</a><%	}%>
                  
                </marquee>  </ul>             
      </div></p></td>
  </tr>
</table>
    
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p></td>
	
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
