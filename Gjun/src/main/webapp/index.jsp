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
<form action="LoginController" method="post">
<table align=center border=1px>
	<tr>
		<td colspan=2 align=center><h3>會員登入</h3>
	<tr>
		<td width=80px>帳號：
		<td><input type=text name=username>
	<tr>
		<td width=80px>密碼：
		<td><input type=password name=password>
	<tr>
		<td colspan=2 align=center><input type=submit value=送出>
</table>
</form></div>
<div id="footer"><jsp:include page="footer.jsp"/></div>
</body>
</html>