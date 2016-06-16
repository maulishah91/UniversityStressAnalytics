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
import com.universities.dao.TimeVisDAO;
import com.universities.dao.wordCloudDao;
import com.universities.model.Maps;
import com.universities.model.TimeLine;
import com.universities.model.Word;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class TimeVisDAOImpl implements TimeVisDAO{
	private final Logger logger = LoggerFactory.getLogger(TimeVisDAOImpl.class);
	private List<String> allUniversities=new ArrayList<String>();
	private DataSource dataSource;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	   }

	@Override
	public List<TimeLine> getStressValues(String univ1,String univ2) {
		logger.info("Entered the find the time vis for 2 universities");
		String sql = "SELECT * FROM stressAnalytics.timeVis where university in (?,?) ORDER BY startTime";
		
		Connection conn = null;
		ArrayList<TimeLine> allTimeVal=new ArrayList<TimeLine>();
		TimeLine eachTimeVal=null;
		
		try {
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			logger.info(sql);
			ps.setString(1, univ1);
			ps.setString(2, univ2);
			
			ResultSet rs = ps.executeQuery();
			
			
			logger.info("Getting value for each univ");
			
			while (rs.next()) {
				
				eachTimeVal=new TimeLine();
				eachTimeVal.setCol(rs.getString("university"));
				eachTimeVal.setIdx(rs.getString("startTime"));
				eachTimeVal.setVal((double)rs.getFloat("dailyNegativeTweetCount"));
				allTimeVal.add(eachTimeVal);
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
		logger.debug("total val obtained "+allTimeVal.size());
		//if no values are found, a blank list is returned
		return allTimeVal;

	}

	@Override
	public List<String> getAllUniversities() {
		logger.info("Entered to fetch all universities");
		String sql = "SELECT university FROM stressAnalytics.universityScore";
		
		Connection conn = null;
		List<String> allUniv=new ArrayList<String>();
		
		try {
			conn = dataSource.getConnection();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			logger.info(sql);
			
			ResultSet rs = ps.executeQuery();
			
			
			logger.info("Getting value for each univ");
			
			while (rs.next()) {
				
				allUniv.add(rs.getString("university"));
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
		logger.info("all univ "+allUniv.size());
		return allUniv;
	}

}



