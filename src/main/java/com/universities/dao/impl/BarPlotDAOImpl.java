package com.universities.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.universities.dao.BarPlotDAO;
import com.universities.dao.SubscriptionDAO;
import com.universities.model.Bars;
import com.universities.model.Subscription;
import com.universities.model.Word;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class BarPlotDAOImpl implements BarPlotDAO{
	private final Logger logger = LoggerFactory.getLogger(BarPlotDAOImpl.class);
	
	private DataSource dataSource;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	   }
	   
	   public List<Bars> getBarChart(){	
				
				logger.info("Entered the find by university name");
				String sql = "SELECT * FROM stressAnalytics.universityScore";
				
				Connection conn = null;
				List<Bars> bars=new ArrayList<Bars>();
				try {
					conn = dataSource.getConnection();
					PreparedStatement ps = conn.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					Bars oneword;
					while (rs.next()) {
						oneword=new Bars();
						oneword.setLetter(rs.getString("university"));
						oneword.setFrequency(rs.getInt("positiveScore"));
						bars.add(oneword);
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
				//if no values are found, a blank list is returned
				return bars;
			}
	}



