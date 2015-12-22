package com.lbs;

import java.util.ArrayList;

public class indexs {
    public String name;
    public Double juli;
    public Double mix;
	indexs(String name,Double juli,Double mix)
	{
		this.name=name;
		this.juli=juli;
		this.mix=mix;
	}
	public ArrayList ArrayList(){
	ArrayList List = new ArrayList();
	List.add(this.name); 
	List.add(this.mix);
	List.add(this.juli);
	return List; 
	}
}