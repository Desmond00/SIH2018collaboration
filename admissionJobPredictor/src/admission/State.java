package admission;
import connect.*;
import java.sql.*;


public class State {
	private final Connection con = new Connect().getConnection();
	private String stateList = "";
	public String getStateList()throws SQLException {
		PreparedStatement ps = con.prepareStatement("select * from states");
		ResultSet rs = ps.executeQuery();
		int stateID;
		String stateName;
		while(rs.next()) {
			stateID = rs.getInt(1);
			stateName = rs.getString(2);
			stateList += "<option value="+stateID+">"+stateName+"</option>";
		}
		return stateList;
	}
}
