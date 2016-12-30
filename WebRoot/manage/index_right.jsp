<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>

<%
connDB conn=new connDB();
ResultSet rs=conn.executeQuery("select * from tb_goods order by GoodsINTime Desc");
%>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

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
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/splb.jpg" width="750" height="104">
    
    <table width="750" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr bgcolor="#eeeeee">
                <td width="22%" height="24" align="center">商品名称</td>
                <td width="40%" align="center">简介</td>
                <td width="11%" align="center">是否新品</td>
                <td width="11%" align="center">是否特价</td>
                <td width="8%" align="center">修改</td>
                <td width="8%" align="center">删除</td>
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
	if(Page>maxPage){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  int ID=rs.getInt("GoodsID");
	  String goodsName=rs.getString("goodsName");
	  String introduce=rs.getString("GoodsIntroduce");
	  String newgoods=rs.getInt("IsNew")==0 ? "否":"是";
	  String sale=rs.getInt("IsSale")==0 ? "否":"是"; 
	  %>

              <tr style="padding:5px;">
                <td height="20" align="center"><a href="goods_detail.jsp?ID=<%=ID%>"><%=goodsName%></a></td>
                <td align="center"><%=introduce%></td>
                <td align="center"><%=newgoods%></td>
                <td align="center"><%=sale%></td>
                <td align="center"><a href="index.jsp?id=10&&ID=<%=ID%>"><img src="images/administrator1_(edit)_16x16.gif" width="16" height="16" border="0"></a></td>
                <td align="center"><a href="index.jsp?id=11&&ID=<%=ID%>"><img src="../images/del.gif" width="16" height="16" border="0"></a></td>
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
    <td align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="index.jsp?Page=1">第一页</a>　<a href="index.jsp?Page=<%=Page-1%>">上一页</a>
	<%
	}
	if(Page<maxPage){
	%>
	　<a href="index.jsp?Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
	<%}
	%>
	</td>
  </tr>
</table>		  </td>
        </tr>
      </table></p>
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
