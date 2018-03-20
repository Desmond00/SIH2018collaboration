import java.sql.*;

class insertData{
    public static void main(String ars[])throws ClassNotFoundException, SQLException
    {
        Class.forName("oracle.jdbc.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admission_job","123456");
        String states[] = { "Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh" , "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu & Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh", "Delhi", "Dadra and Nagar Haveli", "Daman and Diu", "Lakshadweep", "Puducherry"};
        
        for(int i=1;i<=states.length;++i){
            PreparedStatement ps = con.prepareStatement("insert into states values(?,?)");
            ps.setInt(1, i);
            ps.setString(2, states[i-1]);
            ps.executeUpdate();
        }
    }
}