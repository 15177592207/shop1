<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String PID="";
String goodsname="";
String leixin="";
String superType="";
String subType="";
String introduce="";
String picture="";
String picture1="";
String picture2="";
String picture3="";
String picture4="";
String picture5="";
String picture6="";
float price=(float)0.0;
float nowprice=(float)0.0;
int sale=0;
int newgoods=0;
PID=request.getParameter("ID");
if (PID!=null && PID!=""){
	int ID=Integer.parseInt(PID);
	ResultSet rs=conn.executeQuery("select * from V_goods where GoodsID="+ID);
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('您的操作有误1!');window.location.href='index.jsp';</script>");
	}else{
		superType=rs.getString("superType");	
		subType=rs.getString("subType");	
		goodsname=rs.getString("goodsname");
		
		introduce=rs.getString("GoodsIntroduce");
		price=rs.getFloat("GoodsPrice");		
		nowprice=rs.getFloat("GoodsNowPrice");		
		picture=rs.getString("GoodsPicture");
		newgoods=rs.getInt("IsNew");	
		sale=rs.getInt("IsSale");
		leixin=rs.getString("GoodsType");
		picture1=rs.getString("GoodsPicture1");
		picture2=rs.getString("GoodsPicture2");
		picture3=rs.getString("GoodsPicture3");
		picture4=rs.getString("GoodsPicture4");
		picture5=rs.getString("GoodsPicture5");
		picture6=rs.getString("GoodsPicture6");
	}
%>
<html>
<head>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/styleadd.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td width="57%" height="31"></td>
        <td width="3%"><img src="images/list.gif" width="11" height="13"></td>
        <td width="11%"><div class="titlebt"><a href="index.jsp?id=5">大分类管理</a></div></td>
        <td width="3%"><img src="images/list.gif" width="11" height="13"></td>
        <td width="10%"><div class="titlebt"><a href="index.jsp?id=7">小分类管理</a></div></td>
        <td width="3%"><img src="images/list.gif" width="11" height="13"></td>
        <td width="13%"><div class="titlebt"><a href="index.jsp?id=9">添加商品</a></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/spxxsc.jpg" width="750" height="104">
    
    			 <form action="goods_del_deal.jsp?goodsID=<%=ID%>" method="post" name="form1">
			    <table width="777"  border="0" align="left" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="17%" height="27" align="left">商品 　　　名 称：</td>
                    <td height="27" colspan="3" align="left"><input name="ID" type="hidden" id="ID" value="<%=ID%>">
                      <%=goodsname%>
                    &nbsp;&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td height="27" align="left">所属　　　 大 类：</td>
                    <td width="28%" height="27" align="left"><%=superType%></td>
                    <td width="16%" height="27" align="left"> 所属 　　　小 类：</td>
                    <td width="39%" height="27" align="left"><%=subType%></td>
                  </tr>
                  <tr>
                    <td height="58" align="left">商品图片 　标 志：</td>
                    <td height="58" align="left"><img src="../images/<%=picture%>" width="80" height="50"></td>
                    <td height="58" align="left">商品详情一级图片：</td>
                    <td height="58" align="left"><label><img src="../images/<%=picture1%>" width="80" height="50"></label></td>
                  </tr>
				     <tr>
                    <td height="62" align="left">商品详情三级图片：</td>
                    <td align="left"><label></label>
                      <label><img src="../images/<%=picture3%>" width="80" height="50"></label></td>
                    <td align="left">商品详情二级图片：</td>
                    <td align="left"><label><img src="../images/<%=picture2%>" width="80" height="50"></label></td>
                  </tr>
                  <tr>
                    <td height="61" align="left">商品详情四级图片：</td>
                    <td align="left"><label><img src="../images/<%=picture4%>" width="80" height="50"></label></td>
                    <td align="left">商品详情五级图片：</td>
                    <td align="left"><label><img src="../images/<%=picture5%>" width="80" height="50"></label></td>
                  </tr>
                  <tr>
                    <td height="57" align="left">商品详情六级图片:</td>
                    <td align="left"><label><img src="../images/<%=picture6%>" width="80" height="50"></label></td>
                    <td align="left">类　　　　　　型：</td>
                    <td align="left"><label><%=leixin%></label></td>
                  </tr>
                  <tr>
                    <td height="27" align="left">定　　 　　　 价：</td>
                    <td height="27" align="left"><%=price%>(元)</td>
                    <td height="27" align="left">现　　　　　　价： </td>
                    <td height="27" align="left"><%=nowprice%>(元)</td>
                  </tr>
                  <tr>
                    <td height="45" align="left">是否 　　　新 品：</td>
                    <td align="left"><%if(newgoods==0){out.print("不是新品");}
					else{out.print("是新品");}
					%></td>
                    <td align="left">是否　　　 特 价：</td>
                    <td align="left"><%if(sale==0){out.print("不是特价商品");}
					else{out.print("是特价商品");}
					%></td>
                  </tr>
                  <tr>
                    <td height="103">商品　　　 简 介：</td>
                    <td colspan="3" align="left"><%=introduce%></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="left">　　　　　　　  　  　
                      <input name="Submit" type="submit" class="btn_grey" value="确定删除">
                        &nbsp;　　　　
                        <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
			  </form></p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
<%}else{
	out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='index.jsp';");
}%>
