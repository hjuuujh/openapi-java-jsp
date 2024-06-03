<%@page import="mission01.service.BookmarkGroupService"%>
<%@page import="mission01.model.BookmarkGroup"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<% 
	String id = request.getParameter("id");
	BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
	 
	BookmarkGroup bookmarkGroup = bookmarkGroupService.getBookmarkGroup(Integer.parseInt(id));
	%>
	<h2>북마크 그룹</h2>
	<div style="float: left; display: flex;  align-items: center;"}>
		<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
		<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
		
		<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a> <p>&nbsp | &nbsp</p> 
		<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
		<a href="bookmark-group.jsp">북마크 그룹 관리</a>
	
	</div>
	
	<form method="POST" action="bookmark-group-edit-submit.jsp"  >
	<table id="customers">
	  <tr>
	    <th style="text-align: center">북마크 이름</th>
	    <td> <input name="name" value="<%=bookmarkGroup.getName()%>"/> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">순서</th>
	    <td> <input name="rank" value="<%=bookmarkGroup.getRank()%>"/> 
	    	<input name="id" type="hidden" value="<%=bookmarkGroup.getId()%>"/>
	    
	    </td>
	  </tr>
	  <tr>
   		 <td colspan='2' style="text-align: center"><a href="#">돌아가기</a> &nbsp | &nbsp
		<input type="submit" value="수정"></td>
   
  		</tr>
	</table>
	</form>
	

</body>
</html>