package com.universities.impl;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.universities.dao.BarPlotDAO;
import com.universities.dao.wordCloudDao;
import com.universities.dao.impl.WordCloudDAOImpl;
import com.universities.model.Bars;
import com.universities.model.Word;
import com.google.gson.*;

/* Visualization : WordCloud
 * This class is created for creating a JSON model for wordcloud using GSON
 */

public class BarPlotImpl{
	
	/* Visualization: bar chart*/
	public String getBarPlot(BarPlotDAO barDAO){
		Gson gson=new Gson();
		List<Bars> cloudObj=barDAO.getBarChart();
		String json=gson.toJson(cloudObj);
		
		return json;

	}
}