<%@page import="mission01.service.BookmarkGroupService"%>
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
	String id = request.getParameter("id");
	
	BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
	bookmarkGroupService.deleteBookmarkGroup(Integer.parseInt(id));

%>

<script>
	var flag = confirm("북마크 그룹 정보를 삭제하였습니다");
	
	if(flag==true){
		location.href="http://localhost:8080/bookmark-group.jsp";
	}
	</script>



</body>
</html>