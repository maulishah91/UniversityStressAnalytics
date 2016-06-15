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
import com.universities.dao.TimeVisDAO;
import com.universities.model.Maps;
import com.universities.model.Word;
import com.universities.model.MyMap;
import com.universities.model.TimeLine;

/* Visualization : WordCloud
 * This class is created for creating a JSON model for time visualization of 2 universities using GSON
 */

public class TimeVisImpl{
	
	/* Visualization: time visualization*/
	
	public String getTimeVisValues(TimeVisDAO timeVisDao,String univ1,String univ2){
		Gson gson=new Gson();
		List<TimeLine> timeVal=timeVisDao.getStressValues(univ1,univ2);
		String json=gson.toJson(timeVal);	
		return json;
	}
}