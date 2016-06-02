package com.universities.dao.impl;
import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.sql.DataSource;

import com.universities.dao.StressStateDAO;
import com.universities.dao.wordCloudDao;
import com.universities.model.Maps;
import com.universities.model.Word;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class StressStateDAOImpl implements StressStateDAO{
	private final Logger logger = LoggerFactory.getLogger(StressStateDAOImpl.class);
	private List<String> allUniversities=new ArrayList<String>();
	private DataSource dataSource;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	   }

	@Override
	public Map<String,Integer> getStressStateValues() {
		logger.info("Entered the find the university with stress values and the state they belong to");
		String sql = "SELECT * FROM stressAnalytics.universityStateMapping where university in (";
		
		Connection conn = null;
		Maps maps=new Maps();
		Map<String,Integer> universityScores=getUnivScores();
		
		try {
			conn = dataSource.getConnection();
			
			int len=getAllUniversities().size();
			for(int i=0;i<len;i++){
				sql+="?";
				if((i+1)<len){
					sql+=",";
				}
				
			}
			sql+=")";
			PreparedStatement ps = conn.prepareStatement(sql);
			logger.info(sql);
			for(int i=0;i<len;i++){
				ps.setString(i+1, getAllUniversities().get(i));
			}
			
			ResultSet rs = ps.executeQuery();
			String univName="";
			String state ="";
			int value= 0;
			logger.info("Getting value for each state");
			
			while (rs.next()) {
				univName=rs.getString("university");
				state=rs.getString("state");
				value=universityScores.get(univName);
				maps.setValue(state, value);
				}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {e.printStackTrace();}
			}
		}
		//if no values are found, a blank map is returned
		return maps.getMaps();

	}
	
	
	
	
	public List<String> getAllUniversities() {
		return allUniversities;
	}

	public void setAllUniversities(String allUniversities) {
		
		this.allUniversities.add(allUniversities);
	}

	private Map<String,Integer> getUnivScores(){
		String sql_scores ="SELECT * FROM stressAnalytics.universityScore";
		Connection conn = null;
		Map<String,Integer> universityScores=new HashMap<String,Integer>();
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql_scores);
			ResultSet rs = ps.executeQuery();
			String univName="";
			int value=0;
			while (rs.next()) {
				univName=rs.getString("university");
				value=rs.getInt("score");
				universityScores.put(univName,value);
				setAllUniversities(univName);
			}
			logger.info("All states "+getAllUniversities());
			rs.close();
			ps.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {e.printStackTrace();}
			}
		}
		return universityScores;
	}

}



