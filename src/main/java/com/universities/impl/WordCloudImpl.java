package com.universities.impl;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.universities.model.Word;
import com.google.gson.*;

/* Visualization : WordCloud
 * This class is created for creating a JSON model for wordcloud using GSON
 */

public class WordCloudImpl{
	
	/* Visualization: wordcloud
	 * Dummy json code. Needs Data from backend
	 */
	public String getWordCloud(String univName){
		Gson gson=new Gson();
		List<Word> cloudObj=new ArrayList<Word>();
		Word w[]=new Word[10];
		int i=60;
		for(Word one:w){
			one=new Word();
			one.setText(((char)i++)+"");
			one.setSize(50);
			cloudObj.add(one);
		}
		
		String json=gson.toJson(cloudObj);
		
		return json;

	}
}