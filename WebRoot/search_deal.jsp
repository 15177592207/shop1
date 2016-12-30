<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.wgh.DB.connDB" %>
<%@ page import="com.wgh.DB.chStr"%>
<%
connDB conn=new connDB();
chStr chStr=new chStr();
String username=(String)session.getAttribute("username");
String type=request.getParameter("type");
String ps1=chStr.chStr(request.getParameter("ps1"));
String ps2=chStr.chStr(request.getParameter("ps2"));
String key=chStr.chStr(request.getParameter("key"));
String sql="";
String typename="";
if(type!=null){
	if(!type.equals("0")){
		sql="where superID="+type;
		
		if(!ps1.equals("") && !ps1.equals(null) && !ps2.equals("") && !ps2.equals(null)){
		sql=sql+" and GoodsNowPrice<="+Integer.parseInt(ps2);
		sql=sql+" and GoodsNowPrice>="+Integer.parseInt(ps1);
		}
		
		if(!key.equals("") && !key.equals(null)){
			sql=sql+" and GoodsName like '%"+key+"%'";
			}
			
		ResultSet rs_type=conn.executeQuery("select typename from tb_superType where ID="+type);
		if(rs_type.next()){
			typename=rs_type.getString(1);
		}
	}else{
		typename="全部分类";
					
		if(!ps1.equals("") && !ps1.equals(null) && !ps2.equals("") && !ps2.equals(null)){
		sql=sql+"where GoodsNowPrice<="+Integer.parseInt(ps2);
		sql=sql+" and GoodsNowPrice>="+Integer.parseInt(ps1);
		if(!key.equals("") && !key.equals(null)){
			sql=sql+" and GoodsName like '%"+key+"%' ";
		}
		}
		
		else if(!key.equals("") && !key.equals(null)){
			sql=sql+" where GoodsName like '%"+key+"%' ";
		}
		
		
	}
	sql="select * from V_goods "+sql;
	ResultSet rs_search=conn.executeQuery(sql);
	int num=0;
    int ID=0;
    String goodsName="";
    float nowprice=0;
    String leixin="";
    String introduce="";
    String picture="";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="css/mk.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<div id="mk04">
           <div class="listings">
            	<h4 class="heading"><%=typename%></h4>
				<ul>
<%
				  while(rs_search.next()){
				  
	ID=rs_search.getInt("GoodsID");
	goodsName=rs_search.getString("goodsName");
	leixin=rs_search.getString("GoodsType");
	introduce=rs_search.getString("GoodsIntroduce");
	nowprice=rs_search.getFloat("GoodsNowPrice");
	picture=rs_search.getString("GoodsPicture");
	if(introduce.length()>10){
	  introduce=introduce.substring(0,8)+"...";
	}
				  %>
                	<li>
                    	<a href="goods_details.jsp?id=<%=ID%>" class="thumb"><img src="images/<%=picture%>" alt="" width="154" height="129" /></a><br />
                        <a href="goods_details.jsp?id=<%=ID%>" class="colr bold title"><%=goodsName%></a>    
                        <a href="#" class="addwish clear"><%=leixin%></a><br />
                        <a href="#" class="addwish"><%=introduce%></a><br />
                        <div class="clear"></div>
                        <p class="left price">￥<%=nowprice%></p>
						<%if (username!=null && username!=""){%>
                        <a href="cart_add.jsp?goodsID=<%=ID%>" class="addtocart right cartmarg"><span>放入购物车</span></a>
						<%
						}
						else{
						%>
						<a href="goods_details.jsp?id=<%=ID%>" class="addtocart right cartmarg"><span>查看详情</span></a>
						<%
						}
						
						%>
                  </li>
                    <%					
					}%>
			 </ul>					
					</div>
					<div class="listings">
            	<h4 class="heading"></h4>
				</div>
</div>

</body>
</html>
<%conn.close();
}else{
	out.println("<script language='javascript'>alert('您的操作有误！');window.location.href='index.jsp';</script>");
}%>
