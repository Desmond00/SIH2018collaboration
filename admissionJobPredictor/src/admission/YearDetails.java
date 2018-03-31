package admission;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import connect.Connect;

public class YearDetails {
	public final int latestYear;
	public final int totalYears;
	private Connection con = new Connect().getConnection();
	YearDetails() throws SQLException{
		latestYear = this.getLatestYear();
		totalYears = this.getTotalYears();
	}
	
	private int getLatestYear() throws SQLException {
		PreparedStatement ps = con.prepareStatement("select max(year) from admission_data");
		ResultSet rs = ps.executeQuery();
		return rs.getInt(1);
	}
	
	private int getTotalYears() throws SQLException{
		PreparedStatement ps = con.prepareStatement("select count(distinct(year)) from admission_data");
		ResultSet rs = ps.executeQuery();
		return rs.getInt(1);
	}
}