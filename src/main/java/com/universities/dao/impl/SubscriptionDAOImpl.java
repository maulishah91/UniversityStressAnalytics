package com.universities.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;

import com.universities.dao.SubscriptionDAO;
import com.universities.model.Subscription;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class SubscriptionDAOImpl implements SubscriptionDAO{
	private final Logger logger = LoggerFactory.getLogger(SubscriptionDAOImpl.class);
	
	private DataSource dataSource;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	   }
	   
	
	public void insert(Subscription subs){
		
		String sql = "INSERT INTO stressAnalytics.subscription VALUES(?, ?)";
		
		Connection conn = null;
		
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, subs.getEmail());
			ps.setString(2, subs.getTwitterHandle());
			logger.info("performing an insert: "+ps.execute());
			ps.close();
			
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
			
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) { e.printStackTrace(); //change this later for proper error handling}
			}
		}
	}
	}
	
	@Override
	public boolean findByTwitterHandle(String twitterHandle) {
		
		logger.info("Entered find by twitter handle function");
		String sql = "SELECT * FROM stressAnalytics.subscription WHERE twitter_handle = ?";
		
		Connection conn = null;
		boolean valueAlreadyExists=false;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, twitterHandle);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				valueAlreadyExists=true;
			}
			rs.close();
			ps.close();
			return valueAlreadyExists;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {e.printStackTrace();}
			}
		}
	}

	@Override
	public boolean findByEmail(String email) {
		
		
		logger.info("Entered the find by email function");
		String sql = "SELECT * FROM stressAnalytics.subscription WHERE email = ?";
		
		Connection conn = null;
		boolean valueAlreadyExists=false;
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				logger.info("email already exists");
				valueAlreadyExists=true;
			}
			rs.close();
			ps.close();
			return valueAlreadyExists;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
				conn.close();
				} catch (SQLException e) {e.printStackTrace();}
			}
		}
	}
}



