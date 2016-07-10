package com.cron.job.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.cron.job.vo.JobDetail;

public class CronDAO {

	Logger log = Logger.getLogger(CronDAO.class.getName());

	private static final CronDAO instance = new CronDAO();
	private CronDAO(){
	}
	public static CronDAO getInstance(){
		return instance;
	}
	public Connection getConnection(){
		Connection connection = null;
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		try {
			connection = DriverManager.getConnection(
					"jdbc:postgresql://ec2-54-243-249-159.compute-1.amazonaws.com:5432/d71m607hqfbb4q", "vpstyypsdffzul",
					"YvLN3-Cf3t6eecYcbTxLyxzyuS");
			//"jdbc:postgresql://localhost:5432/cronjob","postgres","postgres");
		} catch (SQLException e) {
			log.severe("SQLException "+e.getMessage());
		}
		if (connection != null) {
			log.info("Database connected!");
		} else {
			log.severe("Failed to make connection!");
		}
		return connection;
	}

	public void insertRecordIntoDbUserTable(String jobname,Date previousfiretime,Date firetime,Date nextfiretime) throws SQLException {
		PreparedStatement statement = null;
		String insertTableSQL = "INSERT INTO public.job_detail(previous_executed_time,executed_time,next_fire_time,job_name,job_type) VALUES (?,?,?,?,?);";
		Connection connection = null;
		try {
			connection = getConnection();
			statement = connection.prepareStatement(insertTableSQL);
			statement.setTimestamp(1,new java.sql.Timestamp(previousfiretime == null ? firetime.getTime() : previousfiretime.getTime()) );
			statement.setTimestamp(2,new java.sql.Timestamp(firetime.getTime()) );
			statement.setTimestamp(3,new java.sql.Timestamp(nextfiretime.getTime()) );
			statement.setString(4, jobname);
			statement.setString(5, jobname);
			statement.executeUpdate();
			log.info("Record is inserted into job_detail table!");
		} catch (SQLException e) {
			log.severe("Failed to make connection! "+e.getMessage());
		} finally {
			if (statement != null) {
				statement.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public int selectRecordsFromTable(String name) throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		String selectSQL = "SELECT executed_time, job_name FROM job_detail WHERE job_name = ?";
		int count = 0;
		try {
			dbConnection = getConnection();
			preparedStatement = dbConnection.prepareStatement(selectSQL);
			preparedStatement.setString(1, name);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				count++;
			}
		} catch (SQLException e) {
			log.severe("SQLException ! "+e.getMessage());
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (dbConnection != null) {
				dbConnection.close();
			}
		}
		return count;
	}

	public List<JobDetail> selectRecordsFromTable() throws SQLException {
		Connection dbConnection = null;
		PreparedStatement preparedStatement = null;
		String selectSQL = "SELECT previous_executed_time,executed_time,next_fire_time,job_name FROM job_detail";
		List<JobDetail> jobList = new ArrayList<JobDetail>(); 
		JobDetail detail = null;
		try {
			dbConnection = getConnection();
			preparedStatement = dbConnection.prepareStatement(selectSQL);
			ResultSet rs = preparedStatement.executeQuery();
			while (rs.next()) {
				detail = new JobDetail();
				detail.setPreviousExecutedTime(new Date(rs.getTimestamp("previous_executed_time").getTime()));
				detail.setNextFireTime(new Date(rs.getTimestamp("next_fire_time").getTime()));
				detail.setExecutedTime(new Date(rs.getTimestamp("executed_time").getTime()));
				detail.setJobName(rs.getString("job_name"));
				jobList.add(detail);
			}
			return jobList;
		} catch (SQLException e) {
			log.severe("SQLException ! "+e.getMessage());
		} finally {
			if (preparedStatement != null) {
				preparedStatement.close();
			}
			if (dbConnection != null) {
				dbConnection.close();
			}
		}
		return null;
	}
}
