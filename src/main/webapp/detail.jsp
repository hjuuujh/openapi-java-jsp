<%@page import="mission01.service.BookmarkGroupService"%>
<%@page import="mission01.model.BookmarkGroup"%>
<%@page import="java.util.*"%>
<%@page import="mission01.model.Info"%>
<%@page import="mission01.service.InfoService"%>
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
<h2>와이파이 정보 구하기</h2>
	
	<div style="display: flex; flex-direction: column; margin-bottom: 10px;">
            
		<div style="display: flex; align-items: center; ">
			<a href="/">홈 </a> <p>&nbsp | &nbsp</p> 
			<a href="history.jsp">위치 히스토리 목록</a> <p>&nbsp | &nbsp</p> 
			
			<a href="load-wifi.jsp">Open API 와이파이 정보 가져오기</a>  <p>&nbsp | &nbsp</p> 
			<a href="bookmark-list.jsp">북마크 보기</a> <p>&nbsp | &nbsp</p> 
			<a href="bookmark-group.jsp">북마크 그룹 관리</a>
		</div>
		
		<div style="display: flex; align-items: center;">
		<form method="POST" action="bookmark-add-submit.jsp"  >
	<select name="bookmark">
	<option> 북마크 그룹 이름 선택 </option>
		 <%
			String mgrNo = request.getParameter("mgrNo");

	 BookmarkGroupService bookmarkGroupService = new BookmarkGroupService();
	 
	 List<BookmarkGroup> bookmarkGroupList = new ArrayList<>();
	 bookmarkGroupList = bookmarkGroupService.getBookmarkGroupList();

		InfoService infoService = new InfoService();
		Info info = infoService.getInfo(mgrNo);
		 

	  for(BookmarkGroup g : bookmarkGroupList){
		  %>
			<option value="<%= g.getId()+","+g.getName() %>"> <% out.print(g.getName()); %> </option>
			<% } %>
	</select>
		<input type="submit" value="북마크 추가하기">
	<input name="wifiName" type="hidden" value="<%=info.getX_SWIFI_MAIN_NM()%>"/>
	
	</form>
		</div>
	</div>
	
	
	<table id="customers">
	  <tr>
	    <th style="text-align: center">거리(Km)</th>
	    <td><% out.print(info.getDistance()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">관리번호</th>
	    <td><% out.print( info.getX_SWIFI_MGR_NO()); %> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">자치구</th>
	    <td><%  out.print(info.getX_SWIFI_WRDOFC()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">와이파이명</th>
	    <td><a href="/detail.jsp?mgrNo=<%=info.getX_SWIFI_MGR_NO()%>"><%  out.print(info.getX_SWIFI_MAIN_NM()); %> </a></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">도로명주소</th>
	    <td><%  out.print(info.getX_SWIFI_ADRES1()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">상세주소</th>
	    <td><%  out.print(info.getX_SWIFI_ADRES2()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">설치위치(층)</th>
	    <td><%  out.print(info.getX_SWIFI_INSTL_FLOOR()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">설치유형</th>
	    <td><%  out.print(info.getX_SWIFI_INSTL_TY()); %> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">설치기관</th>
	    <td><%  out.print(info.getX_SWIFI_INSTL_MBY()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">서비스구분</th>
	    <td><%  out.print(info.getX_SWIFI_SVC_SE()); %> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">망종류</th>
	    <td><%  out.print(info.getX_SWIFI_CMCWR()); %> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">설치년도</th>
	    <td><%  out.print(info.getX_SWIFI_CNSTC_YEAR()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">실내외구분</th>
	    <td><%  out.print(info.getX_SWIFI_INOUT_DOOR()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">WIFI접속환경</th>
	    <td><%  out.print(info.getX_SWIFI_REMARS3()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">X좌표</th>
	    <td><%  out.print(info.getLAT()); %></td>
	  </tr>
	  <tr>
	    <th style="text-align: center">Y좌표</th>
	    <td><%  out.print(info.getLNT()); %> </td>
	  </tr>
	  <tr>
	    <th style="text-align: center">작업일자</th>
	    <td><%  out.print(info.getWORK_DTTM()); %></td>
	  </tr>
	</table>
	

</body>
</html>