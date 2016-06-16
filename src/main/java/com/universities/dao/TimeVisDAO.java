package com.universities.dao;

import java.util.List;
import java.util.Map;

import com.universities.model.TimeLine;

public interface TimeVisDAO{
	public List<TimeLine> getStressValues(String univ1,String univ2);
	public List<String> getAllUniversities();
}