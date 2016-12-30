<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>

<html>
<head>
<title>Go购电子商城后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../css/styleadd.css" rel="stylesheet">
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<script language="javascript">
function mycheck(){
	if (form1.BBSTitle.value==""){
		alert("请输入公告标题！");form1.BBSTitle.focus();return;
	}
	if (form1.BBSContent.value==""){
		alert("请输入公告内容！");form1.BBSContent.focus();return;
	}
	form1.submit();
}
</script>
<script src="onclock.JS"></script>
<body>
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td width="932" valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt"><a href="index.jsp?id=4">公告管理</a></div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/tjgg.jpg"></p>
 			  <form action="placard_add_deal.jsp" method="post" name="form1">
			    <table width="750"  border="0" align="left" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td height="45" align="center">公告标题：</td>
					<td><input name="BBSTitle" type="text" id="BBSTitle" size="62" height="20"></td>
                  </tr> 
				  <tr>
                    <td width="22%" height="272" rowspan="2" align="center">&nbsp;公告内容：</td>
                    <td width="78%">
                    <textarea name="BBSContent" cols="60" rows="15" class="textarea" id="BBSContent"></textarea></td>
                  </tr>
                  <tr>
                    <td height="58" colspan="2" align="left"><input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="重置">
                        &nbsp;
                    <input name="Submit3" type="button" class="btn_grey" value="返回" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
	    </form>   </td>
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
