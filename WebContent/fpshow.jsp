<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>�����Ƽ�</title>
</head>
<body align="center" bgcolor="#FFFFFFF">
<h5>	
<%String parm=request.getParameter("sqlVname");
  parm = new String(parm.getBytes("iso-8859-1"),"gbk");%>
  
�ο�&nbsp;<%=session.getAttribute("sqlUid")%>&nbsp;����<br><br>
	
	<jsp:useBean id="view" class="com.db.DBConn" scope="page" />	
<%   view.getConn();
     String sql="SELECT view.Vname FROM VIEW WHERE Vid IN ( SELECT Vid1 FROM fpgrowth WHERE Vid IN (SELECT Vid FROM VIEW WHERE Vname LIKE '"+parm+"' ))";
     ResultSet rs=view.executeSQL(sql);
%>
ȥ��&nbsp;<%=parm%>&nbsp;�Ĵ󲿷���Ҳȥ�����¾���:<br><br>
<table align="center" cellpadding="3">
  <%while(rs.next()) {%>
<tr align="center" valign="middle">
<td><%=rs.getString("Vname") %></td>
</tr>
  <%}%>
</table>
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

var point1 = new BMap.Point(108.949881,34.267932); 
var point2 = new BMap.Point(109.219954,34.370398); 
var point3 = new BMap.Point(109.216498,34.358687); 
var point4 = new BMap.Point(108.970561,34.223954); 
var point5 = new BMap.Point(108.980295,34.218782); 
var point6 = new BMap.Point(108.913956,34.252924); 
var point7 = new BMap.Point(108.953567,34.267509); 
var point8 = new BMap.Point(108.949903,34.266395); 


map.enableScrollWheelZoom(); 
map.centerAndZoom(point4, 12); 
map.addControl(new BMap.ScaleControl()); 

var gectrl=new BMap.GeolocationControl( { 
	 anchor:BMAP_ANCHOR_BOTTOM_LEFT, 
	 showAddressBar:true,
	enableAutoLocation: true }); 
	 map.addControl(gectrl); //��Ӷ�λ�ؼ� 

	 var marker1 = new BMap.Marker(point1); 
	 var marker2 = new BMap.Marker(point2);
	 var marker3 = new BMap.Marker(point3); 
	 var marker4 = new BMap.Marker(point4);
	 var marker5 = new BMap.Marker(point5); 
	 var marker6 = new BMap.Marker(point6);
	 var marker7 = new BMap.Marker(point7); 
	 var marker8 = new BMap.Marker(point8);



	 map.addOverlay(marker1);
	 map.addOverlay(marker2);
	 map.addOverlay(marker3);
	 map.addOverlay(marker4);
	 map.addOverlay(marker5);
	 map.addOverlay(marker6);
	 map.addOverlay(marker7);
	 map.addOverlay(marker8);




	 var label1 = new BMap.Label('�����');
	 marker1.setLabel(label1);
	 var label2 = new BMap.Label('�����');
	 marker2.setLabel(label2);
	 var label3 = new BMap.Label('��ɽ');
	 marker3.setLabel(label3);
	 var label4 = new BMap.Label('������');
	 marker4.setLabel(label4);
	 var label5 = new BMap.Label('����ܽ��԰');
	 marker5.setLabel(label5);
	 var label6 = new BMap.Label('��������');
	 marker6.setLabel(label6);
	 var label7 = new BMap.Label('��¥');
	 marker7.setLabel(label7);
	 var label8 = new BMap.Label('��¥');
	 marker8.setLabel(label8);



</script>
</html>