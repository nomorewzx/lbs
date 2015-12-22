package com.lbs;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;

import com.db.DBConn;

public class lbsmain {
	public lbsmain(){}
public  static ResultSet getLatLon(String parm) //数据库查询
	{
		DBConn.getConn();
		String sql="select view.*,recommendation.* from view,recommendation where view.Vid=recommendation.Vid and Uid like "+parm+"";
		ResultSet rs=DBConn.executeSQL(sql);
		return rs;
	}
public static double[] getDistance(double lat1, double lon1, double lat2, double lon2) //距离和距离权值计算
{
	    double sweighted;//距离权值
		double radLat1 = lat1 * Math.PI / 180;
		double radLat2 = lat2 * Math.PI / 180;
		double a = radLat1 - radLat2;
		double b = lon1 * Math.PI / 180 - lon2 * Math.PI / 180;
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
				+ Math.cos(radLat1) * Math.cos(radLat2)
				* Math.pow(Math.sin(b / 2), 2)));
		s = s * 6378137;
		s = Math.round(s * 10000) / 10000;//两点间距离
		s = s / 1000;
		if(s>5){
			sweighted = Math.pow(0.9, Math.log10(1000*s+1)); //距离权值
		}
		else 
			{ sweighted = 1; //5km以内，距离权值为1。
		}
		double[] res = {sweighted,s};
		return res;
    }

//public static void main(String args[]){
//	double lat1 = 34.159134;
//	double lon1 = 108.902888;
//	double lat2;
//	double lon2;
//	double index;
//	double[] t = new double[2];
//	ResultSet rs=getLatLon(parm);
//	try{
//		ArrayList<indexs>  al= new ArrayList<indexs>();
//		while(rs.next())
//		{
//			lat2=rs.getDouble(4);
//			lon2=rs.getDouble(3);
//			String name=rs.getString(2);
//			index=rs.getDouble("indexs");
//			t=getDistance(lat1,lon1,lat2,lon2);
//			double lbsindex=index*t[0];
//			al.add(new indexs(name,t[1],lbsindex));
//		}
//		Collections.sort(al,new indexsComparator());
//		for(int i=0; i<al.size(); i++)
//		{
//			System.out.println(al.get(i).name+",22="+al.get(i).juli+",3="+al.get(i).mix);
//		}
//		
//	}catch(Exception ex)
//	{
//		System.out.println("exception="+ex.getMessage());
//	}
//}

public static ArrayList<indexs> copymain(String lat1, String lon1,String parm){
	double lat2;
	double lon2;
	double index;
	double lat = Double.parseDouble(lat1);
	double lon = Double.parseDouble(lon1);
	double[] t = new double[2];
	ResultSet rs=getLatLon(parm);
	try{
		ArrayList<indexs>  al= new ArrayList<indexs>();
		while(rs.next())
		{
			lat2=rs.getDouble(4);
			lon2=rs.getDouble(3);
			String name=rs.getString(2);
			index=rs.getDouble("indexs");
			t=getDistance(lat,lon,lat2,lon2);
			double lbsindex=index*t[0];
			al.add(new indexs(name,t[1],lbsindex));
		}
		Collections.sort(al,new indexsComparator());
		return al;
	}catch(Exception ex)
	{
		System.out.println("exception="+ex.getMessage());
		return null;
	}
}

}