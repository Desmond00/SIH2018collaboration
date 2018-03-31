package admission;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beanClasses.JSONResponse;
import connect.Connect;

public class RankList extends HttpServlet{
	private static final String sql = "select BRANCH, round(avg(GE_CR),2) , round(avg(SC_CR),2), round(avg(ST_CR),2), round(avg(OBC_CR),2) from admission_data where sub_category=? and state_quota=? and institute_id=?  group by branch";
	private static int instituteID;
	private static String subCategory;
	private static String stateQuota;
	private final static Connection con = new Connect().getConnection();
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException {
        res.setContentType("application/json");
        try {
			PrintWriter pw = res.getWriter();
        
        //Storing the parameter values into variabes
        System.out.println(req.getParameter("institute"));
        System.out.println(req.getParameter("subCategory"));

        instituteID = Integer.parseInt(req.getParameter("institute"));
        subCategory = req.getParameter("subCategory");
        stateQuota = req.getParameter("stateQuota");
        String  finaljson =  generateJSON(instituteID, subCategory,stateQuota);
        pw.print(finaljson.toString());
	}
        catch (IOException e) {
		System.out.println(e);
        }
	}
	
	
	
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException,ServletException{
    
		doPost(req, res);        
    }
	
	private static String generateJSON(int instituteID, String subCategory, String stateQuota) {
		String finalJsonResponse=null;
		System.out.println(instituteID);
		System.out.println(subCategory);
		System.out.println(stateQuota);
		JSONResponse jsonObj = new JSONResponse();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, subCategory);
			ps.setString(2, stateQuota);
			ps.setInt(3, instituteID);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//System.out.println(rs);
				jsonObj.setBranchName(rs.getString(1));
				jsonObj.setGeneralRank(rs.getInt(2));
				jsonObj.setScRank(rs.getInt(3));
				jsonObj.setStRank(rs.getInt(4));
				jsonObj.setObcRank(rs.getInt(5));
			}	
			
			Gson gson = new Gson();
			finalJsonResponse = gson.toJson(jsonObj);
			System.out.println(finalJsonResponse);
		}
		catch(SQLException e) {
			//System.out.println(e);
			e.printStackTrace();
		}
		return finalJsonResponse;
	}
}
