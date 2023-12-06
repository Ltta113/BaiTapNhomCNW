<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="Component/MainCSS.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<frameset rows="100,*,100">
    <frame name=T1 src="Navbar.jsp"  frameborder="0">
        <frameset cols="200,*">
            <frame name=T2 src="" frameborder="0">
                <frame name= MainPage src="MainPage.jsp" frameborder="0">

        </frameset>
        <frame name=T5 src="Component/Footer.jsp" frameborder="0">
</frameset>

</html>