<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String PID="";
String goodsname="";
String leixin="";
//int TypeID=-1;
int superID1=-1;
int subID1=-1;
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
		out.println("<script lanuage='javascript'>alert('您的操作有误!');window.location.href='index.jsp';</script>");
	}else{
		//TypeID=rs.getInt("TypeID");	
		superID1=rs.getInt("superID");
		subID1=rs.getInt("subID");
		goodsname=rs.getString("goodsname");
		leixin=rs.getString("GoodsType");
		introduce=rs.getString("GoodsIntroduce");
		price=rs.getFloat("GoodsPrice");		
		nowprice=rs.getFloat("GoodsNowPrice");		
		picture=rs.getString("GoodsPicture");
		newgoods=rs.getInt("IsNew");	
		sale=rs.getInt("IsSale");
		picture1=rs.getString("GoodsPicture1");
		picture2=rs.getString("GoodsPicture2");
		picture3=rs.getString("GoodsPicture3");
		picture4=rs.getString("GoodsPicture4");
		picture5=rs.getString("GoodsPicture5");
		picture6=rs.getString("GoodsPicture6");
	}
	ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
	int superID=-1;
	String superName="";
	if(rs_super.next()){
		superID=rs_super.getInt(1);
	}else{
		out.println("<script language='javascript'>alert('请先录入类别信息!');window.location.href='index.jsp';</script>");
		return;
	}
	
	int P_superID=-1;
	ResultSet rs_sub=null;
	//查询所属小类的默认选项
	if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
		P_superID=superID1;
		//superID
	}else{
		P_superID=Integer.parseInt(request.getParameter("superID"));
	}
	rs_sub=conn.executeQuery("select * from tb_subType where superType="+P_superID);
	int subID=-1;
	String subName="";
%>
<html>
<head>

<link href="css/skin.css" rel="stylesheet" type="text/css" />
<link href="../css/styleadd.css" rel="stylesheet">
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript">
function mycheck(){
	if (form1.goodsName.value==""){
		alert("请输入商品名称！");form1.goodsName.focus();return;
	}
	if (form1.goodsPicture.value==""){
		alert("请输入图片文件的路径！");form1.goodsPicture.focus();return;
	}
	if (form1.goodsPrice.value==""){
		alert("请输入商品的定价！");form1.goodsPrice.focus();return;
	}
	if (isNaN(form1.goodsPrice.value)){
		alert("您输入的定价错误，请重新输入！");form1.goodsPrice.value="";form1.goodsPrice.focus();return;
	}	
	if (form1.goodsIntroduce.value==""){
		alert("请输入商品简介！");form1.goodsIntroduce.focus();return;
	}		
	form1.submit();
}

function BrowseServer( startupPath, functionData )
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();

	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.basePath = '../';

	//Startup path in a form: "Type:/path/to/directory/"
	finder.startupPath = startupPath;

	// Name of a function which is called when a file is selected in CKFinder.
	finder.selectActionFunction = SetFileField;

	// Additional data to be passed to the selectActionFunction in a second argument.
	// We'll use this feature to pass the Id of a field that will be updated.
	finder.selectActionData = functionData;

	// Name of a function which is called when a thumbnail is selected in CKFinder.
	finder.selectThumbnailActionFunction = ShowThumbnails;

	// Launch CKFinder
	finder.popup();
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl, data )
{
	document.getElementById( data["selectActionData"] ).value = fileUrl;
}

