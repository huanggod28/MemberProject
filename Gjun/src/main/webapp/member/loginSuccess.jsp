<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../style.css"><!-- html語法../=回到上一層 -->
</head>
<body>
<div id="title"><jsp:include page="/title.jsp"/></div><!-- /java指的是最上層webapp -->
<div id="content"><h3>登入成功</h3>
<a href="../LogoutController">登出</a><br>
<a href="member.jsp">進入會員管理</a>
<br>
<h3>${Member.getName()}歡迎</h3>  <!-- 抓logincomtroller member資訊 -->
<h3>以下為你的登入資訊</h3>
姓名:${Member.getName() }<br>
帳號:${Member.getUsername() }<br>
地址:${Member.getAddress() }<br>
電話:${Member.getPhone() }<br>
行動:${Member.getMobile() }
</div>
<div id="footer"><jsp:include page="/footer.jsp"/></div>
</body>
</html>