<%@ page contentType="text/html; charset=gb2312" language="java"
	import="java.sql.*" errorPage=""%>
<%@ page import="com.wgh.DB.connDB"%>
<%@ page import="com.wgh.DB.chStr"%>
<%
	connDB conn = new connDB();
	chStr chStr = new chStr();
	ResultSet rs = conn.executeQuery("select * from tb_Member");
%>
<html>
	<head>
		<title>Go购电子商城后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link href="images/skin.css" rel="stylesheet" type="text/css" />
		<link href="../css/styleadd.css" rel="stylesheet">
	</head>

	<body>
		<table width="800" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="17" valign="top" background="images/mail_leftbg.gif">
					<img src="images/left-top-right.gif" width="17" height="29" />
				</td>
				<td width="932" valign="top" background="images/content-bg.gif">
					<table width="100%" height="31" border="0" cellpadding="0"
						cellspacing="0" class="left_topbg" id="table2">
						<tr>
							<td height="31">
								<div class="titlebt">
									会员管理
								</div>
							</td>
						</tr>
					</table>
				</td>
				<td width="16" valign="top" background="images/mail_rightbg.gif">
					<img src="images/nav-right-bg.gif" width="16" height="29" />
				</td>
			</tr>
			<tr>
				<td valign="middle" background="images/mail_leftbg.gif">
					&nbsp;
				</td>
				<td valign="top" bgcolor="#F7F8F9">
					<p>
						<img src="images/hygl.jpg">
					</p>
					<table width="750" height="192" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td valign="top">
								<table width="100%" height="14" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="13" align="center">
											&nbsp;
										</td>
									</tr>
								</table>
								<table width="100%" height="48" border="1" cellpadding="0"
									cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC"
									bordercolorlight="#FFFFFF">
									<tr>
										<td width="14%" height="27" align="center">
											用户名
										</td>
										<td width="14%" align="center">
											真实姓名
										</td>
										<td width="11%" align="center">
											城市
										</td>
										<td width="14%" align="center">
											电话
										</td>
										<td width="26%" align="center">
											Email
										</td>
										<td width="10%" align="center">
											销费额
										</td>
										<td width="11%" align="center">
											冻结/解冻
										</td>
									</tr>
									<%
										String str = (String) request.getParameter("Page");
										if (str == null) {
											str = "0";
										}
										int pagesize = 10;
										rs.last();
										int RecordCount = rs.getRow();
										int maxPage = 0;
										maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize)
												: (RecordCount / pagesize + 1);

										int Page = Integer.parseInt(str);
										if (Page < 1) {
											Page = 1;
										} else {
											if (((Page - 1) * pagesize + 1) > RecordCount) {
												Page = maxPage;
											}
										}
										rs.absolute((Page - 1) * pagesize + 1);
										for (int i = 1; i <= pagesize; i++) {
											int ID = rs.getInt("MemberID");
											String username = rs.getString("MemberName");
											String Truename = rs.getString("MemberTrueName");
											String city = rs.getString("MemberCity");
											String CardNO = rs.getString("MemberCardNO");
											String CardType = rs.getString("MemberCardType");
											float Amount = rs.getFloat("MemberAmount");
											String Tel = rs.getString("MemberTel");
											String Email = rs.getString("MemberEmail");
											int freeze = rs.getInt("MemberFreeze");
									%>

									<tr style="padding: 5px;">
										<td height="24" align="center">
											<a href="member_detail.jsp?ID=<%=ID%>"><%=username%></a>
										</td>
										<td align="center"><%=Truename%></td>
										<td align="center"><%=city%></td>
										<td align="center"><%=Tel%></td>
										<td align="center"><%=Email%></td>
										<td align="center"><%=Amount%></td>
										<td align="center">
											<%
												if (freeze == 0) {
											%><a href="member_freeze.jsp?ID=<%=ID%>"><img
													src="../images/freeze.gif" alt="冻结" width="13" height="15">
											</a>
											<%
												}
											%>
											<%
												if (freeze == 1) {
											%><a href="member_thaw.jsp?ID=<%=ID%>"><img
													src="../images/thaw.gif" alt="解冻" width="15" height="15">
											</a>
											<%
												}
											%>
										</td>
									</tr>
									<%
										try {
												if (!rs.next()) {
													break;
												}
											} catch (Exception e) {
											}
										}
									%>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="27" align="right">
											当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
											<%
												if (Page > 1) {
											%>
											<a href="index.jsp?id=2&&Page=1">第一页</a>
											<a href="index.jsp?id=2&&Page=<%=Page - 1%>">上一页</a>
											<%
												}
												if (Page < maxPage) {
											%>
											<a href="index.jsp?id=2&&Page=<%=Page + 1%>">下一页</a>
											<a href="index.jsp?id=2&&Page=<%=maxPage%>">最后一页&nbsp;</a>
											<%
												}
											%>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td background="images/mail_rightbg.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td valign="bottom" background="images/mail_leftbg.gif">
					<img src="images/buttom_left2.gif" width="17" height="17" />
				</td>
				<td background="images/buttom_bgs.gif">
					<img src="images/buttom_bgs.gif" width="17" height="17">
				</td>
				<td valign="bottom" background="images/mail_rightbg.gif">
					<img src="images/buttom_right2.gif" width="16" height="17" />
				</td>
			</tr>
		</table>
	</body>
</html>
