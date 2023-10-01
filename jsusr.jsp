
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.*" %>
<%!
    Connection con;
    PreparedStatement ps1, ps2,ps22,ps23,ps24,ps25;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps1 = con.prepareStatement("select acid,username,phone from userreal where acid = ? and pass=?");
			ps22 = con.prepareStatement("select facid,mreq from mreq where acid=?");
            ps23 = con.prepareStatement("select username from userreal where acid=?");
			ps24 = con.prepareStatement("select trno,acid,fund,tacid,trm,dot from skatrns where acid=? order by DOT DESC");
			ps25 = con.prepareStatement("select trno,acid,fund,trm2,dot from skatrns where tacid=? order by DOT DESC");
            // i just used a single table and just modified the query acid to tacid to show the transaction details
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%
   /* response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			 response.setHeader("Pragma","no-cache");
			 response.setHeader("Expires","0");
	*/		 

	
       int nt =Integer.parseInt(request.getParameter("acid"));
	   session.setAttribute("acid",nt);
        String pass = request.getParameter("pass");
        ps1.setInt(1,nt);
             ps1.setString(2,pass);
        ResultSet rs = ps1.executeQuery();
        int cnt=0;
         if (rs.next())
            cnt = rs.getInt(1);
		if(cnt == 0)
		{
            out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
           String redirectURL ="una1.jsp";
           response.sendRedirect(redirectURL);
		}
		else
        {
		
            out.println("<form><fieldset style= width:25%; >");
			 out.println("<b><i><font size=4 color=blue>WELCOME TO SKA BANKING </font></i></b>");
			 out.println("<br>");
            out.println("<b><i><font color=red>AC NUMBER</font></i></b><br>"+nt);
			out.println("<br>");
			out.println("<b><i><font size=4 color=blue>AC NAME </font></i></b>");
                   int no1=Integer.parseInt(request.getParameter("acid"));	
				   //session.setAttribute("acid",no1); 

				   
                    ps23.setInt(1,no1);				   

				   ResultSet rs23 = ps23.executeQuery();

			while(rs23.next())
          {
            //out.println("<tr>");
		   out.println(rs23.getString(1));
		  }
            out.println("</fieldset></form>");
			
            
		}
			
	     
	   ResultSet rs1 = ps1.executeQuery();
        out.println("<center>");
		out.println("<table border=3 bgcolor=#f5deb3 height=6 width=320>");
		out.println("<tr>");
		out.println("<th>ACID</th>");
		out.println("<th>AC NAME</th>");
		out.println("<th>MOBILE NUMBER</th>");
		out.println("</tr>");
         while(rs1.next())
        {
            out.println("<tr>");
	        out.println("<td>"+rs1.getInt(1)+"</td>");
			out.println("<td>"+rs1.getString(2)+"</td>");
            out.println("<td>"+rs1.getString(3)+"</td>");
            out.println("</tr>");
		
        }
        out.println("</table>");
		out.println("</center>");
		out.println("<br>");
	
		
		
		
