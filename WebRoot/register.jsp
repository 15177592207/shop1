<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
Design by http://www.cssmoban.com
Released for free under a Creative Commons Attribution 3.0 License
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="register.css" />
<script type="text/javascript" src="js/check.js"></script>

</head>
<body>
<div class="main">

  

  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
        </div>
        <div class="article">
          <h2>　　　　　　　　　　　　　　　　　用户注册</h2>
          <form action="register_deal.jsp" method="post" name="myform" id="sendemail">
          <ol><li>
	<script language="javascript">
						   function openwin(UID){
						   if (UID==""){
								alert("请输入用户名!");
								myform.memberName.focus();
								return;
						   }
						   var str="checkUserName.jsp?memberName="+UID;
						   window.showModalDialog(str,"","dialogWidth=300px;dialogHeight=150px;status=no;help=no;scrollbars=no");
						   }
			    </script>
            <label for="name"></label>
            用　户名　
            
            <input name="memberName" class="text" id="memberName"  />
            <a href="#" onClick="openwin(myform.memberName.value)">【检测用户名】</a> </li>
		    <li></li>
		    <li>
            真实姓名　
              <input id="memberTrueName" name="memberTrueName" class="text" />
          </li>
		    <li></li>
		    <li>密&nbsp;&nbsp;&nbsp;&nbsp;　码　
              <input name="memberPWD" type="password" class="text" id="memberPWD" />
          </li>
		    <li></li>
		    <li>
            确认密码　
              <input name="pwd1" type="password" class="text" id="pwd1" />
          </li>
		    <li></li>
		    <li>
            所在城市　
              <input id="memberCity" name="memberCity" class="text" />
          </li>
		    <li></li>
		    <li> 联系地址 </li>
		    <li>　　　　　
              <textarea name="memberAddress" cols="25" rows="3" id="memberAddress"></textarea>
		  </li>
		  <li> </li>
		  <li> </li>
		  <li>
           邮政编码　
             <input id="memberPostcode" name="memberPostcode" class="text" />
          </li>
		  <li></li>
		  <li>
            证件号码　
              <input id="memberCardNO" name="memberCardNO" class="text" />
          </li>
		  <li>
            <label for="name">证件类别</label>
            　　　　　　
            <input name="memberCardType" type="radio" class="noborder" value="身份证" checked="checked" />
身份证&nbsp;
<input name="memberCardType" type="radio" class="noborder" value="军官证" />
军官证
<input name="memberCardType" type="radio" class="noborder" value="学生证" />
学生证</li>
		  <li></li>
		  <li>
            联系电话　
              <input id="memberTel" name="memberTel" class="text" />
          </li>
          <li></li>
          <li>
            邮　　箱　
              <input id="memberEmail" name="memberEmail" class="text" />
          </li>
           </ol>
          <p>&nbsp;</p>
          <ol>
            <ol>
              <li>                </li>
            </ol>
            <li>
              
               　　　　　　 
                 <input name="提交" type="button" value="注册" class="button" onClick="check()"/>　　　
              
               　
                 <input name="" type="reset" value="重置" class="button" /> 　<a href="index.jsp">              返回</a>          
              <div class="clr"></div>
            </li>
          </ol>
          </form>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>

  <div class="footer"></div>
</div>
</body>
</html>
