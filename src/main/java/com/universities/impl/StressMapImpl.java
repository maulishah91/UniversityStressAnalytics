package com.universities.impl;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.google.gson.*;
import com.universities.dao.StressStateDAO;
import com.universities.model.Maps;
import com.universities.model.Word;
import com.universities.model.MyMap;

/* Visualization : WordCloud
 * This class is created for creating a JSON model for stressMap using GSON
 */

public class StressMapImpl{
	
	/* Visualization: stressMap*/
	public String getStressStateValues(StressStateDAO stateDao){
		Gson gson=new Gson();
		Map<String,Integer> cloudObj=stateDao.getStressStateValues();
		List<MyMap> maps=new ArrayList<MyMap>();
		MyMap mapObj=new MyMap();
		for(Entry<String,Integer> e : cloudObj.entrySet()){
			mapObj=new MyMap();
			mapObj.setLabel(e.getKey());
			mapObj.setValue(e.getValue());
			maps.add(mapObj);
		}
		String json=gson.toJson(maps);	
		return json;

	}
}