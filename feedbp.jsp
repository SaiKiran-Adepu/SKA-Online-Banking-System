<html>
<head>
<title>A/C Holders Feedback</title>
</head>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
           // ps1 = con.prepareStatement("insert into userreg values(?,?)");
            ps2 = con.prepareStatement("select * from feedback");
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
		out.println("<table border=3  bgcolor=orange bordercolor=green>");
		out.println("<tr>");
		out.println("<th>NAME</th>");
		out.println("<th>FEEDBACK</th>");
		
		out.println("</tr>");
         while(rs.next())
        {
            out.println("<tr>");
		//out.println("\n ammount in bank");
           out.println("<td>"+rs.getString(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			//out.println("<td>"+rs.getString(6)+"</td>");
			//out.println("<td>"+rs.getString(7)+"</td>");

            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

        rs.close();
    
	%>
	<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            //ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>