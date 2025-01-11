<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="style.css">
</head>
<body>
<div id="title"><jsp:include page="title.jsp"/></div>
<div id="content">
<form action="AddMemberController" method="post">
<table align=center border=1>
	<tr>
		<td width=500px colspan=2><h3>註冊會員</h3>
	<tr>
		<td width=100>姓名：
		<td align="left"><input type=text name=name>
	<tr>
		<td width=100>帳號：
		<td align="left"><input type=text name=username>
	<tr>
		<td width=100>密碼：
		<td align="left"><input type=password name=password>
	<tr>
		<td width=100>地址：
		<td align="left"><input type=text name=address>
	<tr>
		<td width=100>電話：
		<td align="left"><input type=text name=phone>
	<tr>
		<td width=100>行動：
		<td align="left"><input type=text name=mobile>
	<tr>
		<td colspan=2><input type=submit value="註冊">
</table>
</form>
</div>
<div id="footer"><jsp:include page="footer.jsp"/></div>
</body>
</html>