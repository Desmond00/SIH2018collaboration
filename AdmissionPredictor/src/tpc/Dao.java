package tpc;

import java.sql.*;
import java.util.*;

import jdk.nashorn.internal.runtime.ECMAErrors;

public class Dao {
	private Connect co;
	private Connection c;
	private PreparedStatement pstmt;
	private PreparedStatement pst;

	Dao() {
		co = new Connect();
		c = co.Conn();
		System.out.println("c =" + c);
		System.out.println("co =" + co);
		pstmt = null;
	}
	public boolean checkEmailExists(String email){
		boolean flag = true;
		try{
			pstmt = c.prepareStatement("SELECT * FROM members where email=?");
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			if (!rs.next()) {
				flag = false;
			}
		}
		catch( Exception E){
			System.out.println("Error while checking email");
		}
		return flag;
	}
	public boolean signup(LoginClass lc) {
		boolean flag = false;
		try {
			if(!checkEmailExists(lc.getEmail())){
				pstmt = c.prepareStatement("INSERT INTO members(email, password) values  (? ,?)");
				pstmt.setString(1, lc.getEmail() );
				pstmt.setString(2, lc.getPassword());
				System.out.println(lc.getEmail()+lc.getPassword());
				pstmt.executeQuery();
				flag = true;
			}
		}
		catch (Exception E){
			System.out.println("Error while signup "+ E);
		}
		return flag;
	}

	public boolean confirmLogin(LoginClass lc) {
		boolean flag = false;
		try {
			String str = "SELECT * FROM members where email=? and password=?";
			System.out.println(lc.getEmail()+lc.getPassword());
			pstmt = c.prepareStatement(str);
			pstmt.setString(1, lc.getEmail());
			pstmt.setString(2, lc.getPassword());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {

				System.out.println("Congratulations  You are logged in.");
				flag = true;
			}
			if (flag == false) {
				System.out.println("Wrong username or password.");
			}
			rs.close();
			pstmt.close();
			c.close();
		} catch (

		Exception e) {
			System.out.println("ERROR");
			e.printStackTrace();
		}
		return flag;
	}

	public void updateName(String userid, String name) {
		try {
			String str = "UPDATE signup SET JOB_NAME = ? where RecruiterID = ?";
			pstmt = c.prepareStatement(str);
			pstmt.setString(1, "name");
			pstmt.setString(2, "userid");
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	public void editDetails(Recruiter rec) {
		try {
			String str = "UPDATE signup SET Job_Name = ? , EmailID = ? , Contact = ? , Password = ? WHERE RecruiterID = ?";
			pstmt = c.prepareStatement(str);
			pstmt.setString(1, rec.getName());
			pstmt.setString(2, rec.getEmail());
			pstmt.setString(3, rec.getPhone());
			pstmt.setString(4, rec.getPassword());
			pstmt.setString(5, rec.getUserID());
			pstmt.executeUpdate();
			System.out.println("Signup table edited");
			String s = "UPDATE login SET Password = ? WHERE UserID = ?";
			pst = c.prepareStatement(s);
			pst.setString(1, rec.getPassword());
			pst.setString(2, rec.getUserID());
			pst.executeUpdate();
			System.out.println("Login table edited");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public Student getAlldata(String username) {
		Connect co = new Connect();
		Connection c = co.Conn();
		PreparedStatement pstmt;
		Student st = new Student();
		try {
			String str = "SELECT * FROM student WHERE userid = ?";
			pstmt = c.prepareStatement(str);
			pstmt.setString(1, username);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				st.setFirstName(rs.getString("Fname"));
				st.setLastName(rs.getString("Lname"));
				st.setrollNo(rs.getString("RollNo"));
				st.setDateOfBirth(rs.getString("DateOfBirth"));
				st.setbranch(rs.getString("Branch"));
				st.setCGPA(rs.getFloat("CGPA"));
				st.setemailId(rs.getString("EmailID"));
				st.setpassword(rs.getString("Password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return st;
	}
}
