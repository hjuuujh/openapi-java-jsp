<%@page import="mission01.service.BookmarkService"%>
<%@page import="mission01.model.Bookmark"%>

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
	BookmarkService bookmarkService = new BookmarkService();
	 
	Bookmark bookmark = bookmarkService.getBookmark(Integer.parseInt(id));
	%>
	<h2>북마크</h2>
	<div style="display: flex; flex-direction: column; margin-bottom: 10px;">
            
		<div style="display: flex; align-items: center; ">
			<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
			<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
			
			<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>  <p>&nbsp | &nbsp</p> 
			<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
			<a href="bookmark-group.jsp">북마크 그룹 관리</a>
		</div>
		<div style="display: flex; align-items: center;">
			<p>북마크를 삭제하시겠습니까?</p>
		</div>
	</div>

	<form method="POST" action="bookmark-delete-submit.jsp"  >
	<br/>
	<table id="customers">
	  <tr>
	    <th>북마크 이름</th>
	    <td> <% out.print(bookmark.getBookmarkName()); %> </td>
	  </tr>
	  <tr>
	    <th>와이파이명</th>
	    <td> <% out.print(bookmark.getWifiName()); %>	    
	    </td>
	  </tr>
	   <tr>
	    <th>등록일자</th>
	    <td> <% out.print(bookmark.getAddDate()); %>
	    	<input name="id" type="hidden" value="<%=bookmark.getId()%>"/>
	    </td>
	  </tr>
	  <tr>
   		 <td colspan='2' style="text-align: center"><a href="#">돌아가기</a> &nbsp | &nbsp
		<input type="submit" value="삭제"></td>
   
  		</tr>
	</table>
	</form>
	

</body>
</html>