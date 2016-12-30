<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Go购电子商城后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/styleadd.css" rel="stylesheet">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function mycheck(){
	if (form1.typename.value==""){
		alert("请输入大分类名称！");form1.typename.focus();return;
	}
	form1.submit();
}
</script>
<body>
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><a href="index.jsp?id=5">大分类管理</a></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/adddfl.jpg"></p>
	  <form action="superType_add_deal.jsp" method="post" name="form1">
	<table width="750"  border="0" align="left" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td height="45">大分类名称：</td>
					<td><input name="typename" type="text" id="typename" size="60"></td>
                  </tr> 
				  <tr>
                    <td width="16%" height="149">&nbsp;</td>
                    <td width="84%" height="149">&nbsp;                        </td>
                  </tr>
                  <tr align="center">
                    <td height="38" colspan="3">
                        <input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="重置">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back(-1)">                    </td>
        </tr>
                </table></form>
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
