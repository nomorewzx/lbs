<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script>
function getLocation()
  {
  if (navigator.geolocation)
    {
    	navigator.geolocation.getCurrentPosition(showPosition);
    }
  }
function showPosition(position)
{
	var lat=position.coords.latitude ;
	var lon=position.coords.longitude;
	window.location.href = "lbsshow.jsp?lat=" + lat + "&lon=" + lon;
alert( "�����ڵ�λ�ã� γ��" + lat + "������" + lon );
}
</script>
<title>�����Ƽ�</title>
</head>
<body align="center" bgcolor="#FFFFFFF">
<h5>
	<%String parm=request.getParameter("sqlUid"); %>
	<%session.setAttribute("sqlUid",parm);%>
	�ο�&nbsp;<%=parm%>&nbsp;���ã�������Ϊ���Ƽ��ľ��㣺<br><br>
	
<jsp:useBean id="view" class="com.db.DBConn" scope="page" />
<%   view.getConn();
     String sql="select view.*,recommendation.* from view,recommendation where view.Vid=recommendation.Vid and Uid like "+parm+" order by indexs desc";
     ResultSet rs=view.executeSQL(sql);
%>

<table align="center" cellpadding="3">
<tr align="center" valign="middle">
<td>������</td><td>�Ƽ�ֵ</td>
</tr>
  <%while(rs.next()) {%>
<tr align="center" valign="middle">
<td align="center"><%=rs.getString("Vname") %></td>
<td align="center"><%=rs.getString("indexs") %></td>
</tr>
  <%}%>
</table>&nbsp;&nbsp;
<!-- <form action="lbsshow.jsp" method="post" onSubmit="getLocation()" -->
<label>������ص���λ�ý���LBS��Ȩ���Ƽ���</label><br><br>
<input type="button" value="GPS��λ" onClick="getLocation()">
</form>
</h5>




</body>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2&ak=9eiQnZ7UH3GiN743euNmN1W8"></script>
<style type="text/css">
#mapContainer {
	width: 100%;
	height:400px;
	border: 1px solid gray;
}
</style>
<div id="mapContainer"></div>

<script type="text/javascript"> 
var map = new BMap.Map("mapContainer"); 

var point1 = new BMap.Point(109.291934,34.39444); 
var point2 = new BMap.Point(109.219954,34.370398); 
var point3 = new BMap.Point(109.216498,34.358687); 
var point4 = new BMap.Point(108.945837,34.244196); 
var point5 = new BMap.Point(108.948501,34.245497); 
var point6 = new BMap.Point(108.913956,34.252924); 
var point7 = new BMap.Point(108.953567,34.267509); 
var point8 = new BMap.Point(108.949903,34.266395); 
var point9 = new BMap.Point(108.949881,34.267932); 
var point10 = new BMap.Point(108.953318,34.258235); 

map.enableScrollWheelZoom(); 
map.centerAndZoom(point4, 12); 
map.addControl(new BMap.ScaleControl()); 

var gectrl=new BMap.GeolocationControl( { 
	 anchor:BMAP_ANCHOR_BOTTOM_LEFT, 
	 showAddressBar:true,
	enableAutoLocation: true }); 
	 map.addControl(gectrl); //���Ӷ�λ�ؼ� 

	 var marker1 = new BMap.Marker(point1); 
	 var marker2 = new BMap.Marker(point2);
	 var marker3 = new BMap.Marker(point3); 
	 var marker4 = new BMap.Marker(point4);
	 var marker5 = new BMap.Marker(point5); 
	 var marker6 = new BMap.Marker(point6);
	 var marker7 = new BMap.Marker(point7); 
	 var marker8 = new BMap.Marker(point8);
	 var marker9 = new BMap.Marker(point9); 
	 var marker10 = new BMap.Marker(point10);


	 map.addOverlay(marker1);
	 map.addOverlay(marker2);
	 map.addOverlay(marker3);
	 map.addOverlay(marker4);
	 map.addOverlay(marker5);
	 map.addOverlay(marker6);
	 map.addOverlay(marker7);
	 map.addOverlay(marker8);
	 map.addOverlay(marker9);
	 map.addOverlay(marker10);


	 var label1 = new BMap.Label('����ٸ');
	 marker1.setLabel(label1);
	 var label2 = new BMap.Label('�����');
	 marker2.setLabel(label2);
	 var label3 = new BMap.Label('��ɽ');
	 marker3.setLabel(label3);
	 var label4 = new BMap.Label('С����');
	 marker4.setLabel(label4);
	 var label5 = new BMap.Label('��������Ժ');
	 marker5.setLabel(label5);
	 var label6 = new BMap.Label('��������');
	 marker6.setLabel(label6);
	 var label7 = new BMap.Label('��¥');
	 marker7.setLabel(label7);
	 var label8 = new BMap.Label('��¥');
	 marker8.setLabel(label8);
	 var label9 = new BMap.Label('�����');
	 marker9.setLabel(label9);
	 var label10 = new BMap.Label('����ǽ');
	 marker10.setLabel(label10);


</script>
</html>