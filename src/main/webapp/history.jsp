<%@page import="mission01.service.HistoryService"%>
<%@page import="mission01.model.History"%>
<%@page import="mission01.api.DBConnection"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>와이파이 정보 구하기</title>

<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>

</head>
<body>
	<h2>위치 히스토리 목록</h2>
	
	<div style="float: left; display: flex;  align-items: center;"}>
	<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
	<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
	
	<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> <p>&nbsp | &nbsp</p> 
	<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
	<a href="bookmark-group.jsp">북마크 그룹 관리</a>
	</div>
	
	
	<table id="customers">
	  <tr>
	    <th>ID</th>
	    <th>X좌표</th>
	    <th>Y좌표</th>
	    <th>조회일자</th>
	    <th>비고</th>
	  </tr>
	  <%
	  HistoryService historyService = new HistoryService();
	  List<History> historyList = new ArrayList<>();
	  historyList = historyService.getHistoryList();
	  for(History h : historyList){
		  %>
			<tr> 
			<td> <% out.print(h.getId()); %> </td>
			<td> <% out.print(h.getX()); %> </td>
			<td> <%  out.print(h.getY()); %> </td>
			<td> <%  out.print(h.getDate()); %> </td>
			<td> <button> 삭제 </button> </td>
		 	</tr>
			<% } %>
		
	
	
	
	</table>
</body>
</html>