%>
<%!
    public void jspDestroy()
    {
        try
        {
            //colse
            ps1.close();
			//ps11.close();
           ps2.close();
           ps22.close();
		   ps23.close();
		   ps24.close();
		   ps25.close();

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
<title>Welcome AC holder</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}
/* The grid: Three equal columns that floats next to each other */
.column {
  float: left;
  width: 16.5%;
  padding: 30px;
  text-align: center;
  font-size: 18px;
  cursor: pointer;
  color: white;
}

.containerTab {
  padding: 10px;
  color: white;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Closable button inside the container tab */
.closebtn {
  float: right;
  color:black;
  font-size: 43px;
  cursor: pointer;
}


</style>
<style>
.accordion1 {
  background-color:#75BC25;
  color: #444;
  cursor: pointer;
  padding: 23px;
  border: none;
  text-align: left;
  outline: none;
  font-size: 20px;
  transition: 0.4s;
}

.active, .accordion1:hover {
  background-color: #ccc; 
}

.panel {
  padding: 0 18px;
  display: none;
  background-color: white;

}
</style>
</head>
<body>
<table border ="1px" width="100px" bgcolor="#e6e6fa" height="10px">
<tr>
<th>TIME</t>
</tr>
<tr>
<td>
	<script type="text/javascript">
    window.onload = function () {
        DisplayCurrentTime();
    };
	 function DisplayCurrentTime() {
	setInterval(() => {
        var date = new Date();
        var hours = date.getHours() > 12 ? date.getHours() - 12 : date.getHours();
        var am_pm = date.getHours() >= 12 ? "PM" : "AM";
        hours = hours < 10 ? "0" + hours : hours;
        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
        var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
        time = hours + ":" + minutes + ":" + seconds + " " + am_pm;
        var lblTime = document.getElementById("lblTime");
        lblTime.innerHTML = time;
		  }, 100);
    };
</script>
<span id="lblTime"></span>
</td>
</tr>
</table>

<center>
 <h2><font color="blue">SKA</font></h2>
        <img src="images/bank.webp "width=450 height=220></img>
            
    
	</center>
<!-- Three columns -->
<div class="row">
  <div class="column" onclick="openTab('b1');" style="background:green;">
    CHECK BALANCE
  </div>
  <div class="column" onclick="openTab('b2');" style="background:blue;">
    PIN UPDATE
  </div>
  <div class="column" onclick="openTab('b3');" style="background:red;">
    MOBILE UPDATE
  </div>
   <div class="column" onclick="openTab('b4');" style="background:green;">
    SEND MONEY
  </div>
    <div class="column" onclick="openTab('b5');" style="background:blue;">
    REQUEST MONEY
  </div>
    <div class="column" onclick="openTab('b6');" style="background:	#9932cc;">
    <a href="logout.jsp"><img src="images\lo3.png" width="50" height="21"></a>
  </div>
</div>

<!-- Full-width columns: (hidden by default) -->
<div id="b1" class="containerTab" style="display:none;background:#dcdcdc">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
   <br>
			<script LANGUAGE="JavaScript">
	
    function loginb(form)
	{
	   	var pwdb = document.getElementById("pass").value;
		
        if(pwdb=='')
		{
			 	
        	alert("Please Enter the password.");
			// document.F1a.pwd1.value="";
	         //document.pwd1.focus();
			return false;
		}
	
	    
	
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
 
		
	<center>
           <form method = "post" name=F1a onSubmit="return loginb(this)" action = "Jdbu.jsp" >

            <fieldset style="width:28%; height:25%; background-color:#b3d1ff">
                <h3><center>BALANCE CHECK</center></h3>
                <hr>
                <table>
				
			
                       <tr>
                       
						  <%
					   int no1 =Integer.parseInt(request.getParameter("acid"));
					   session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid id=acid1 hidden>"+no1+"</textarea>");
						
                        %>
                    </tr>
                    
					
                    <tr>
                        <td>Pin<font color="red">*</font>:</td>
                        <td><input type = "password" name = "pass" id="pass" placeholder="ENTER PIN"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="CHECK BALANCE" name = "s1"  onClick ="loginb(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
                    </tr>
                </table>
            </fieldset>
        </form>

        
		
           </center>
 
 </div>

<div id="b2" class="containerTab" style="display:none;background:#f8f8ff">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  
			<script LANGUAGE="JavaScript">
	
    function login1(form)
	{
	     //var acid = document.getElementById("acid1").value;
		var uname = document.getElementById("name1").value;
		var pwd1 = document.getElementById("pass1").value;
		var r =confirm("YOUR READY PINCHANGE FOR AC ");
	    //var ul="http://192.168.43.42:8181/test/Jdbin.jsp";
		/*for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   //document.F1.accountno.focus()
		   return false;
		}
   }*/
        /*if(acid=='')
		{
			alert("please enter ACID.");
			return false;
		}*/

		if(uname =='')
		{
			
		
			alert("Please enter user name.");
				  //document.F1a.uname.value="";
	     //document.F1a.uname.focus();	
		 //document.getElementById("uname").focus();
			return false;
		}
		else if(pwd1=='')
		{
			 	
        	alert("Please Enter the password.");
			// document.F1a.pwd1.value="";
	         //document.pwd1.focus();
			return false;
		}
		       if(r==true)
	   {
	  // alert("SUCCESSFULLY PIN CHANGED FOR AC");
	  // return true;
	   }
	    
		else
		{ 
		  alert("PINCHANGE Denied");
		  return false;
		  
		}
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
 
		
	<center>
           <form method = "post" name=F1a onSubmit="return login1(this)" action = "Jdpinu.jsp" >

            <fieldset style="width:26%; height:22%; background-color:#b3d1ff">
                <h3><center>PWD UPDATE</center></h3>
                <hr>
                <table>
				
			
                       <tr>
                       
						  <%
					   //int no1 =Integer.parseInt(request.getParameter("acid"));
					   //session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid id=acid1 hidden>"+no1+"</textarea>");
						
                        %>
                    </tr>
                    <tr>
                        <td>Name<font color="red">* </font>:</td>
                        <td> <input type = "text" name = "name" id="name1" placeholder="Your NAME ON ACID"></td>
                    </tr>
					
                    <tr>
                        <td>Pin<font color="red">* </font>:</td>
                        <td><input type = "password" name = "pass" id="pass1" placeholder="NEW PIN"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Pin change" name = "s1"  onClick ="login1(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
                    </tr>
                </table>
            </fieldset>
        </form>

        
		
           </center>
  
  
  
  
  
  
  
  </div>

<div id="b3" class="containerTab" style="display:none;background:#f0ffff">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  
			<script LANGUAGE="JavaScript">
    function login2(form)
	{
	     //var acid = document.getElementById("acid1").value;
		var phn2 = document.getElementById("phone2").value;
		var pwd2 = document.getElementById("pass2").value;
		var r =confirm("YOUR REDAY MOBILE UPDATE FOR AC ");


		if(phn2=='')
		{
			
		
			alert("Please Enter Mobile Number.");
				  //document.F1a.uname.value="";
	     //document.F1a.uname.focus();	
		 //document.getElementById("uname").focus();
			return false;
		}
		else if(pwd2=='')
		{
			 	
        	alert("Please Enter the password.");
			// document.F1a.pwd1.value="";
	         //document.pwd1.focus();
			return false;
		}
		       if(r==true)
	   {
	  // alert("SUCCESSFULLY PIN CHANGED FOR AC");
	  // return true;
	   }
	    
		else
		{ 
		  alert("Mobile Update Denied");
		  return false;
		  
		}
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	



		</script>
   
	<center>
           <form method = "post" onSubmit="return login2(this)" action = "jdphncu.jsp" >
            <fieldset style="width:26%; height:22%; background-color:#b3d1ff">
                <h3><center>MOBILE NUM UPDATE</center></h3>
                <hr>
                <table>
				<tr>
                         <%
					   //int no12 =Integer.parseInt(request.getParameter("acid"));
					   session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid id=acid2 hidden>"+no1+"</textarea>");
                        

                        %>                        

						</tr>				
                    <tr>
                        <td>MOBL NUMBER:</td>
                        <td><input type = "number" name = "phone" id="phone2" placeholder="New Mobile Num"></td>
                    </tr>
						<tr>
                        <td>Password:</td>
                        <td> <input type = "password" name = "pass" id="pass2" placeholder="Password"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Mobile Update" name = "s1"  onClick ="login2(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
                    </tr>
                </table>
            </fieldset>
        </form>
           </center>
  
  </div>

<div id="b4" class="containerTab" style="display:none;background:#e6e6fa">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
 
		<script LANGUAGE="JavaScript">
         
    function login3(form)
	{
		var acid = document.getElementById("acid3").value;
		//var amt = document.getElementById("amt3").value;
		var pass = document.getElementById("pass3").value;
		var acid1 = document.getElementById("acid13").value;
		var amt1 = document.getElementById("amt13").value;
		//var trm1 = document.getElementById("trm1").value;
		 var r =confirm("YOUR TRANSFERING FUND TO ANOTHER AC");
		//var phone = document.getElementById("phone").value;
		if(acid1=='')
		{
			alert("Please Enter Target ACID");
			return false;
		}
	    	else if(acid1>=125)
		{
			alert("AC Not EXIST IN SKA BANK");
			return false;
		}
	
	
		
		
		else if(amt1=='')
		{
        	alert("enter AMT");
			return false;
		}
	   	else if(pass=='')
		{
        	alert("Enter Your Password");
			//  document.F1.amt13.value="";
	    // document.F1.amt13.focus();	
			return false;
		}

	   
	    else if(document.F1.acid3.value==document.F1.acid13.value)
       {
	     alert("Your Trying To Transfer Fund In Same ACID !"); 
	     document.F1.acid13.value="";
	     document.F1.acid13.focus();	
	     return false;
		 
	   }
	  
		/*else if(document.F1.amt3.value!=document.F1.amt13.value)
       {
	     alert("Please Confirm AMOUNT Should be Same!"); 
	     document.F1.amt13.value="";
	     document.F1.amt13.focus();	
	     return false;
		 
	   }*/
	   if(r==true)
	  {
	  // alert("Fund Transfered to AC");
	  // return true;
	   }
	    
		else
		{ 
		  alert("Transfer Fund Denied");
		  return false;
		  
		}
		
		
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
	</script>
    
	<center>
        <form name=F1 method = "post" onSubmit="return login3(this)" id="cr" action = "jstrnu.jsp">
		<br>
              <fieldset style="width:26%; height:42%; background-color:#FFCC00">
                    <h3><center>SEND MONEY</center></h3>
					
				    <table>
						
						<hr>
				          <center><font color="Green">TO ACID/ACCOUNT</font></center>
						 <tr>
						<td> <input type="number" hidden name="trnno" id="trnno" value="100" readonly="readonly"  Placeholder="CUID Auto_incrementd"/></td>
                        </tr>
						<tr>
						<td>ACID:</td>
                        <td> <input type = "number" name = "acid1" id="acid13" Placeholder="RECEIVER ACID"></td>
                      </tr>
				
                       <tr>
                        
                        <td>AMOUNT:</td>
                        <td><input type = "number" name = "amt1" id="amt13" Placeholder="AMOUNT"></td>
                       </tr>   
					   
					   </table>
					   <table>
					   <hr>
						  <center><font color="red">YOUR ACCOUNT</font></center>
						  <tr>
						  <td><input type="radio" name="trm" value="Db A" id="trm" checked hidden></td>
						  </tr>
						   <tr>
						  <td><input type="radio" name="trm1" value="Cr A" id="trm1" checked hidden></td>
						  </tr>
						  <tr>
						  <td>
						   <textarea id="demo1" name="dot" hidden>
                               </textarea>				      		
							<script>
                                  window.onload = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_time+" "+current_date;	
	document.getElementById("demo1").innerHTML = date_time;
							    }, 1000);
    
	
								
							
   	                             </script>
							</td>						    
              			  </tr>
						  <tr>
						  <td>
						  
						   <textarea id="demo2" name="dot1" hidden>
                               </textarea>	
							   <script>
                                  window.onload = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	//var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_date;	
	document.getElementById("demo2").innerHTML = date_time;
							    }, 1000);
    
	
								
							
   	                             </script>
						  
						  
						  
						  </td>
						  </tr>
						  
						  
                       <tr>
					      <%
					   //int no13 =Integer.parseInt(request.getParameter("acid"));
					   session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid id=acid3 hidden>"+no1+"</textarea>");
						
                        %> 
						</tr>
                          <tr>
						<td>PWD:</td>
                        <td><input type = "password" name = "pass" id="pass3" Placeholder="PASSWORD"></td>
                       </tr>
					   <tr>
                        <td></td>
                        <td><input type = "submit" value="PAY" name = "s1" onClick ="login3(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                       </tr>
					  <br>
					    
					   
                </table>
            </fieldset>
        </form>
		
           </center>
 
 </div>

 <div id="b5" class="containerTab" style="display:none;background:	#add8e6	">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  
		<script LANGUAGE="JavaScript">
         
    function login4(form)
	{
		//var acid = document.getElementById("acid4").value;
		//var amt = document.getElementById("amt").value;
		//var pass = document.getElementById("pass4").value;
		var acid1 = document.getElementById("acid14").value;
		var amt1 = document.getElementById("amt14").value;
		//var trm1 = document.getElementById("trm1").value;
		// var r =confirm("YOUR TRANSFERING FUND TO ANOTHER AC");
		//var phone = document.getElementById("phone").value;
		/*if(acid=='')
		{
			alert("please enter ACID");
			return false;
		}*/
	
	
		 if(amt1=='')
		{
        	alert("enter AMT");
			return false;
		}
	   
         else if(acid1=='')
		{
			alert("please enter Target ACID");
			return false;
		}
		  else if(acid1>=123)
		{
			alert("AC Not EXIST IN SKA BANK");
			return false;
		}
	
	
		else if(amt1=='')
		{
        	alert("enter AMT");
			return false;
		}
	   
	   
	  
		
	 
		
		
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
	</script>
 
	<center>
        <form name=F11 method = "post" onSubmit="return login4(this)" id="cr" action = "jsmreq.jsp">
		<br>
              <fieldset style="width:28%; height:25%; background-color:#FFCC00">
                    <h3><center>REQ MONEY</center></h3>
					
				    <table>
					  
                       <tr>
					   <%
					     //int no13 =Integer.parseInt(request.getParameter("acid"));
					   session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid hidden>"+no1+"</textarea>");
						
                        %> 
                         </tr>
					   
					    </table>
						<hr>
						
						<table>
				          <center><font color="Green">TO ACID/ACCOUNT</font></center>
						 <tr>
					
					   
                        <td>ACID:</td>
                        <td> <input type = "number" name = "acid1" id="acid14" Placeholder="REQ ACID"></td>
                      </tr>
				
                       <tr>
                        
                        <td>AMOUNT:</td>
                        <td><input type = "text" name = "amt1" id="amt14" Placeholder="REQ AMOUNT"></td>
                       </tr>
                    
					  
                        
                 <tr>
					
                        <td></td>
                        <td><input type = "submit" value="REQ" name = "s1" onClick ="login4(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                       </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
  
  
  
  
  </div>


<script>
function openTab(tabName) {
  var i, x;
  x = document.getElementsByClassName("containerTab");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(tabName).style.display = "block";
}
</script>
<br>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

/* The grid: Three equal columns that floats next to each other */
.column1 {
  float: left;
  width: 33.33%;
  padding: 35px;
  text-align: center;
  font-size: 18px;
  cursor: pointer;
  color: white;
}

.containerTab {
  padding: 20px;
  color: white;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Closable button inside the container tab */
.closebtn {
  float: right;
  color: red;
  font-size: 45px;
  cursor: pointer;
}
</style>


<div class="row">
  <div class="column1" onclick="openTab1('b11');" style="background:#f5deb3;">
    <font color="black">TRANSACTION HISTORY</font>
  </div>
  <div class="column1" onclick="openTab1('b22');" style="background:	#00ff00	;">
    <font color="black">VIEW MONEY REQUEST'S</font>
  </div>
  <div class="column1" onclick="openTab1('b33');" style="background:#C0C0C0;">
    <font color="black">YOUR FEEDBACK</font>
  </div>
</div>


<div id="b11" class="containerTab1" style="display:none;background:#87cefa">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <center>

 <br>
<%	 
    int t=Integer.parseInt(request.getParameter("acid"));
		 ps24.setInt(1,t);
		 ResultSet rs24 = ps24.executeQuery();
		  out.println("<center><font color=Red>TRANSACTIONS TO</font></center>");
		 out.println("<center>");
		out.println("<table border=3 bgcolor=#ffefd5 height=20 width=700>");
		out.println("<tr>");
		out.println("<th>TRNO</th>");
		out.println("<th>FACID</th>");
		out.println("<th>FUND/RS</th>");
		out.println("<th>TACID</th>");
		out.println("<th>TRM</th>");
		out.println("<th>DOT</th>");
		out.println("</tr>");
         while(rs24.next())
        {
            out.println("<tr>");
			out.println("<td>"+rs24.getInt(1)+"</td>");
			out.println("<td>"+rs24.getInt(2)+"</td>");
			out.println("<td>"+rs24.getInt(3)+"</td>");
			out.println("<td>"+rs24.getInt(4)+"</td>");
		    out.println("<td>"+rs24.getString(5)+"</td>");
			out.println("<td>"+rs24.getString(6)+"</td>");
			out.println("</tr>");
          }
        out.println("</table>");
		out.println("</center>");
		out.println("<br>");
      out.println("<center><font color=	#0000ff>TRANSACTIONS FROM</font></center>");
 
    int t1=Integer.parseInt(request.getParameter("acid"));
		 ps25.setInt(1,t1);
		 ResultSet rs25 = ps25.executeQuery();
		 
		 out.println("<center>");
		out.println("<table border=3 bgcolor=#ffefd5 height=20 width=700>");
		out.println("<tr>");
		out.println("<th>TRNO</th>");
		out.println("<th>FACID</th>");
		out.println("<th>FUND/RS</th>");
		//out.println("<th>TACID</th>");
		out.println("<th>TRM</th>");
		out.println("<th>DOT</th>");
		out.println("</tr>");
         while(rs25.next())
        {
            out.println("<tr>");
			out.println("<td>"+rs25.getInt(1)+"</td>");
			out.println("<td>"+rs25.getInt(2)+"</td>");
			out.println("<td>"+rs25.getInt(3)+"</td>");
			out.println("<td>"+rs25.getString(4)+"</td>");
			out.println("<td>"+rs25.getString(5)+"</td>");
			out.println("</tr>");
          }
        out.println("</table>");
		out.println("</center>");
		out.println("<br>");



%>

 <br>
 
 
 
 
 
</center>
  
  </div>

<div id="b22" class="containerTab1" style="display:none;background:#afeeee">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
 
 
<center>

 <br>
<%	  int a=Integer.parseInt(request.getParameter("acid"));
		 ps22.setInt(1,a);
		 ResultSet rs11 = ps22.executeQuery();
		 
		 out.println("<center>");
		out.println("<table border=3 bgcolor=orange height=6 width=490>");
		out.println("<tr>");
		out.println("<th> Money Req From ACID</th>");
		out.println("<th>Requested Money RS</th>");
		out.println("</tr>");
         while(rs11.next())
        {
            out.println("<tr>");
		    out.println("<td>"+rs11.getString(1)+"</td>");
			out.println("<td>"+rs11.getString(2)+"</td>");
			out.println("</tr>");
          }
        out.println("</table>");
		out.println("</center>");
		out.println("<br>");


%>

 
</center>
 
 
 
 
 </div>

<div id="b33" class="containerTab1" style="display:none;background:#f0ffff">
  <span onclick="this.parentElement.style.display='none'" class="closebtn">&times;</span>
  <center>

<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var name = document.getElementById("name").value;
		var feed = document.getElementById("feed").value;
		if(name =='')
		{
			alert("please enter Your Name");
			return false;
		}
		else if(feed=='')
		{
        	alert("Enter Your FeedBack");
			return false;
		}
		else
		{
		  //alert("please fill corect details");
		  //window.location.href =ul;
		 //const myWindow.document.open(+<form method = post action = "http://192.168.43.42:8181/test/Jdbin.jsp"); 
		  //document.writeln("<form method = post action = http://192.168.43.42:8181/uservaljsp/Jdbin.jsp ">
		}
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
    <br>
	<center>
        <form method = "post" onSubmit="return login(this)" action = "feedback.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center>FeedBack Page</center></h3>
                <hr>
                <table>
                    <tr>
					   /*<%
					     //int no13 =Integer.parseInt(request.getParameter("acid"));
					   session.setAttribute("acid",no1);
					    out.println("<textarea rows1 cols=15 name = acid hidden>"+no1+"</textarea>");
						
                        %> */
                        <td>Name:</td>
                        <td> <input type = "text" name = "name" id="name" Placeholder="NAME"></td>
                    </tr>
                    <tr>
                        <td>FeedBack:</td>
                        <td><textarea name = "feed" id="feed"  Placeholder="YOUR FEEDBACK HERE"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "Submit" value="Submit FeedBack" name = "s1" onClick ="login(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>	
           </center>

</center>

  </div>

<script>
function openTab1(tabName1) {
  var i, x;
  x = document.getElementsByClassName("containerTab1");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  document.getElementById(tabName1).style.display = "block";
}
</script>




<script>
var acc = document.getElementsByClassName("accordion1");
var i;
for (i = 0; i <acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>
</body>
</html>