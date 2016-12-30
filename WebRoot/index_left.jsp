<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="com.wgh.DB.connDB" %>
<%
connDB conn=new connDB();
ResultSet rs_type=conn.executeQuery("select ID,supertype from V_Type group by ID,supertype order by supertype");
int id=-1;
String typename="";

ResultSet rs_superType=conn.executeQuery("select ID,superType from V_Type group by ID,superType order by superType desc");

ResultSet rs_sold=conn.executeQuery("select top 3 * from tb_goods where Sold_total>=1 order by Sold_total desc");
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link rel="stylesheet" type="text/css" href="css/styleadd.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/mk.css" rel="stylesheet" type="text/css" />


<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
<body>


  <div class="category">
            	<div class="small_heading">
            		<h5>商场目录</h5>
                </div>
                <div class="arrowlistmenu">
				<table width="100%" height="40"  border="0" cellpadding="0" cellspacing="0">
     <%
		int ID_superType=0;
		String superType="";
		int m=1;
		while(rs_superType.next()){
		ID_superType=rs_superType.getInt(1);
		superType=rs_superType.getString(2);
		String sql="select * from V_Type where ID="+ID_superType;
		ResultSet rs_subType=conn.executeQuery(sql);
		String subType="";
		int subID=0;
		//获取记录总数
		rs_subType.last();
		int subType_RC=rs_subType.getRow();
		rs_subType.first();
	 %>
   <tr>
	  <td>
	  <%
		if(subType_RC<=0){
	  %>
	  &nbsp;&nbsp;&nbsp;&nbsp;<img src="images/jian_null.gif" width="38" height="16" border="0">
	  <%=superType%>
	  <%
		}else{
	  %>
	  <a class="menuheader expandable">
	  &nbsp;&nbsp;&nbsp;&nbsp;<a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><img src="images/jia.gif" border="0" alt="展开" id="img<%=m%>"></a>
	  <a href="Javascript:ShowTR(img<%=m%>,OpenRep<%=m%>)"><%=superType%></a></a>
	  <%
	    }
	  %>
      </td>
	  <%if (subType_RC>0){%>
		 <tr id="OpenRep<%=m%>" style="display:none;">
			<td colspan="6">
			  <%do{
				subType=rs_subType.getString(3);
				subID=rs_subType.getInt(4);
				%>
			     <table width="100%"  border="0" cellspacing="-2" cellpadding="-2">
                   <tr>
                      <td height="25" align="center"><table width="90%"  border="0" cellspacing="0" cellpadding="0">
                  <tr onMouseOver="this.style.background='#EEEEEE'" onMouseOut="this.style.background=''">
                    <td width="15%">&nbsp;</td>
                    <td width="10%" align="center"><img src="images/folder.gif" width="16" height="16" border="0"> </td>
                    <td width="75%"><a href="goods_type_deal.jsp?Type=<%=subID%>"><%=subType%></a></td>
                  </tr>
              </table></td>
                   </tr>
                 </table>
				 <%	m++;  //注意，该条语句一定不能少
				}while(rs_subType.next());
				%>
		   </td>
			   <%}%>
			  </tr>
             <script language="javascript">
               ShowTR(img1,OpenRep1)  //设置第1个结点为展开状态
               function ShowTR(objImg,objTr){
	           if(objTr.style.display == ""){
		          objTr.style.display = "none";
		          objImg.src = "images/jia.gif";
		          objImg.alt = "展开";
	           }else{
		           objTr.style.display = "";
		           objImg.src = "images/jian.gif";
		           objImg.alt = "折叠";
	           }
             }
            </script>
            <%	}%>
          </table>
    </div>

<div class="small_heading">
            		<h5></h5>
                </div>
				
				<div class="shopby">
            	<div class="small_heading">
            		<h5>商品搜索</h5>
                </div>
                <form name="form2" method="post" action="index.jsp?id=6">
                  <div class="left" id="sst">
<table width="200"  border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
  <td height="7"><p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
<tr>
  <td><p>请输入查询条件　 　
      <select name="type" class="textarea">
      <option value="0" selected>全部分类</option>
      <%
	  while(rs_type.next()){
		  id=rs_type.getInt(1);
		  typename=rs_type.getString(2);%>
      <option value="<%=id%>"><%=typename%></option>
          <%}%>
      </select>
  </p>
    <p>&nbsp; </p>
    <p>价格范围  
      <input name="ps1" type="text" id="ps1" size="6" />
     元 到
       <label>
       <input name="ps2" type="text" id="ps2" size="6" />
       元
       </label>
</p>
    <p>&nbsp; </p>
    <p>    
      <input name="key" type="text" class="textheight">
    </p>
    <p>&nbsp;</p>
    <p>
       　　　　　　　　　　 
         　　
         <input name="search" type="submit" class="btn_grey" value="搜索" />    
        </p></td>
  </tr>
</table></div>
</form>
            </div>
               
			   
                <div class="shopby">
            	<div class="small_heading">
            		<h5>销售排行</h5>
                </div>
				<%while(rs_sold.next()){
				int goodsID=rs_sold.getInt("GoodsID");
				String goodsname=rs_sold.getString("GoodsName");
				String price=rs_sold.getString("GoodsNowPrice");
				String picture=rs_sold.getString("GoodsPicture");
				int sold=rs_sold.getInt("Sold_total");
				
				%>
                <ul><li><a href="goods_details.jsp?id=<%=goodsID%>"><img src="images/<%=picture%>" width="77" height="57"/></a></li>
                  <li>商品名：<%=goodsname%></li>
                  <li>价　格：￥<span class="STYLE1"><%=price%> </span>元　　已售出<span class="STYLE1"><%=sold%></span>件 </li>
                  <li>
                    
                    <%if (session.getAttribute("username")!=null && session.getAttribute("username")!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=goodsID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=goodsID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
						<%
						}
						%>
                    
                  </li>
                </ul>
				<%}%>
            </div>
			
			</div>
</html>
