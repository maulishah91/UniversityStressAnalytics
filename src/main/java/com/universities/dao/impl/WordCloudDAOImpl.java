package com.universities.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.universities.dao.wordCloudDao;
import com.universities.model.Word;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class WordCloudDAOImpl implements wordCloudDao{
	private final Logger logger = LoggerFactory.getLogger(WordCloudDAOImpl.class);
	
	private DataSource dataSource;
	   
	   public void setDataSource(DataSource dataSource) {
	      this.dataSource = dataSource;
	   }
	   

	@Override
	public List<Word> getWordCloudForUniversity(String univName) {
		
		
		logger.info("Entered the find by university name");
		String sql = "SELECT * FROM stressAnalytics.wordCloud WHERE tagName = ? ORDER BY size DESC";
		
		Connection conn = null;
		List<Word> words=new ArrayList<Word>();
		try {
			conn = dataSource.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, univName.toLowerCase());
			ResultSet rs = ps.executeQuery();
			Word oneword;
			int biggestSize=1;
			if (rs.next()) {
				biggestSize = rs.getInt("size");
				oneword=new Word();
				oneword.setText(rs.getString("word"));
				oneword.setSize(100);
				words.add(oneword);
			}
			while(rs.next()){
				int size = rs.getInt("size");
				size = (size*100)/biggestSize;
				if(size<25){
					if(size<20)size=15;
					else size=25;
				}
				oneword=new Word();
				oneword.setText(rs.getString("word"));
				oneword.setSize(size);
				words.add(oneword);
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
		return words;
	}

}



