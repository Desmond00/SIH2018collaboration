package job;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beanClasses.*;
import com.google.gson.Gson;

import connect.*;


public class jobStatitics extends HttpServlet {
	private static Connection con = new Connect().getConnection();
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		int year = Integer.parseInt(req.getParameter("year"));
		int state = Integer.parseInt(req.getParameter("state"));
		PrintWriter pw = res.getWriter();
		if(state == 0) {
			String jsonString = getPlacedGpaData(year);
			pw.println(jsonString);			
		}
		else if(state == 1) {
			String jsonString  = getJobData(year);
			pw.println(jsonString);
		}
	}
	
	public String getPlacedGpaData(int year) {
		String finalJsonResponse = null;
		try {
			PreparedStatement ps = con.prepareStatement("select A.minDGPA, A.totalPlaced, A.year, B.totalCandidates from (select min(DGPA) minDGPA, count(placed) totalPlaced, year from job_data where year=? and placed=1 group by year) A, (select count(*) totalCandidates from job_data where year=?) B ");
			ps.setInt(1, year);
			ps.setInt(2, year);
			ResultSet rs = ps.executeQuery();
			JSONjobDgpaPlaced jsonObj = new JSONjobDgpaPlaced();
			while(rs.next()) {
				System.out.println(rs.getInt(1));
				jsonObj.setMinGPA(rs.getInt(1));
				System.out.println("connected");
				jsonObj.setTotalPlaced(rs.getInt(2));
				jsonObj.setTotalCandidates(rs.getInt(4));			
				
			Gson gson = new Gson();
			finalJsonResponse = gson.toJson(jsonObj);
			System.out.println(finalJsonResponse);
			return finalJsonResponse;
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return finalJsonResponse;
	}
	
	public String getJobData(int year) {
		String finalJsonResponse = null;
		Gson gson = new Gson();
		JSONjobData jsonResponse = null;
		ArrayList<JSONjobData> listOfJsonResponses = new ArrayList<JSONjobData>();
		try {
			PreparedStatement ps = con.prepareStatement("select * from job_data where year=?");
			ps.setInt(1, year);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				jsonResponse = new JSONjobData();
				jsonResponse.setInstituteName(rs.getString(2));
				jsonResponse.setBranch(rs.getString(3));
				jsonResponse.setDGPA(rs.getInt(5));
				jsonResponse.setPlaced(rs.getInt(6));
				listOfJsonResponses.add(jsonResponse);
			}
			}
			catch(SQLException e) {
				System.out.println(e);
			}
			finalJsonResponse  = gson.toJson(listOfJsonResponses);
			System.out.println(finalJsonResponse);
			return finalJsonResponse;
	}
}
