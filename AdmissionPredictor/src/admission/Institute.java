package admission;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import connect.Connect;

public class Institute {
	private String stateID;
	private String instituteList = "<option disabled selected value> -- select an institution -- </option>";
	private final Connection con = new Connect().getConnection();
	public String getStateID() {
		return stateID;
	}

	public void setStateID(String stateID) {
		this.stateID = stateID;
	}
	
	public String getInstituteList()throws SQLException {
		int instituteID;
		String instituteName;
		PreparedStatement ps = con.prepareStatement("select * from institutes where state_id=?");
		ps.setString(1, stateID);
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			instituteID = rs.getInt(1);
			instituteName = rs.getString(2);
			instituteList += "<option value="+instituteID+">"+instituteName+"</option>";
		}
		return instituteList;
	}
	
	public String[] getSubCategoryList() throws SQLException {
		ArrayList<String> subCategory = new ArrayList<String>();
		PreparedStatement ps = con.prepareStatement("select distinct(sub_category) from admission_data");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			subCategory.add(rs.getString(1));
		}
		final String[] sub_category= subCategory.toArray(new String[subCategory.size()]);
		return sub_category;
	}
	
	public String[] getStateQuotaList() throws SQLException {
		ArrayList<String> stateQuota = new ArrayList<String>();
		PreparedStatement ps = con.prepareStatement("select distinct(state_quota) from admission_data");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			stateQuota.add(rs.getString(1));
		}
		final String[] state_quota = stateQuota.toArray(new String[stateQuota.size()]); 
		return state_quota;
	}
	
	/*public void doGet(HttpServletRequest req, HttpServletResponse res) {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		PrintWriter pw = res.getWriter();
		//pw.println()
	}*/
}
