<html>
<head>
<title>Balance Enq By Names</title>
</head>
<body>
	
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2,ps3;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps2 = con.prepareStatement("select acid,username,amt,phone from userreal where username= ? ORDER BY acid");
           ps3 = con.prepareStatement("select sum(amt) from userreal where username=?");    
        
		}
		
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
         /* String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {*/


    //int no=Integer.parseInt(request.getParameter("accid"));
       String username = request.getParameter("username");
       ps2.setString(1,username);
        int cnt = ps2.executeUpdate();        
		  if(cnt>0)
		   {
			   out.println("<center><font color=blue><h3>ACID NAME BALANCE MOBILE Is</h3></font></center>");
          ResultSet rs = ps2.executeQuery();
         out.println("<center>");
		 out.println("<table border=3 bgcolor=orange>");
		 out.println("<tr>");
		 out.println("<th>ACID</th>");
		 out.println("<th>AC NAME</th>");
		 out.println("<th>BALANCE</th>");
		 out.println("<th>Ac MOBILE NUM</th>");

		 out.println("</tr>");
         while(rs.next())
         {
            out.println("<tr>");         
			out.println("<td>"+rs.getInt(1)+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
            out.println("<td>"+rs.getInt(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
            out.println("</tr>");
         }
          out.println("</table>");
		   out.println("</center>");
		   rs.close();
		}
		   else
		   {
		    out.println("<center><font color=blue><h3>INVALID AC NAME</h3></font></center>");
		  }    
		  String username1 = request.getParameter("username");
       ps3.setString(1,username1);
	   int cnt1 = ps3.executeUpdate();
        // int cnt1 = ps3.executeQuery();
		 if(cnt1>0)
		   {
			  
		out.println("<center><font color=blue><h3>Total BALANCE BY NAME IN BANK</h3></font></center>"); 
		  ResultSet rs1 = ps3.executeQuery();
        out.println("<center>");
		out.println("<table border=3 bgcolor=orange>");
		out.println("<tr>");
		out.println("<th>Total BAL IN BANK BY MBL</th>");
		out.println("</tr>");
         while(rs1.next())
        {
            out.println("<tr>");
		    out.println("<td>"+rs1.getInt(1)+"</td>");
            //out.println("<td>"+rs1.getString(2)+"</td>");
            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");
		   }
		else
		   {
		    out.println("<center><font color=blue><h3>INVALID AC NAME</h3></font></center>");
		  }  

       //rs1.close();
    
            
	%>
	<%!
    public void jspDestroy()
    {
        try
        {
            
            ps2.close();
			ps3.close();
			//rs1.close();
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

