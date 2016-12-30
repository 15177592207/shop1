<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%
connDB conn=new connDB();
String username=(String)session.getAttribute("username");
if(username!=null && username!=""){
	String sql="select * from tb_member where MemberName='"+username+"'";
	ResultSet rs=conn.executeQuery(sql);
	int id=-1;
	String truename="";
	String pwd="";
	String city="";
	String address="";
	String postcode="";
	String cardNO="";
	String cardType="";
	String tel="";
	String email="";
	if(rs.next()){
		id=rs.getInt(1);
		truename=rs.getString(3);
		pwd=rs.getString(4);
		city=rs.getString(5);
		address=rs.getString(6);
		postcode=rs.getString(7);
		cardNO=rs.getString(8);
		cardType=rs.getString(9);
		tel=rs.getString(12);
		email=rs.getString(13);		
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<form action="user_modify_deal.jsp?memberID=<%=id%>" method="post" name="myform">
<div class="acount_info">
                    <h6 class="heading bold">我的个人资料</h6>
		  <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
            <tr>
              <td width="18%" height="37" align="center">用 户 名：</td>
              <td width="82%" class="word_grey"><input name="memberName" type="text" class="textheight" id="memberName" value="<%=username%>" maxlength="20">
                <span class="word_orange">(用户名不可修改)
                <input name="ID" type="hidden" value="<%=id%>">
                </span></td>
            </tr>
            <tr>
              <td height="33" align="center">真实姓名：</td>
              <td height="33"><input name="memberTrueName" type="text" class="textheight" id="memberTrueName" value="<%=truename%>" maxlength="10">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="35" align="center"> 原 密 码：</td>
              <td height="35"><input name="oldpwd" type="password" size="20" maxlength="20" class="textheight">                  
              <input name="holdpwd" type="hidden" value="<%=pwd%>"></td></tr>
            <tr>
              <td height="38" align="center">新 密&nbsp;码：</td>
              <td height="38"><input name="memberPWD" type="password" class="textheight" id="memberPWD" size="20" maxlength="20">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="35" align="center">确认新密码：</td>
              <td height="35"><input name="pwd1" type="password" size="20" maxlength="20" class="textheight">
              <span class="word_orange">*</span> </td>
            </tr>
            <tr>
              <td height="40" align="center">所在城市：</td>
              <td><input name="memberCity" type="text" class="textheight" id="memberCity" value="<%=city%>"></td>
            </tr>
            <tr>
              <td height="37" align="center">收货地址：</td>
              <td class="word_grey"><input name="memberAddress" type="text" class="textheight" id="memberAddress" value="<%=address%>"size="50"></td>
            </tr>
            <tr>
              <td height="34" align="center">邮政编码：</td>
              <td class="word_grey"><input name="memberPostcode" type="text" class="textheight" id="memberPostcode" value="<%=postcode%>" size="20"></td>
            </tr>
            <tr>
              <td height="38" align="center">证件号码：</td>
              <td><input name="memberCardNO" type="text" class="textheight" id="memberCardNO" value="<%=cardNO%>">
              <span class="word_orange">*</span></td>
            </tr>
            <tr>
              <td height="39" align="center">证件类别：</td>
              <td><input name="memberCardType" type="radio" class="noborder" value="身份证" <%if(cardType.equals("身份证")) out.print("checked");%>>
      身份证&nbsp;
      <input name="memberCardType" type="radio" class="noborder" value="军官证" <%if(cardType.equals("军官证")) out.print("checked");%>>
      军官证
      <input name="memberCardType" type="radio" class="noborder" value="学生证" <%if(cardType.equals("学生证")) out.print("checked");%>>
      学生证</td>
            </tr>
            <tr>
              <td height="33" align="center">联系电话：</td>
              <td><input name="memberTel" type="text" class="textheight" id="memberTel" value="<%=tel%>"></td>
            </tr>
            <tr>
              <td height="34" align="center" style="padding-left:10px">Email：</td>
              <td class="word_grey"><input name="memberEmail" type="text" class="textheight" id="memberEmail" value="<%=email%>" size="50">
                <span class="word_orange">*</span></td>
            </tr>

            <tr>
              <td height="34">&nbsp;</td>
              <td class="word_grey"><label>
                <input type="button" name="Submit" value="确认保存" onclick="check_modi()" />
                　
                <input type="reset" name="Submit2" value="重置" />
                <a href="index.jsp">返回</a></label></td>
            </tr>
          </table>
  </div>
</form>
</body>
</html>
<%}else{
	out.println("<script lanage='javascript'>alert('请先登录，再修改个人信息!');window.location.href='index.jsp';</script>");
}%>