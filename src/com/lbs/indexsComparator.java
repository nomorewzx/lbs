package com.lbs;

import java.util.Comparator;

public class indexsComparator implements Comparator{
public int compare(Object o1,Object o2){
	indexs i1=(indexs)o1;
	indexs i2=(indexs)o2;
	int result=(i1.mix<i2.mix)?1:((i1.mix==i2.mix)?0:-1);
	if(0==result){
		result=i1.name.compareTo(i2.name);
	}
		return result;
	}
}
