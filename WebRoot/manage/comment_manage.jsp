<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>

<%
connDB conn=new connDB();
chStr chStr=new chStr();
ResultSet rs=conn.executeQuery("select * from Tb_comment order by CommentDate Desc");
%>
<html>
<head>
<title>Go购电子商城后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/styleadd.css" rel="stylesheet">
<script src="../js/check.js"></script>
<script src="js/onclock.js"></script>
</head>

<body>
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><a href="#">评论管理</a></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/plgl.jpg"></p>
	<table width="750" height="192"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top">
            <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr bgcolor="#eeeeee">
                <td width="14%" height="24" align="center">用户名</td>
                <td width="41%" align="center">评论</td>
                <td width="18%" align="center">时间</td>
                <td width="11%" align="center">商品名</td>
                <td width="10%" align="center">回复</td>
                <td width="6%" align="center">删除</td>
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
	  String username=rs.getString("CommentName");
	  int orderID=rs.getInt("orderID");
	  String pl=rs.getString("CommentCotent");
	  String GoodsName=rs.getString("GoodsName");
	  String date=rs.getString("CommentDate"); 
	  String hf=rs.getString("CommentReply");
	  %>

              <tr style="padding:5px;">
                <td height="20" align="center"><%=username%></td>
                <td align="center"><%=chStr.convertStr(pl)%></td>
                <td align="center"><%=date%></td>
                <td align="center"><%=GoodsName%></td>
                <td align="center"><a href="index.jsp?id=19&&orderID=<%=orderID%>"><img src="images/administrator1_(edit)_16x16.gif" width="16" height="16"> 
                    <%if(hf==null){%>未回复<%}else{%>已回<%}%></a></td>
                <td align="center"><a href="comment_del.jsp?orderID=<%=orderID%>"><img src="../images/del.gif" width="16" height="16" border="0"></a></td>
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
      </table></td>
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
