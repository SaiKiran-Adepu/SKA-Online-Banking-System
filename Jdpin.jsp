<html>
<head>
<title>PIN Update</title>
</head>
<body onkeydown="return (event.keyCode == 154)">
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
            ps1 = con.prepareStatement("update userreal set pass = ? where acid = ? and username=?");
            //ps2 = con.prepareStatement("select * from userreg");
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
      int acd=Integer.parseInt(request.getParameter("acid"));
        String pass = request.getParameter("pass");
		String username = request.getParameter("name");
        ps1.setString(1,pass);
        ps1.setInt(2,acd);
		ps1.setString(3,username);
		//int cnt=0;
		int cnt=ps1.executeUpdate();
	
	     
		if(cnt>0)
		   {
			   out.println("<center><font color=blue><h3> User passWord/PIN Update Successfull</h3></font></center>");
		       //out.println("<center><img src=images/arch3.jpg width=600 height=250></img></center>");
     		  out.println("<center>");
			  out.println("<table border=2px bgcolor=	#b0c4de width=120>");
			  out.println("<tr>");
			  out.println("<th>ACID</th>");
			  out.println("<th>PASSWORD</th>");
			  out.println("</tr>");
			    out.println("<tr>");
			  out.println("<td>"+acd+"</td>");
			  out.println("<td>"+pass+"</td>");
			  out.println("</tr>");
			  out.println("</table>");
			  out.println("</center>");
				
			  out.println("<center><img src=images/pass.png width=600 height=250></img></center>");
				out.println("<center><h2><font color=green>SKA BANKING</font></h2></center>");
				//out.println("<center><h2><font color=orange>This Site Is Developed By SKA Developments</font></h2></center>");
		   }
		   else
		   {
              out.println("<center><font color=blue><h3>User PIN modification not Successfull/AC Not Exist/Wrong AC Name</h3></font></center>");
			   
		   }
       
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
           // ps2.close();
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