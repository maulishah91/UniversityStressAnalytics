package com.universities.dao;

import java.util.List;

import com.universities.model.Word;

public interface wordCloudDao{
	
	public List<Word> getWordCloudForUniversity(String univName);
	
}