<%@page import="mission01.service.BookmarkService"%>
<%@page import="mission01.model.Bookmark"%>
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
	<h2>북마크 목록</h2>
	
	<div style="float: left; display: flex;  align-items: center;"}>
	<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
	<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
	
	<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> <p>&nbsp | &nbsp</p> 
	<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
	<a href="bookmark-group.jsp">북마크 그룹 관리</a>
	</div>
	
	
	<table id="customers">
	  <tr>
	    <th style="text-align: center">ID</th>
	    <th style="text-align: center">북마크 이름</th>
	    <th style="text-align: center">와이파이명</th>
	    <th style="text-align: center">등록일자</th>
	    <th style="text-align: center">비고</th>
	  </tr>
	  <%
	  BookmarkService bookmarkService = new BookmarkService();
	  List<Bookmark> bookmarkList = new ArrayList<>();
	  bookmarkList = bookmarkService.getBookmarkList();
	  
	  if(bookmarkList.size()>0){
		  for(Bookmark b : bookmarkList){
			  %>
				<tr> 
				<td > <% out.print(b.getId()); %> </td>
				<td> <% out.print(b.getBookmarkName()); %> </td>
				<td> <%  out.print(b.getWifiName()); %> </td>
				<td> <%  out.print(b.getAddDate()); %> </td>
				<td style="text-align: center">  <a href="/bookmark-delete.jsp?id=<%=b.getId()%>"> 삭제 </a>  </td>
			 	</tr>
				<% } %>
	  <% } else{%>
		<tr>
   		 <td colspan='6' style="text-align: center">정보가 존재하지 않습니다</td>
   
  		</tr>
	<% } %>
	 
		
	
	
	
	</table>
</body>
</html>