package admission;
import java.sql.*;
import connect.*;




public class BranchDetails {
	private int noOfBranches,  institute_id;
	private String subCategory, stateQuota;
	private final Connection con = new Connect().getConnection();
	

	public int getInstitute_id() {
		return institute_id;
	}

	public void setInstitute_id(int institute_id) {
		this.institute_id = institute_id;
	}
	
	public String getSubCategory() {
		return subCategory;
	}

	public void setSubCategory(String subCategory) {
		this.subCategory = subCategory;
	}

	public String getStateQuota() {
		return stateQuota;
	}

	public void setStateQuota(String stateQuota) {
		this.stateQuota = stateQuota;
	}

	public int calculateNoOfBranches() throws SQLException{
		final YearDetails yearDetails = new YearDetails(); 
		PreparedStatement ps = con.prepareStatement("select count(*) from admission_data where institute_id=? and sub_category=? and state_quota=? and year=?");		
		ps.setInt(1, institute_id);
		ps.setString(2, subCategory);
		ps.setString(3, stateQuota);
		ResultSet rs = ps.executeQuery();
		noOfBranches = rs.getInt(1);
		return noOfBranches;
	}	
	
	
}	
