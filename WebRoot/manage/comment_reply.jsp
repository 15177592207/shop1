<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%String orderID=request.getParameter("orderID");
connDB conn=new connDB();
ResultSet rs=conn.executeQuery("select * from Tb_comment where orderID="+orderID);

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
        <td height="31"><div class="titlebt">评论回复</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/plhf.jpg"></p>
	<form action="comment_reply_deal.jsp?orderID=<%=orderID%>" method="post" name="frm"> 
    <table width="750"  border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                  <td valign="top"> <table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0"> </table> 
                    <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF"> 
                      <tr bgcolor="#eeeeee"> 
                        <td height="24" align="center">评论回复</td> 
                      </tr> 
					   <%if(rs.next()){
                          String hf=rs.getString("CommentReply");
					   if(hf!=null){%>
                      <tr style="padding:5px;"> 
					 
                        <td height="20" align="center"><label>
                          <textarea name="hf" cols="50" rows="10" id="hf"><%=hf%></textarea>
                        </label></td> 
                      </tr> 
					  <%}else{%>
					   <tr style="padding:5px;"> 
					 
                        <td height="20" align="center"><label>
                          <textarea name="hf" cols="50" rows="10" id="hf"></textarea>
                        </label></td> 
                      </tr>
					  <%}
					  conn.close();}%>
                    </table> 
                    <table width="100%" height="45"  border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td height="24" align="center"><label>
                          <input type="submit" name="Submit" value="回复">　　 
                           <input type="reset" name="Submit2" value="撤销">
                        </label></td> 
                        <!--层ch用于放置隐藏的checkbox控件，因为当表单中只是一个checkbox控件时，应用javascript获得其length属性值为undefine--> 
                        <script language="javascript">ch.style.display="none";</script> 
                      </tr> 
                    </table></td> 
                </tr> 
      </table></form></td>
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
