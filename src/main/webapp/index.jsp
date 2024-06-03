<%@page import="mission01.service.HistoryService"%>
<%@page import="mission01.api.DBConnection"%>
<%@page import="mission01.service.InfoService"%>
<%@page import="mission01.model.Info"%>
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

	<script>
	
	function getPosition(){
		navigator.geolocation.getCurrentPosition((pos) => {
			var lat = pos.coords.latitude;
			var lnt = pos.coords.longitude;
			const lntElement = document.getElementById("lnt");
			const latElement = document.getElementById("lat");
			if (lnt) {
			    lntElement.setAttribute("value", lnt);
			}
			if (lat) {	    
			    latElement.setAttribute("value", lat);
			}
			});
		
		
	};
	
	function getWifi(){
		var lat = document.getElementById("lat").value;
		var lnt = document.getElementById("lnt").value;
		var url = "http://localhost:8080/?lat="+lat+"&lnt="+lnt;
		location.replace(url);
	}
	
	
	
	</script>
	
	
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
			<p>LAT: </p> <p> &nbsp</p>  <input type="text" id="lat" /> 
			<p>&nbsp,   &nbsp</p> 
			<p>LNT: </p> <p> &nbsp</p>  <input type="text" id="lnt" />
			<script>
			const urlParams = new URL(location.href).searchParams;
			const lntElement = document.getElementById("lnt")
			const latElement = document.getElementById("lat")
			const lat = urlParams.get('lat');
			const lnt = urlParams.get('lnt');
			
			if(lat!=null&&lnt!=null){
		    lntElement.setAttribute("value", lnt);
		    latElement.setAttribute("value", lat);
			
			}else{
				lntElement.setAttribute("value", "0.0");
			    latElement.setAttribute("value", "0.0");
				
			}
			</script>
			<p>&nbsp</p> 
			<input type="button" value="내 위치 가져오기" onclick="getPosition(); "/>
			<p> &nbsp</p> 
			<input type="button" value="근처 WIFI 정보 보기" onclick="getWifi()"/>
			
		</div>
	</div>
	
	<table id="customers">
	  <tr>
	    <th style="text-align: center">거리(Km)</th>
	    <th style="text-align: center">관리번호</th>
	    <th style="text-align: center">자치구</th>
	    <th style="text-align: center">와이파이명</th>
	    <th style="text-align: center">도로명주소</th>
	    <th style="text-align: center">상세주소</th>
	    <th style="text-align: center">설치위치(층)</th>
	    <th style="text-align: center">설치유형</th>
	    <th style="text-align: center">설치기관</th>
	    <th style="text-align: center">서비스구분</th>
	    <th style="text-align: center">망종류</th>
	    <th style="text-align: center">설치년도</th>
	    <th style="text-align: center">실내외구분</th>
	    <th style="text-align: center">WIFI접속환경</th>
	    <th style="text-align: center">X좌표</th>
	    <th style="text-align: center">Y좌표</th>
	    <th style="text-align: center">작업일자</th>
	  </tr>
	  <%
	  
	  
	  
	String lat = request.getParameter("lat");
	String lnt = request.getParameter("lnt");
	
	List<Info> infoList = new ArrayList<>();
	if(lat!=null&& lnt!=null){
		
		HistoryService historyService = new HistoryService();
		historyService.addHistory(lat, lnt);
		
		InfoService infoService = new InfoService();
		infoList = infoService.getInfoList(lat, lnt);
	
	
	for(Info i : infoList){
		%>
		<tr> 
		<td> <% out.print(i.getDistance()); %> </td>
		<td> <% out.print( i.getX_SWIFI_MGR_NO()); %> </td>
		<td> <%  out.print(i.getX_SWIFI_WRDOFC()); %> </td>
		<td> <a href="/detail.jsp?mgrNo=<%=i.getX_SWIFI_MGR_NO()%>"><%  out.print(i.getX_SWIFI_MAIN_NM()); %> </a></td>
		<td> <%  out.print(i.getX_SWIFI_ADRES1()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_ADRES2()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_INSTL_FLOOR()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_INSTL_TY()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_INSTL_MBY()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_SVC_SE()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_CMCWR()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_CNSTC_YEAR()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_INOUT_DOOR()); %> </td>
	 	<td> <%  out.print(i.getX_SWIFI_REMARS3()); %> </td>
	 	<td> <%  out.print(i.getLAT()); %> </td>
	 	<td> <%  out.print(i.getLNT()); %> </td>
	 	<td> <%  out.print(i.getWORK_DTTM()); %> </td>
	 	</tr>
		<% } %>
		
	
	<% } else{%>
		<tr>
    <td colspan='17' style="text-align: center">위치 정보를 입력한 후에 조회해 주세요</td>
   
  </tr>
	<% } %>
	
	</table>
	
	
</body>
</html>