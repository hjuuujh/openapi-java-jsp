<%@page import="mission01.service.BookmarkService"%>
<%@page import="mission01.model.Bookmark"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String wifiName = request.getParameter("wifiName");
	String bookmark = request.getParameter("bookmark");
	String [] bookmarkInfo = bookmark.split(",");
	
	String bookmarkName = bookmarkInfo[1];
	String bookmarkgroupId = bookmarkInfo[0];
	BookmarkService bookmarkService = new BookmarkService();
	bookmarkService.addBookmark(Integer.parseInt(bookmarkgroupId), bookmarkName, wifiName);
	
%>



<script>
	var flag = confirm("북마크 정보를 추가하였습니다");
	
	if(flag==true){
		location.href="http://localhost:8080/bookmark-list.jsp";
	}
	</script>



</body>
</html>