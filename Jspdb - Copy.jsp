
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
            ps1 = con.prepareStatement("select count(*) from skaadm where adname = ? and adpass=?");
            ps2 = con.prepareStatement("select * from skaadm");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
    String param = request.getParameter("s1");
    if(param =="link")
    {
        ResultSet rs = ps2.executeQuery();
        out.println("<table>");
        while(rs.next())
        {
            out.println("<tr>");
            out.println("<td>"+rs.getString(1)+"</td>");
            out.println("<td>"+rs.getString(2)+"</td");
            out.println("</tr>");
        }
        out.println("</table>");
        rs.close();
    }
    else
    {
        
        String user = request.getParameter("name");
        String pass = request.getParameter("pass");
        
        ps1.setString(1,user);
        ps1.setString(2,pass);
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
            cnt = rs.getInt(1);
        if(cnt == 0)
            out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
        else
        {
            out.println("<form><fieldset style= width:25%; >");
            out.println("<b><i><font color=red>Wel come mgr</font></i></b><br>");
            out.println("<b><i><font size=6 color=blue><Welcome to My Page</font></i></b>");
            out.println("</fieldset></form>");
			// String redirectURL = "http://192.168.43.42:8181/test/index1.html";
             // response.sendRedirect(redirectURL);
        }
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Welcome MGR</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  

<div id="header">
	<h1>SKA - BANKING<span class="style1"></span></h1>
    <h2>ExtraOrdinary Service</h2>	

</div>

<div id="navigation">
    <ul>
    <li><a href="http://192.168.43.42:8181/test/create.html">NEW ACCOUNT</a></li>
    <li><a href="http://192.168.43.42:8181/test/balance.jsp">TOTAL CASH</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="about.jsp">ABOUT US</a></li>
    </ul>
</div>

<table cellpadding="0" cellspacing="0" id="content1"><tr align="justify">
	<td class="con" valign="top">
    	<div id="heade1"><h1>Results</h1></div>
        <p>This is  Global Business bank which is under business and finance category for your website design. Freedesignertemplates.com is a free collection of site templates with HTML layouts which are frequently updated.<br><br>
        These web design layouts are developed by the professional designers for you to make your task easy in creating a website and are easy to download. 
      

</p>
    </td>
    
    <td class="con" valign="top">
    	<div id="heade2"><h1>Opportunities</h1></div>
        <p> These Global Business bank would be idle for building a successful online businesses.  Download the required HTML template, install it and edit the existing content with your original text.<br><br>

The entire website   are pre-designed websites all you need to do is adding your own personal content and start your own website. 

</p>
    </td>
    
    <td class="con" valign="top">
    	<div id="heade3"><h1>Solutions</h1></div>
        <p>There are various other template categories like Art, Finance, Nature, Night club, Communication, Computer, Music, Religious, Fashion, Holiday, Travel, Health, Medicine. This free Global Business bank which is built using XHTML and CSS.<br>
        
        These   are user friendly that any user can download and customize it according to their wish.
        
    </td>
</tr></table>

<table style="width:897px; background:#FFFFFF; margin:0 auto;"><tr align="justify">
	<td width="299" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="#">www.javatpoint.com</a></li>
            <li><a href="#">www.javacstpoint.com </a></li>
            <li><a href="#">www.javatpoint.com/forum.jsp</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	    	
	    </div>      
    </td>
    
    <td width="299" valign="top">
   	  <div id="news"><h1>News &amp; Events</h1><br>
      	<div class="img"><img src="images/globe_12.gif" alt="Business"></div>
        <h2>Nov. 17, 2008.</h2>
        <p>Get your dream web design at no cost, no extra manpower for your professional website.</p><br>
        <div class="img"><img src="images/globe_16.gif" alt="Business"></div>
        <h2>Nov. 17, 2008.</h2>
        <p>Get your dream web design at no cost, no extra manpower for your professional website.</p>
      
      </div>
        	
     </td>
</tr></table>

<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img src="http://192.168.43.42:8181/lp/images/arch3.jpg"  alt="business"  width="196" height="106"></center><br>
		    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	  
  Copyright © SKA Developments</div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>