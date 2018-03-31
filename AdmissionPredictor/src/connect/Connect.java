package connect;
import java.sql.*;

public class Connect {
	private Connection con = null;
	private final String driverURL = "oracle.jdbc.OracleDriver";
	private final String connectionURL = "jdbc:oracle:thin:@192.168.137.1:1521:XE";
	private final String userName = "admission_job";
	private final String password = "123456";
	public Connection getConnection() {
		try {
			Class.forName(driverURL);
			con = DriverManager.getConnection(connectionURL, userName, password);
			System.out.println("Con Established");
		}
		catch(Exception e) {
		}
	return con;
	}
}
