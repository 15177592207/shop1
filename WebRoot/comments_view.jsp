<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.chStr"%>
<%@ page import="com.wgh.DB.connDB"%>
<%
chStr chStr=new chStr();

String username="";
username=(String)session.getAttribute("username");
String goodsName=chStr.chStr(request.getParameter("goodsName"));

	connDB conn=new connDB();
	ResultSet rs;
	if(!goodsName.equals("null")){
	rs=conn.executeQuery("select * from Tb_comment where GoodsName='"+goodsName+"'");
	}
	else{
	rs=conn.executeQuery("select * from Tb_comment");
	}
	int orderID=0;
	float price=0;
	int number=0;
	String pl="";
	String GoodsName="";
	String date="";
	String hf="";
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div id="mk04">
<h4 class="heading">商品评价</h4>
<table width="720" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30" colspan="2">用户评价</td>
    <td width="105">评价人</td>
    <td width="156">宝贝信息</td>
    <td width="148">管理员回复</td>
  </tr>
  <%
					while(rs.next()){
					    username=rs.getString("CommentName");
						orderID=rs.getInt("orderID");
						price=rs.getFloat("price");
						number=rs.getInt("number");
						pl=rs.getString("CommentCotent");
						GoodsName=rs.getString("GoodsName");
						date=rs.getString("CommentDate");
						hf=rs.getString("CommentReply");
					
					%>
  <tr>
    <td width="27" height="73" rowspan="2" align="left"><img src="images/pl1.jpg" width="16" height="16" /></td>
    <td width="238" rowspan="2"><table width="237%" height="63" border="0" cellpadding="0" cellspacing="0">
  <tr style="padding:5px;">
    <td><%=pl%></td>
  </tr>
</table>
</td>
    <td height="61"><%=username%></td>
    <td><%=GoodsName%></td>
	<%if(hf!=null){%>
    <td><%=hf%></td>
	<%}else{%>
	<td width="46">等待回复中......</td>
	<%}%>
  </tr>
  <tr>
    <td height="24"><img src="images/pl2.jpg" width="33" height="14" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="18" colspan="2">[<%=date%>]</td>
    <td>&nbsp;</td>
    <td><%=price%>元</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="23" colspan="5"><hr></td>
  </tr>
  <%}%>
</table>
</div>
</body>
</html>
<%conn.close();%>
