package admission;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import beanClasses.JSONresponseSecond;
import connect.Connect;

public class admissionStyle2 extends HttpServlet{
	private static int userRank;
	private static String userCategory;
	JSONresponseSecond jsobObj = new JSONresponseSecond();
	private static ArrayList<String> institute_id = new ArrayList<String>();
	private static ArrayList<String> branch = new ArrayList<String>();

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		res.setContentType("application/json");
        try {
		PrintWriter pw = res.getWriter();
		userRank = Integer.parseInt(req.getParameter("userRank"));
		userCategory = req.getParameter("userCategory");
		pw.print(getResult());
        }
        catch (IOException e) {
    		e.printStackTrace();
            }
	}
	
	
	public static String getResult()
		    {
		        Connection con=new Connect().getConnection();
		        String column=userCategory+"_CR";
		        System.out.println(column);
		        PreparedStatement pst;
		        ResultSet rs = null;
		        JSONresponseSecond jsonResponse;
		        ArrayList<JSONresponseSecond> listOfJsonResponses = new ArrayList<JSONresponseSecond>();
		        Gson gson = new Gson();
				try {
					pst = con.prepareStatement("select pc.*, ad."+column+" from perspective_colleges pc, admission_data ad where concat(pc.institute_id, pc.branch) = concat(ad.institute_id, ad.branch) and "+userRank+"<="+column+" order by to_number(ad."+column+")");
					/*pst.setString(1,column);
			        pst.setInt(2,userRank);
			        pst.setString(3,column);*/
			        rs=pst.executeQuery(); 
			        while(rs.next()) {
			        	jsonResponse = new JSONresponseSecond();
			        	jsonResponse.setBranch(rs.getString(2));
			        	jsonResponse.setInstituteName(rs.getString(4));
			        	jsonResponse.setCompanies(rs.getString(5));
			        	jsonResponse.setRank(rs.getInt(6));
			        	System.out.println(rs.getInt(6));
			        	System.out.println(rs.getString(4));
			        	listOfJsonResponses.add(jsonResponse);
			        	
		        }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				String finalJsonResponse = gson.toJson(listOfJsonResponses);
				System.out.println(finalJsonResponse);
				return finalJsonResponse;
		    }
}
