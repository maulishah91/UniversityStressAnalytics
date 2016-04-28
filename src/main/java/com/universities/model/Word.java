package com.universities.model;

/* Visualization : WordCloud
 * This class is created for creating a JSON model for wordcloud using GSON
 */

public class Word{
	String text="";
	int size=0;
	
	
	
	public String getText() {
		return text;
	}



	public void setText(String text) {
		this.text = text;
	}



	public int getSize() {
		return size;
	}



	public void setSize(int size) {
		this.size = size;
	}



	@Override
	public String toString() {
	   return "Word[text"+text+"size"+size+"]";
	}
}