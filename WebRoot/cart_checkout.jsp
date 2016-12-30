<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<!-- // Stylesheets // -->
<%@ page import="com.wgh.DB.connDB"%>
<%
connDB conn=new connDB();
if(session.getAttribute("cart")==""){
	out.println("<script language='javascript'>alert('您还没有购物!');window.location.href='index.jsp';</script>");
}
String Username="";
Username=(String)session.getAttribute("username");
if (Username!=""){
try{
ResultSet rs_user=conn.executeQuery("select * from tb_Member where MemberName='"+Username+"'");
if(!rs_user.next()){
	session.invalidate();
	out.println("<script language='javascript'>alert('请先登录后，再进行购物!');window.location.href='index.jsp';</script>");
	return;
}else{
	String Truename=rs_user.getString("MemberTrueName");
	String address=rs_user.getString("MemberAddress");
	String postcode=rs_user.getString("MemberPostcode");
	String tel=rs_user.getString("MemberTel");
%>
<script language="javascript">
function check_member(form){
	if(form.truename.value==""){
		alert("请输入您的真实姓名!");form.truename.focus();return;	
	}
	if(form.address.value==""){
		alert("请输入您的联系地址!");form.address.focus();return;	
	}	
	if(form.postcode.value==""){
		alert("请输入您的邮政编码!");form.postcode.focus();return;	
	}	
	if(form.tel.value==""){
		alert("请输入您的联系电话!");form.tel.focus();return;	
	}
	form.submit();
}
</script>
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
.STYLE1 {color: #FF0000}
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
            <li class="last"><a href="#">收银台</a></li>
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
<div class="col2"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="80"><div align="center"><img src="images/center_checkout.gif" width="608" height="80" /></div></td>
      </tr>
            <tr valign="top">
              <td height="134" align="center">
<form method="post" action="cart_order.jsp" name="form_checkout">
                    <table width="100%" height="435"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="26%" height="40">&nbsp; </td>
                        <td height="40" colspan="2" align="left" class="word_deepgrey">注意：请您不要恶意或非法提交订单以免造成不必要的麻烦！</td>
                      </tr>
                      <tr>
                        <td height="36" colspan="2" align="right">用 户 名：</td>
                        <td width="65%" align="left"><input name="username" type="text" id="username" value="<%=Username%>" readonly="yes" class="textheight"/>
                        <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="36" colspan="2" align="right">真实姓名：</td>
                        <td align="left"><input name="truename" type="text" id="truename" value="<%=Truename%>" class="textheight">
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="37" colspan="2" align="right">联系地址：</td>
                        <td align="left"><input name="address" type="text" id="address" value="<%=address%>" class="textheight">
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="44" colspan="2" align="right">邮政编码：</td>
                        <td align="left"><input name="postcode" type="text" id="postcode" value="<%=postcode%>" class="textheight">
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="35" colspan="2" align="right">联系电话：</td>
                        <td align="left"><input name="tel" type="text" id="tel" value="<%=tel%>" class="textheight">
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="40" colspan="2" align="right">付款方式：</td>
                        <td align="left"><select name="pay" class="textarea">
      <option>银行付款</option>
      <option>邮政付款</option>
      <option>现金支付</option>
    </select>
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="36" colspan="2" align="right">运送方式：</td>
                        <td align="left"><select name="carry" class="textarea">
      <option>普通邮寄</option>
      <option>特快专递</option>
      <option>EMS专递方式</option>
    </select>
                          <span class="STYLE1">*</span></td>
                      </tr>
                      <tr>
                        <td height="101" colspan="2" align="right">备&nbsp;&nbsp;&nbsp;&nbsp;注：</td>
                        <td align="left"><textarea name="bz" cols="50" rows="5" class="textarea" id="bz"></textarea></td>
                      </tr>
                      <tr align="center">
                        <td>&nbsp;</td>
                        <td width="9%">&nbsp;</td>
                        <td align="left"><input name="Button" type="button" class="btn_grey" value="提交" onclick="check_member(form_checkout)" />
                            　  
                        <input name="Submit2" type="button" class="btn_grey" value="返回" onclick="history.back(1);" />                        </td>
                      </tr>
                    </table>
</form>
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
<%}
}catch(Exception e){
out.println(e.toString());
}
}else{
	session.invalidate();
	out.println("<script language='javascript'>alert('请先登录后，再进行购物!');window.location.href='index.jsp';</script>");
}
%>
