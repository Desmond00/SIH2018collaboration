package tpc;

import java.sql.*;

public class Connect{
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String DB_URL = "jdbc:oracle:thin:@192.168.137.1:1521:XE";
	// Database credentials
	static final String USER = "ADMISSION_JOB";
	static final String PASS = "123456"
			+ "";

	//public Connection Conn(){
	public Connection Conn(){
		Connection conn = null;
		try{
			
			// Register JDBC driver
			Class.forName(JDBC_DRIVER);
			// Open a connection
			System.out.println("Connecting to database...");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			System.out.println("conn is "+conn);
		}
		catch(Exception e){
			System.out.println("ERROR");
			e.printStackTrace();
		}
		
		return conn;
	}

	public void close(){
	}
}