// This is a sample function which is called when a thumbnail is selected in CKFinder.
function ShowThumbnails( fileUrl, data )
{
	// this = CKFinderAPI
	var sFileName = this.getSelectedFile().name;
	document.getElementById( 'thumbnails' ).innerHTML +=
			'<div class="thumb">' +
				'<img src="' + fileUrl + '" />' +
				'<div class="caption">' +
					'<a href="' + data["fileUrl"] + '" target="_parent">' + sFileName + '</a> (' + data["fileSize"] + 'KB)' +
				'</div>' +
			'</div>';

	document.getElementById( 'preview' ).style.display = "";
	// It is not required to return any value.
	// When false is returned, CKFinder will not close automatically.
	return false;
}
</script>
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
    <td valign="top" bgcolor="#F7F8F9"><p><img src="images/spxxxg.jpg" width="750" height="104">
    
       			 <form action="goods_modify_deal.jsp?goodsID=<%=ID%>" method="post" name="form1">
			    <table width="750"  border="0" align="left" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td height="27" align="left">所属 　　　 大类：</td>
                    <td width="33%" height="27" align="left"><script language="javascript">
					function F_super(val){
						var url="";
						eval("window.location.href='index.jsp?id=10&superID="+val+"&ID="+form1.ID.value+"'");
					}
					</script>
					<select name="supertype" class="textarea" id="supertype" onChange="F_super(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"<%if(superID==P_superID){out.println(" selected");/*注意此处的分号*/}%>><%=superName%></option>
					  <%}while(rs_super.next());%>
                    </select></td>
                    <td width="16%" height="27" align="left"> 所属　　　　小类：</td>
                    <td width="35%" height="27"><select name="goodsTypeID" class="textarea" id="goodsTypeID">
					  <%while(rs_sub.next()){
					  	subID=rs_sub.getInt(1);
					  	subName=rs_sub.getString(3);
					  %>
					   <option value="<%=subID%>"><%=subName%></option>
					  <%}%>
                    </select></td>
                  </tr>
                  <tr>
                    <td width="16%" height="80" align="left"><p>&nbsp;</p>
                      <p>商品　　　　名称：
                        <input name="ID" type="hidden" id="ID" value="<%=ID%>">
                    </p></td>
                    <td height="80" align="left"><p>&nbsp;
  </p>
                      <p>
  <input name="goodsName" type="text" class="Sytle_text" value="<%=goodsname%>" >
  &nbsp;&nbsp;                    </p></td>
                    <td height="80" align="left"><p>&nbsp;</p>
                    <p>&nbsp;</p></td>
                    <td height="80" align="left">&nbsp;</td>
                  </tr>
                  <tr>
                    <td height="71" align="left"><p>商品图片　　标志：</p>
                    </td>
                    <td height="71" align="left"><input  name="goodsPicture" type="text" class="Style_upload" id="goodsPicture" value="<%=picture%>">
                    <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture' );" value="浏览" /></td>
                    <td height="71" align="left"><p>商品详情一级图片：</p>
                    </td>
                    <td height="71" align="left"><input  name="goodsPicture1" type="text" class="Style_upload" id="goodsPicture1" value="<%=picture1%>">
                    <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture1' );" value="浏览" /></td>
                  </tr>
                  <tr>
                    <td height="72" align="left">商品详情二级图片：</td>
                    <td height="72" align="left"><label>
                      <input  name="goodsPicture2" type="text" class="Style_upload" id="goodsPicture2" value="<%=picture2%>"> 
                      <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture2' );" value="浏览" />
                    </label></td>
                    <td height="72" align="left">商品详情三级图片：</td>
                    <td height="72" align="left"><label>
                      <input  name="goodsPicture3" type="text" class="Style_upload" id="goodsPicture3" value="<%=picture3%>">
                    <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture3' );" value="浏览" /></label></td>
                  </tr>
                  <tr>
                    <td height="82" align="left">商品详情四级图片：</td>
                    <td height="82" align="left"><label>
                      <input  name="goodsPicture4" type="text" class="Style_upload" id="goodsPicture4" value="<%=picture4%>">
                      <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture4' );" value="浏览" /></label></td>
                    <td height="82" align="left">商品详情五级图片：</td>
                    <td height="82" align="left"><label>
                    <input  name="goodsPicture5" type="text" class="Style_upload" id="goodsPicture5" value="<%=picture5%>">
                    <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture5' );" value="浏览" /></label></td>
                  </tr>
                  <tr>
                    <td height="65" align="left">商品详情六级图片：</td>
                    <td height="65" align="left"><label>
                      <input  name="goodsPicture6" type="text" class="Style_upload" id="goodsPicture6" value="<%=picture6%>">
                      <input name="button" type="button" onClick="BrowseServer( '', 'goodsPicture6' );" value="浏览" /></label></td>
                    <td height="65" align="left"> 类　　　　　　型：</td>
                    <td height="65"><label>
                      <input name="goodsType" type="text" id="goodsType" value="<%=leixin%>">
                    </label></td>
                  </tr>
                  <tr>
                    <td height="48" align="left"><p>&nbsp;</p>
                    <p>定　　　　　　价：</p></td>
                    <td height="48" align="left"><p>&nbsp;
                      </p>
                      <p>
                      <input name="goodsPrice" type="text" class="Sytle_text" id="price3" value="<%=price%>">
                    (元)</p></td>
                    <td height="48" align="left"><p>&nbsp;</p>
                    <p>现　　　　　　价：</p></td>
                    <td height="48" align="left"><p>&nbsp;
                      </p>
                      <p>
                      <input name="goodsNowPrice" type="text" class="Sytle_text" id="price4" value="<%=nowprice%>" >
                    (元)</p></td>
                  </tr>
                  <tr>
                    <td height="45" align="left"><p>&nbsp;</p>
                    <p>是否　　　　新品：</p></td>
                    <td align="left"><p>&nbsp;
                      </p>
                      <p>
                        <input name="isNew" type="radio" class="noborder" value="1"<%if(newgoods==1){out.print(" checked");}%>>
                      是
                      <input name="isNew" type="radio" class="noborder" value="0"<%if(newgoods==0){out.print(" checked");}%>>
                    否</p></td>
                    <td align="left"><p>&nbsp;</p>
                    <p>是否　　　　特价：</p></td>
                    <td align="left"><p>&nbsp;
                      </p>
                      <p>
                        <input name="isSale" type="radio" class="noborder" value="1"<%if(sale==1){out.print(" checked");}%>>
                      是
                      <input name="isSale" type="radio" class="noborder" value="0"<%if(sale==0){out.print(" checked");}%>>
                    否</p></td>
                  </tr>
                  <tr>
                    <td height="103" align="left">商品　　　　简介：</td>
                    <td colspan="3" align="left"><textarea name="goodsIntroduce" cols="60" rows="5" class="textarea" id="goodsIntroduce"><%=introduce%></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="left">
                         　　　　　　　
                         　
                           　
                           <input name="Button" type="button" class="btn_grey" value="保存" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_grey" value="重置">
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
