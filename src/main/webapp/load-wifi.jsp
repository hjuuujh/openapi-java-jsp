<%@page import="mission01.api.OpenApi"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align: center" >
<h1 >
<% 
	int totalCnt = OpenApi.getTotal();
	OpenApi.deleteInfo();
	OpenApi.getWifiInfo(totalCnt);
	out.print(totalCnt);
	%>
	개의 WIFI 정보를 정상적으로 저장하였습니다.
	</h1>
	<a href="index.jsp">홈 으로가기 </a> 
</div>
</body>
</html>