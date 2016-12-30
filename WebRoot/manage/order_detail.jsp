<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
connDB conn=new connDB();
if (request.getParameter("ID")!=null){
	int ID=Integer.parseInt(request.getParameter("ID"));
	ResultSet rs_main=conn.executeQuery("select * from tb_order where orderID="+ID);
	int orderID=0;
	String address="";
	String postcode="";
	String tel="";
	String bz="";
	int goodID=-1;
	String goodsname="";
	float nowprice=0;
	int number=0;
	String picture="";
	if(rs_main.next()){
		orderID=rs_main.getInt("orderID");
		address=rs_main.getString("OrderAddress");
		postcode=rs_main.getString("OrderPostcode");
		tel=rs_main.getString("OrderTel");
		bz=rs_main.getString("Note");
		if (bz.equals("")){
			bz="无";
		}
	}
	ResultSet rs=conn.executeQuery("select * from V_order_detail where orderID="+orderID);
						while(rs.next()){
							goodID=rs.getInt("goodsID");
							goodsname=rs.getString("goodsname");
							nowprice=rs.getFloat("price");
							number=rs.getInt("number");
							picture=rs.getString("GoodsPicture");
						
                        
						 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>后台管理</title>
<link href="../css/styleadd.css" rel="stylesheet">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script src="onclock.JS"></script>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
</head>


<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
	float: left;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(images/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
#all div left {
	float: left;
	width: 200px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	position: relative;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
}
</style>
<body><%
if(session.getAttribute("manager")==null){
out.print("<script>alert('请先登录！');document.location='Login_M.jsp';</script>");
}%>
<div id="all">
  <div><table width="100%" height="64" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
  <tr>
    <td width="1%" height="64">&nbsp;</td>
    <td width="99%" valign="top"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="74%" height="38" class="admin_txt"><img src="images/thaw.gif" width="15" height="15" />管理员
		<%=session.getAttribute("manager")%>： 您好,感谢登陆使用！　<img src="images/back.gif" width="16" height="16" /><a href="logout.jsp">退出</a></td>
        <td width="22%"><a href="#" target="_self" onClick="logout();"></a></td>
        <td width="4%">&nbsp;</td>
      </tr>
      <tr>
        <td height="19" colspan="3">&nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table></div>

  <div><img src="images/top2.jpg" /></div>
  <div id="container"><jsp:include page="index_left.jsp" />
  </div>
  <div id="container2">
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">订单详情</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
	<p><img src="images/ddxq.jpg" /></p><table width="100%" height="272"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="98%" height="220" align="center" valign="top">
					  <table width="750" height="131"  border="0" cellpadding="0" cellspacing="0" class="tableBorder_LTR_dashed">
                        <tr>
                          <td width="33%" rowspan="8" align="left" style="padding:5px;"><img src="../images/<%=picture%>" width="154" height="129" /></td>
                          <td width="67%" align="left" style="padding:5px;">订 　单号：&nbsp;<%=orderID%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">地&nbsp;&nbsp;&nbsp; 　 址：&nbsp;<%=address%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">邮政 编码：&nbsp;<%=postcode%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">电&nbsp;&nbsp;&nbsp;&nbsp;　 话：&nbsp;<%=tel%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">备&nbsp;&nbsp;&nbsp;　 &nbsp;注：&nbsp;<%=bz%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">商品名 称：<%=goodsname%></td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">单　　 价：<%=nowprice%>(元)</td>
                        </tr>
                        <tr>
                          <td align="left" style="padding:5px;">数　　 量：<%=number%></td>
                        </tr>
                </table>
					  <table width="750"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFFFFF" bordercolordark="#CCCCCC" class="tableBorder_dashed">
                        <tr align="center" bgcolor="#eeeeee">
                          <td height="27">&nbsp;</td>
                        </tr>
						
                </table>
					  <table width="100%" height="49"  border="0" align="left" cellpadding="0" cellspacing="0">
                        <tr>
                          <td align="center"><input name="Submit" type="submit" class="btn_grey" value="返回" onClick="history.back(-1)"></td>
                        </tr>
              </table></td>
              <td width="2%" valign="top">&nbsp;</td>
            </tr>
          </table>
	</td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
  </div>

</div>
</body>
</html>
<%}
%>