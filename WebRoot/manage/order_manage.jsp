<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
ResultSet rs=conn.executeQuery("select * from tb_order");
int orderID=0;
String username="";
int bnumber=0;
String truename="";
String address="";
String postcode="";
String tel="";
String pay="";	
String carry="";
float rebate=1;
String orderDate="";
String bz="";
int enforce=0;
%>
<html>
<head>
<title>Go购电子商城后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/styleadd.css" rel="stylesheet">
</head>

<body>
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">会员管理</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/ddgl.jpg"></p><table width="750" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
<table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
                    <tr align="center">
                      <td width="8%" height="30">订单号</td>
                      <td width="8%">品种数</td>
                      <td width="10%">真实姓名</td>
                      <td width="15%">付款方式</td>
                      <td width="17%">运送方式</td>
                      <td width="6%">折扣</td>
                      <td width="26%">订货日期</td>
                      <td width="10%">执行</td>
                    </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(((Page-1)*pagesize+1)>RecordCount){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	orderID=rs.getInt("orderID");
	bnumber=rs.getInt("OrderBnumber");
	truename=rs.getString("OrderTrueName");
	pay=rs.getString("PayWay");
	carry=rs.getString("CarryWay");
	rebate=rs.getFloat("rebate");
	orderDate=rs.getString("orderDate");
	enforce=rs.getInt("IsEnforce");
	  %>
		<tr align="center">
		  <td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
		  <td><%=bnumber%></td>
		  <td><%=truename%></td>
		  <td><%=pay%></td>
		  <td><%=carry%></td>
		  <td><%=rebate*100%>%</td>
		  <td><%=orderDate%></td>
		  <td><%if(enforce==0){%><a href="order_enforce.jsp?ID=<%=orderID%>&&page=<%=Page%>"><img src="../images/enforce.gif" width="16" height="16"></a>
		    <%}else{%>已执行<%}%></td>
		</tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
            </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="index.jsp?id=3&&Page=1">第一页</a>　<a href="index.jsp?id=3&&Page=<%=Page-1%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="index.jsp?id=3&&Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?id=3&&Page=<%=maxPage%>">最后一页&nbsp;</a>
	<%}
	%>	</td>
  </tr>
</table>		  </td>
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
</body>
</html>
