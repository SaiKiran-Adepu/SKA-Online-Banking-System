<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps2;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            //ps1 = con.prepareStatement("insert into userreg values(?,?)");
            ps2 = con.prepareStatement("select cuid,username,gender,pass,amt,trm,addr,phn,dob from userp ORDER BY cuid");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
   
   
   
   
        ResultSet rs = ps2.executeQuery();
        out.println("<center>");
		out.println("<table border=3 bgcolor=orange>");
		out.println("<tr>");
		out.println("<th>CUID</th>");
		out.println("<th>USER NAME</th>");
		out.println("<th>GENDER</th>");
		out.println("<th>PASSWORD</th>");
		out.println("<th>AMT</th>");
		out.println("<th>TRM</th>");
		out.println("<th>ADDRESS</th>");
		out.println("<th>PHN/MOBILE</th>");
		out.println("<th>DOB</th>");
		out.println("</tr>");
         while(rs.next())
        {
            out.println("<tr>");
			out.println("<td>"+rs.getInt(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
            out.println("<td>"+rs.getString(4)+"</td>");
			out.println("<td>"+rs.getInt(5)+"</td>");
			out.println("<td>"+rs.getString(6)+"</td>");
			out.println("<td>"+rs.getString(7)+"</td>");
			out.println("<td>"+rs.getString(8)+"</td>");
			out.println("<td>"+rs.getString(9)+"</td>");
			
            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

      
    
	%>
	<%!
    public void jspDestroy()
    {
        try
        {
           
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>