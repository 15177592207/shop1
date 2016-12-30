<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
ResultSet rs=conn.executeQuery("select * from tb_picture_show");
int ID=0;
String goodsname="";
String picture1="";
String picture2="";
String picture3="";
String picture4="";
while(rs.next()){                                                                                                                                                                                                                                                                                                                
ID=rs.getInt("GoodsID");
goodsname=rs.getString("GoodsName");
picture1=rs.getString("GoodsPicture");
picture2=rs.getString("GoodsPicture1");
picture3=rs.getString("GoodsPicture2");
picture4=rs.getString("GoodsPicture3");
}
ResultSet rs_new=conn.executeQuery("select * from tb_goods where IsNew=1");
int new_ID=0;
String new_goodsname="";
String new_picture1="";
String new_picture2="";
String new_picture3="";
String new_picture4="";
%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

</head>
<body>
   <div>
  
      <div>
        <p>请选择今天的商品</p>
        <p>商品名：</p>
       <form id="form1" name="form1" method="post" action="goods_show_deal.jsp">
                      <label>
					  
                      <select name="goodsname" id="goodsname">
                        
						<%while(rs_new.next()){
						new_goodsname=rs_new.getString("GoodsName");					
						%>
                        <option><%=new_goodsname%></option>                          <%}%>   
                        <option><%=goodsname%></option>                       <option selected><%=goodsname%></option>                                                                                
                      </select>
                    </label>
                      <label>
                      　　
                      <input type="submit" name="Submit" value="修改">
                      </label>
					</form>
					<table>
                  
                  
                  <tr>
                    <td height="57" colspan="4" align="left"><p>商品展示一级图片 　 <img src="../images/<%=picture1%>" width=154" height="129"> 　　商品展示二级图片　 <img src="../images/<%=picture2%>" width=154" height="129"> </p>
                      <p>商品展示三级图片 　 <img src="../images/<%=picture3%>" width=154" height="129">　　 商品展示四级图片　 <img src="../images/<%=picture4%>" width=154" height="129"></p>
                    </td>
                  </tr>
                  
                  <tr>
                    <td height="38" colspan="4" align="left">
                        　　　　　　　                    </td>
                  </tr>
                </table>
        
      </div>
   
   
   
   </div>
</body>
</html>
<%conn.close();%>
