package com.universities.model;

import java.util.HashMap;
import java.util.Map;

public class Maps{
	int value=0;
	String label;
	Map<String,Integer> maps;
	public Maps(){
		maps=new HashMap<String,Integer>();
	}
	
	public void setValue(String state,int value){
		if(maps.containsKey(state)){
			int val=maps.get(state);
			val+=value;
			maps.put(state, val);
		}
		else maps.put(state, value);
	}
	
	public Map<String,Integer> getMaps(){
		return maps;
	}
	
}