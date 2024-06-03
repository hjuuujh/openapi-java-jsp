<%@page import="mission01.service.BookmarkGroupService"%>
<%@page import="mission01.model.BookmarkGroup"%>
<%@page import="java.util.*"%>

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
	<h2>북마크 그룹</h2>
	<div style="display: flex; flex-direction: column; margin-bottom: 10px;">
            
		<div style="display: flex; align-items: center; ">
			<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
			<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
			
			<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>  <p>&nbsp | &nbsp</p> 
			<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
			<a href="bookmark-group.jsp">북마크 그룹 관리</a>
		</div>
		
		<div style="display: flex; align-items: center;">
		<button onclick="location.href='bookmark-group-add.jsp'"> 북마크 그룹 이름 추가 </button>
			
		</div>
	</div>
	
	<table id="customers">
	  <tr>
	    <th style="text-align: center">ID</th>
	    <th style="text-align: center">북마크 이름</th>
	    <th style="text-align: center">순서</th>
	    <th style="text-align: center">등록일자</th>
	    <th style="text-align: center">수정일자</th>
	    <th style="text-align: center">비고</th>
	  </tr>
	 <%
	 
	 BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
	 
	 List<BookmarkGroup> bookmarkGroupList = new ArrayList<>();
	 bookmarkGroupList = bookmarkGroupService.getBookmarkGroupList();
	 
	 if(bookmarkGroupList.size()>0){
		 
	 
	  for(BookmarkGroup g : bookmarkGroupList){
		  %>
			<tr> 
			<td> <% out.print(g.getId()); %> </td>
			<td> <% out.print(g.getName()); %> </td>
			<td> <%  out.print(g.getRank()); %> </td>
			<td> <%  out.print(g.getAddDate()); %> </td>
			<td> <%  if(g.getUpdateDate()==null) out.print("");
			else out.print(g.getUpdateDate());
				 %> </td>
			
			<td style="text-align: center"> <a href="/bookmark-group-edit.jsp?id=<%=g.getId()%>"> 수정 </a> &nbsp;
			<a href="/bookmark-group-delete.jsp?id=<%=g.getId()%>"> 삭제 </a> 
			</td>
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