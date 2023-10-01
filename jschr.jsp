
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!
    Connection con;
    PreparedStatement ps1, ps2,ps2b,ps2a;
    public void jspInit()
    {
        try
        {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps1 = con.prepareStatement("select count(*) from skaadm where adname = ? and adpass=?");
            ps2 = con.prepareStatement("select * from skaadm");
            ps2b = con.prepareStatement("select sum(amt) from userreal");
		    ps2a = con.prepareStatement("select acid,username,gender,amt,trm,address,phone from userreal ORDER BY acid");
       
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
        
        String user1 = request.getParameter("namec");
        String pass = request.getParameter("passc");
        
        ps1.setString(1,user1);
        ps1.setString(2,pass);
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
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
            out.println("<b><i><font color=red>Wel come Cashier</font></i></b><br>"+user1);
            out.println("<b><i><font size=4 color=blue>To SKA BANK</font></i></b>");
            out.println("</fieldset></form>");
			
        
		//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
			
		
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
			ps2b.close();
			ps2a.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<html>
<head>

<title>Welcome Cashier</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header">
	<h1>SKA - BANKING<span class="style1"></span></h1>
    <h2>Express Service</h2>	

</div>

 <div id="navigation">
    <ul>
   <li><a href="Home"><IMG SRC="images/home1.gif"></a></li>
		<li>
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
	</li>
    <li><a href="logout.jsp"><img src="images/lo3.png" width="40"height="40" placeholder="logout" name="logout"></a></li>
	</ul>
	
 </div>
<br>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial;
  color: white;
}

.split {
  height: 100%;
  width: 120%;
  position: fixed;
  z-index: 1;
  top: 0;
  overflow-x: hidden;
  padding-top: 20px;
}

.left {
  left: 0;
  background-color: #111;
}

.right {
  right: 0;
  background-color: red;
}

.centered {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  text-align: center;
}

.centered img {
  width: 150px;
  border-radius: 50%;
}
</style>
</head>
<body>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  padding: 10px;
  height: 400px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
</style>




<div class="row">
  <div class="column" style="background-color:white;">
<table style="width:380px; background:#FFFFFF; margin:0">
<caption><marquee align="left" behavior="alternate" scrollamount="12"><h3><font color="blue">SKA BANK SERVICES</font></h3></marquee></caption>
<tr>
<td>
<button class="accordion">BAL ENQ </button>
<div class="panel">
  <script>
    function logina(form)
	{
		var ais1 = document.getElementById("accid1").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(ais1 =='')
		{
			alert("Please enter Account Number/id");
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
           <form method = "post" onSubmit="return logina(this)" action ="bals.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff ">
                <h3><center>BALANCE ENQ</center></h3>
                <hr>
                <table >
                    <tr>
                        <td>ACNO:</td>
                        <td> <input type = "number" name = "accid" id="accid1"  Placeholder="Account Number"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ" name = "s1"  onClick ="logina(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					  
                </table>
            </fieldset>
        </form>
		</center>
</div>

</td>


<tr>
<td>
<button class="accordion">Bal ENQ BY MBL NUMBER TBL BAL</button>
<div class="panel">
<script>
	
    function login3(form)
	{
		var phn = document.getElementById("phone3").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(phn3=='')
		{
			alert("please enter MOBILE NUMBER");
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
           <form method = "post" onSubmit="return login3(this)" action = "acphstb.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff">
                <h3><center>BAL ENQ BY MOBILE NUM,TOTAL BAL </center></h3>
                <hr>
                <table>
                    <tr>
                        <td>MBl NUM:</td>
                        <td> <input type = "number" name="phone" id="phone3"  Placeholder="AC Mobile"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ BY MOBILE" name = "s1"  onClick ="login3(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					   <tr>
                        <td></td>
                       
                    </tr>
                 </table>
               </fieldset>
            </form>
    </center>
</div>

</td>
</tr>




<tr>
<td>

<button class="accordion">BAL ENQ AC NAMES TBL</button>
<div class="panel">
<script>
	
    function login4(form)
	{
		var une = document.getElementById("username4").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(une =='')
		{
			alert("please enter AC NAME");
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
           <form method = "post" onSubmit="return login4(this)" action = "acntb.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff">
                <h3><center>Bal ENQ AC NAMES TOTAL </center></h3>
                <hr>
                <table>
                    <tr>
                        <td>A/C MOBILE NUMBER:</td>
                        <td> <input type = "text" name="username" id="username4"  Placeholder="AC Name"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ " name = "s1"  onClick ="login4(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					   <tr>
                        <td></td>
                    </tr>
                </table>
            </fieldset>
        </form>
        </center>
</div>


</td>
</tr>


<tr>
<td>

<button class="accordion">MOBILE UPDATE</button>
<div class="panel">
 
			<script LANGUAGE="JavaScript">
	//executed success fully
	  //var users = [{ uname: 'Sai', pwd1: 'Sai1' },{ uname: 'Ramesh', pwd1: 'Ramesh1' },
     //{ uname: 'Rajitha', pwd1: 'Rajitha1' }];
         
    function login5(form)
	{
	     var acid = document.getElementById("acid5").value;
		var uname = document.getElementById("name5").value;
		var phone = document.getElementById("phone5").value;
		var r =confirm("YOUR READY TO MOBILE NUMBER CHANGE FOR AC");
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
        if(acid=='')
		{
			alert("please enter ACID.");
			return false;
		}
		else if(uname =='')
		{
			alert("please enter user name.");
			return false;
		}
		else if(phone=='')
		{
        	alert("enter the Mobile Number");
			return false;
		}
		     if(r==true)
	   {
	   //alert("SUCCESSFULLY MOBILE NUMBER CHANGE For AC");
	   
	    //return true;
	   }
		else
		{ 
		  alert("MOBILE NUMBER CHANGE Denied");
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
           <form method = "post" onSubmit="return login5(this)" action = "jdphnc.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff">
                <h3><center>AC Mobile Num update</center></h3>
                <hr>
                <table>
				<tr>
                        <td>ACID:</td>
                        <td> <input type = "number" name = "acid" id="acid5" Placeholder="Account Number"></td>
                    </tr>
                    <tr>
                        <td>AC NAME:</td>
                        <td> <input type = "text" name = "name" id="name5" Placeholder="AC User Name"></td>
                    </tr>
                    <tr>
                        <td>MOBL NO:</td>
                        <td><input type = "number" name = "phone" id="phone5"  Placeholder="New Mobile Number"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Update" name = "s1"  onClick ="login5(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()"></td>
						
                    </tr>
                </table>
            </fieldset>
        </form>

           </center>
</div>

</td>
</tr>


<tr>
<td>

   <button class="accordion">PIN UPDATE </button>
   <div class="panel">

			<script LANGUAGE="JavaScript">
	//executed success fully
	  //var users = [{ uname: 'Sai', pwd1: 'Sai1' },{ uname: 'Ramesh', pwd1: 'Ramesh1' },
     //{ uname: 'Rajitha', pwd1: 'Rajitha1' }];
         
    function login6(form)
	{
	     var acid6 = document.getElementById("acid6").value;
		var uname6 = document.getElementById("name6").value;
		var pwd6 = document.getElementById("pass6").value;
		var r =confirm("YOUR REDAY PINCHANGE FOR AC ");
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
        if(acid6=='')
		{
			alert("please enter ACID.");
			return false;
		}
		else if(uname6=='')
		{
			alert("please enter user name.");
			return false;
		}
		else if(pwd6=='')
		{
        	alert("enter the password");
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
           <form method = "post" onSubmit="return login6(this)" action = "Jdpin.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff">
                <h3><center>AC PIN UPDATE</center></h3>
                <hr>
                <table>
				<tr>
                        <td>ACID:</td>
                        <td> <input type = "number" name = "acid" id="acid6" Placeholder="Account Number"></td>
                    </tr>
                    <tr>
                        <td>AC NAME:</td>
                        <td> <input type = "text" name = "name" id="name6"  Placeholder="AC Name"></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type = "password" name = "pass" id="pass6" Placeholder="AC Pass"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Pin change" name = "s1"  onClick ="login6(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						 </td>
                    </tr>
                </table>
            </fieldset>
        </form>

        
		
           </center>
</div>
</td>
</tr>


<tr>
<td>
<button class="accordion">A/c HOLDER WITH All DETAILS</button>
<div class="panel">
  
			<script>
	
    function login7(form)
	{
		var ais2 = document.getElementById("accid7").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(ais2 =='')
		{
			alert("please enter Account number/id");
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
           <form method = "post" onSubmit="return login7(this)" action = "alacd.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff">
                <h3><center>AC ALL DETAILS</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>Accid:</td>
                        <td> <input type = "number" name = "accid" id="accid7"  Placeholder="Account Number"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ" name = "s1"  onClick ="login7(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					   <tr>
                        <td></td>
                    </tr>
                </table>
            </fieldset>
        </form>

        
		
           </center>
</div>
</td>
</tr>

<tr>
<td>

<button class="accordion">TOTAL FUND IN BANK</button>
<div class="panel">

<%
   
        ResultSet rs2b = ps2b.executeQuery();
        out.println("<center>");
		out.println("<table border=3 bgcolor=orange bordercolor=red>");
		out.println("<tr>");
		out.println("<th>Total Cash In Bank</th>");
		//out.println("<th>PASSWORD</th>");
		out.println("</tr>");
         while(rs2b.next())
        {
            out.println("<tr>");
		//out.println("\n ammount in bank");
            out.println("<td>"+rs2b.getString(1)+"</td>");
            //out.println("<td>"+rs2b.getString(2)+"</td>");
            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

        rs2b.close();
    
	%>

</div>
</td>
</tr>
<tr>
<td>

<button class="accordion">A/C CLOSE</button>
<div class="panel">
  
<script>      
    function login8(form)
	{
		var accid8 = document.getElementById("accid8").value;
		if(accid8 =='')
		{
			alert("please enter account id ");
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
           <form method = "post" onSubmit="return login8(this)" action = "clacc.jsp" >
            <fieldset style="width:70%; background-color:#b3d1ff">
                <h3><center>Ac Close Page</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>AC:</td>
                        <td> <input type = "number" name = "accid" id="accid8" Placeholder="Account Number"></td>
                    </tr>
                   
                    <tr>
					<td></td>
                        
                        <td><input type = "submit" value="Delete A/C" name = "s1"  onClick ="login8(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
						
                    </tr>
                </table>
            </fieldset>
        </form>
		
           </center>
</div>

</td>
</tr>

</table>
	
  </div>
  
  
  
  <div class="column" style="background-color:white;">
    
	
    	<div id="welcome" style="border-right:#666666 1px dotted;">
		<center><h1><font color="Green">Welcome</font></h1></center><br>
    	    <center><img src="images/dollar.webp" alt="business" width="196" height="146"></center><br>
		    <p>Each people plan their Money To Deposte There Money in the bak here it is a Right place to deposte.</p>
	    	
	    </div>      
		
		
   	  <div id="news"><h1><marquee direction="right" behavior="alternate" scrollamount="2"><font color="orange">News &amp; Events</font></marquee></h1><br>
      	<div class="img"><img src="images/bank.webp" alt="Business" width="100" height="110"></div>
       <center> <h2>Nov. 2, 2022.</h2>
        <p>Get your dream To deposit In SKA Bank at this website</p>
		       <br>
			   <br>
                <h2>Nov. 10, 2022.</h2>
                 <p>Get your dream Comes True At SKA Bank.</p></center>
      
      </div>
	  <br>
	  <br>
         
          <div id="footer_copyright" >
             
			 <center><img src="images/arch3.jpg"  alt="business"  width="196" height="106"></center><br>
			 
    	    <p>Each people plan their Money To deposit Bank and to be a happy Life.</p>
	  
         Copyright © SKA BANKING DEVELOPMENTS ALL RIGHTS RECEIVED 2023<br>
          THIS SITE IS DEVELOPED BY SKA DEVELOPMENTS ALL RIGHTS RECEIVED 2023
</div>
      
	  
  
  
  </div>
 
 <font color="green"><h3>SERVICES</h3></font>
  <div class="column" style="background-color:light-blue;">
         
<table width="390">
<tr>
<td>		 
  
<button class="accordion">Create AC</button>
<div class="panel">
  
    
	
  
       >
<link href="style.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}


/* Set a style for all buttons */
button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 15px;
  margin: 8px 0;
  border: none;
   cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Create AC</button>
<center>
<div id="id01" class="modal">
  
   
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	

	
<SCRIPT LANGUAGE="JavaScript">
function dil9(form)
{
   var acid9 = document.getElementById("acid9").value;
   var usr9 = document.getElementById("username9").value;
  var pass9 = document.getElementById("pass9").value;
  var trm9 = document.getElementById("trm9").value;
  var gen9 = document.getElementById("gen9").value;
   var adr9 = document.getElementById("address9").value;
    var dob9 = document.getElementById("dob9").value;
   var phn9 = document.getElementById("phn9").value;
	if(acid9=='')
	{
	
       alert("please enter ACID");
			return false;	
			}
			
	else if(usr9=='')
	{
	
       alert("please enter Username");
			return false;	
			}
			else if(pass9=='')
	{
	
       alert("please enter Password");
			return false;	
			}
					else if(trm9=='')
	{
	
         alert("please enter Transaction Mode");
		  document.F1.trm9.focus();
			return false;	
			}
			
	
			else if(gen9=='')
	{
	
       alert("please select gen");
			return false;	
			}
	
			else if(addr9=='')
	{
	
       alert("Please Enter Address");
			return false;	
			}
	      
		  else if(dob9=='')
	{
	
       alert("Please Enter DOB");
			return false;	
			}
	
	
	
	   if(!isNaN(document.F1.amt9.value))
   {
	   if(document.F1.amt9.value < 500)
	   {
		 alert("Minimum Balance should be 500 /-");
		 document.F1.amt9.value="";
		 document.F1.amt9.focus();
         return false   ;
	   }
   }
   else
   {
       alert("This  field  must  be  number");
	   document.F1.amt9.value="";
	   return false;
   }
	if(!isNaN(document.F1.phn9.value))
   {
	   if(document.F1.phn9.value >9999999999 )
	   {
		 alert("this not come");
		 document.F1.phn9.value="";
		 document.F1.phn9.focus();
         return false;   
	   }
   }
   else
   {
       alert("This  field  must  be  number");
	   document.F1.phn9.value="";
	   return false;
   }

   
	
       for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields");
		   //document.F1.pass9.focus();
		   return false;
		}
   }
return true;
   }
</SCRIPT>
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>
<div id="header">
	<h1>SKA BANK<span class="style1"></span></h1>
    <h2><font color="red">Express Service</font></h2>
    	
</div>

<table style="width:100px; background:#FFFFFF; margin:0" height="50px">
<tr >
	<td width="00" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		<table border=4px bgcolor="#b3ffff">
		<tr>
		<td>
		</td>
		</tr>
		<td>
		 <font color=" #33cccc"<p>here partial db account</p>
		 </td>
		 <tr>
		 <td>
		 <a href="jdbsucp.jsp" target="_blank">View Partial Customers</a>
			</td></tr>
			</table>
       </div>
	</td>
    
    <td width="100" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>OPEN ACCOUNT FORM</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
			
		</tr>
		<tr>
			<td>
				<form name=F1 method="post" onSubmit="return dil9(this)" action="accountreal.jsp" >
				  <table cellspacing="4" cellpadding="1">	
				     <tr><font color="red">* Feilds Are Mandatory</font></tr>
					 <tr><td><input type="number" name="acid" id="acid9" value="1" readonly="readonly" hidden Placeholder="Account Number Auto_incrementd"/></td></tr>
					 <tr><td>AC NAME<font color="red">*</font>:</td><td> <input type="text" name="username" id="username9" Placeholder="AC Name"/></td></tr>
					<tr><td>PASS<font color="red">*</font>:</td><td> <input type="password" name="pass" id="pass9" Placeholder="AC PASS"/></td></tr>
				    <tr><td>AMOUNT<font color="red">*</font>:</td><td> <input type="number" name="amt" id="amt9" Placeholder="Amount"/></td></tr>
					<tr><input type="text" name="trm" id="trm9" value="AC Bo" hidden Placeholder="Transaction Mode"/></td></tr>
					<tr><td>GENDER<font color="red">*</font>:<br/><br/></td>
					<td>Male<input type="radio" name="gen" value="male" id="gen9">Female<input type="radio" name="gen" value="female" id="gen9"/>Not To Specify<input type="radio" name="gen" value="DSpecify" id="gen9"/><br/><br/></td></tr>
					<tr><td>ADDRESS<font color="red">*</font>:</td><td> <input type="text" name="adderess" id="address9"Placeholder="Address"/></td></tr>
					<tr><td>PHONE<font color="red">*</font>:</td><td> <input type="number" name="phn" id="phn9" Placeholder="Mobile Number"/></td></tr>
					<tr><td>DOB<font color="red">*</font>:</td><td> <input type="date" name="dob" id="dob9"/></td></tr>
					<tr><td>
					 <textarea id="demo1" name="doo1" hidden>
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
					</td><td><input type="submit" value="Submit" onClick ="dil9(this.form)"/>
			        <INPUT TYPE=RESET VALUE="CLEAR">
					
					</td></tr>
					</table>
               		</form>
			</td>
		</tr>
	
	</table>
    	   </div>      
    </td>
    
   <td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Delete Partial Customer</h1><br>
    	    <center><img src="images/arch2.jpg" alt="business" width="196" height="106"></center><br>
		<script>
	  
    function login10(form)
	{
		var cuid = document.getElementById("cuid10").value;

		if(cuid10=='')
		{
			alert("please enter CUID ");
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
	
		</script>
	    	<form method = "post" onSubmit="return login10(this)" action = "claccp.jsp" >
            <fieldset style="width:13%; background-color:#b3d1ff">
                <h3><center>Partial Account Close Page</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>CUID:</td>
                        <td> <input type = "text" name = "cuid" id="cuid10" placeholder="Partial CUID"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="Delete Patial A/c" name = "s1"  onClick ="login10(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
						
                    </tr>
                </table>
            </fieldset>
        </form>          
	    </div>      
    </td>
             	
    
</tr>
</table>
    


<div id="footer_top">
 
  <div id="footer_copyright" >
 
    	    <center><img src="images/arch3.jpg"  alt="business"  width="196" height="106"></center><br>
		    <p>Each people plan their site layouts depending upon their business type. Here comes a free designer template which provides you with a selection of different kinds of webdesign   starting from business template, fashion template, media template, Science template, Arts template and much more.</p>
	  
  Copyright © SKA BANKING DEVELOPMENTS ALL RIGHTS RECEIVED 2023
  </div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>


<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script> 
</div>
<tr>
<td>
		 
<button class="accordion">FUND DEPOSIT</button>
<div class="panel">
   
		<script LANGUAGE="JavaScript">
         
    function login11(form)
	{
		var acid11 = document.getElementById("acid11").value;
		//var name = document.getElementById("name").value;
		var amt11 = document.getElementById("amt11").value;
		var trm11 = document.getElementById("trm11").value;
		 var r =confirm("YOUR DEPOSITE FUND TO AC");
		//var phone = document.getElementById("phone").value;
		if(acid11=='')
		{
			alert("please enter ACID");
			return false;
		}
	
	
		else if(amt11=='')
		{
        	alert("enter AMT");
			return false;
		}
	   	else if(trm11=='')
		{
        	alert("enter TRM");
			return false;
		}
	         if(r==true)
	   {
	  // alert("SUCCESSFULLY DEPOSITED to AC");
	   //return true;
	   }
	    
		else
		{ 
		  alert("DEPOSITE DENIED");
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
        <form method = "post" onSubmit="return login11(this)" action = "jsdep.jsp">
            <fieldset style="width:50%; background-color:#7cfc00">
                <h3><center>Deposit Form</center></h3>
                <hr>
                <table>
                    <tr>
                        <td>ACID:</td>
                        <td> <input type = "number" name = "acid11" id="acid11" Placeholder="Account Number"></td>
                    <td> <input type="number" name="trnno" value="100" readonly="readonly"  hidden Placeholder="TRNO Auto_incrementd"/></td>
                      <input type="radio" name="trm1d" value="Cr B" checked hidden></td>
						  				
					</tr>
				
                    <tr>
					
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
							
                        
                        <td>AMOUNT</td>
                        <td><input type = "number" name = "amt11" id="amt11" Placeholder="Amount"></td>
                    </tr>
                    
					<tr>
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
						  
						  
						
                        
                        
                        <td><input type = "text" name = "trm11" id="trm11" value="DpB" hidden Placeholder="Transaction Mode"></td>
                    </tr>
                    
					<tr>
					
                        <td></td>
                        <td><input type = "submit" value="Deposite" name = "s1" onClick ="login11(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
  
  </div>
  
  </td>
  </tr>
  
  
<tr>
<td>

<button class="accordion">FUND WITHDRAW</button>
<div class="panel">
      <center>
		<script>
         
    function login12(form)
	{
		var acid12 = document.getElementById("acid12").value;
		//var name = document.getElementById("name").value;
		var amt12 = document.getElementById("amt12").value;
		var trm12 = document.getElementById("trm12").value;
		var r =confirm("YOUR WITHDRAW FUND FROM AC");
		//var phone = document.getElementById("phone").value;
		if(acid12=='')
		{
			alert("please enter ACID");
			return false;
		}
	
	
		else if(amt12=='')
		{
        	alert("enter AMT");
			return false;
		}
	   	else if(trm12=='')
		{
        	alert("enter TRM");
			return false;
		}
	        if(r==true)
	   {
	 /*  alert("WITHDRAWN FROM AC");
	   return true;*/
	   }
	    
		else
		{ 
		  alert("WITHDRAW Denied");
		  return false;
		  
		  
		}
		
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
    
    
	
        <form method = "post" onSubmit="return login12(this)" action = "jswdr.jsp">
            <fieldset style="width:50%; background-color:orange">
                <h3><center><font color="black">Withdraw Form</font></center></h3>
                <hr>
                <table>
                    <tr>
                        <td>ACID:</td>
                        <td> <input type = "number" name = "acid12" id="acid12" Placeholder="Account Number"></td>
                    <input type="number" name="trnno12"  value="100" hidden readonly="readonly"  Placeholder="TRNO Auto_incrementd"/></td>
                      <input type="radio" name="trm12" value="Db B" hidden id="trm1" checked ></td>
					
					
					
					 <textarea id="demo3" name="dot2" hidden>
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
	document.getElementById("demo3").innerHTML = date_time;
							    }, 1000);
    
    
	
								
							
   	                             </script>
							
					
					
					
					</tr>
				
                    <tr>
					
					
					<textarea id="demo4" name="dot3" hidden>
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
	document.getElementById("demo4").innerHTML = date_time;
							    }, 1000);
    
								
							
   	                             </script>
						 
                        
                        <td>AMT</td>
                        <td><input type = "number" name = "amt12" id="amt12" Placeholder="Amount"></td>
                    </tr>
                    
					<tr>
                        
                      
                        <td><input type = "text" name = "trm12" value="WdB" hidden id="trm12" Placeholder="Transaction Mode"></td>
                    </tr>
                    
					<tr>
					
                        <td></td>
                        <td><input type = "submit" value="withdraw" name = "s1" onClick ="login12(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                    </tr>
                </table>
		         
            </fieldset>
        </form>
		
        <br>
           </center>
</div>
<br>

</td>
</tr>  
 
  <tr>
  <td>
   
<button class="accordion">FUND TRANSFER</button>
<div class="panel">
  
  
		<script LANGUAGE="JavaScript">
         
    function login13(form)
	{
		var acid13 = document.getElementById("acid13").value;
		//var amt13 = document.getElementById("amt13").value;
		var trm13= document.getElementById("trm13").value;
		var acid113= document.getElementById("acid113").value;
		var amt113= document.getElementById("amt113").value;
		var trm113 = document.getElementById("trm113").value;
		var r =confirm("YOUR TRANSFERING FUND TO ANOTHER AC");
		//var phone = document.getElementById("phone").value;
		if(acid13=='')
		{
			alert("please enter Sender ACID");
			return false;
		}
	   
	
		/*else if(amt13=='')
		{
        	alert("enter AMT");
			return false;
		}*/
	   	else if(trm13=='')
		{
        	alert("enter TRM");
			return false;
		}
      
         else if(acid113=='')
		{
			alert("please enter Target ACID");
			return false;
		}
		else if(acid113>=128)
		{
        	alert("AC Not EXIST IN SKA BANK");
			return false;
		}
	
	
		else if(amt113=='')
		{
        	alert("enter AMT");
			return false;
		}
	   	else if(trm113=='')
		{
        	alert("enter TRM");
			return false;
		}
	    else if(document.F13.acid13.value==document.F13.acid113.value)
       {
	     alert("Your Trying To Transfer Fund In Same AC!"); 
	     document.F13.acid113.value="";
	     document.F13.acid113.focus();	
	     return false;
		 
	   }
	  /*
		else if(document.F13.amt13.value!=document.F13.amt113.value)
       {
	     alert("Please Confirm AMOUNT Should be Same!"); 
	     document.F13.amt113.value="";
	     document.F13.amt113.focus();	
	     return false;
		 
	   }*/
	   if(r==true)
	  {
	  // alert("Fund Transfered to AC");
	  // return true;
	   }
	    
		else
		{ 
		  alert("Transfere Denied");
		  return false;
		  
		}
		
		
	}

	</script>
    
	<center>
        <form name=F13 method = "post" onSubmit="return login13(this)" id="cr" action = "jstrn.jsp">
              <fieldset style="width:23%; background-color:#b0c4de">
                    <h3><center>FUND TRANSFER</center></h3>
					<hr>
				    <table>
					  <center><font color="red">FROM ACID/ACCOUNT</font></center>
                       <tr>
                        <td>ACID:</td>
						 <td> <input type="number" name="trnno13" id="trnno" value="100" hidden readonly="readonly"  Placeholder="CUID Auto_incrementd"/></td>
                        <td> <input type = "number" name = "acid" id="acid13" Placeholder="Sender ACCOUNT NUMBER"></td>
                        
                         <input type="radio" name="trm131" value="Db B" id="trm131" checked hidden></td>
						 <input type="radio" name="trm132" value="Cr B" id="trm132" checked hidden></td>
						</tr>
					
             <textarea id="demo5" name="dot5" hidden >
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
	document.getElementById("demo5").innerHTML = date_time;
							    }, 1000);
    
	
								
							
   	                             </script>
                        
						
						

                      <textarea id="demo6" name="dot6" hidden>
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
	document.getElementById("demo6").innerHTML = date_time;
							    }, 1000);
    
	
								
							
   	                             </script>
						  					

						
						
                       
                        <td><input type = "text" name = "trm" id="trm13" value="Dbt" hidden Placeholder="Transaction Mode"></td>
                          
					   
					   </tr>
					   <tr>
					   
					  
					  <br>
					  </tr>
					  <br>
					    </table>
						<hr>
						
						<table>
				          <center><font color="Green">TO ACID/ACCOUNT</font></center>
						 <tr>
					
					   
                        <td>ACID:</td>
						
						
                        <td> <input type = "number" name = "acid1" id="acid113" Placeholder="Receiver ACID"></td>
                      </tr>
				
                       <tr>
					  
                        
                        <td>AMOUNT</td>
                        <td><input type = "number" name = "amt1" id="amt113" Placeholder="Amount"></td>
                       </tr>
                    
					    <tr>
                        
                        <td>TRM</td>
                        <td><input type = "text" name = "trm1" value="Cr B" id="trm113" hidden Placeholder="Transaction Mode"></td>
                       </tr>
                    
                    
					    <tr>
					
                        <td></td>
                        <td><input type = "submit" value="Transfer" name = "s1" onClick ="login13(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						
						</td>
                       </tr>
                </table>
            </fieldset>
        </form>
		
        <br>
		
           </center>
		   
		   
  
  
  </div>
  
  
  <button class="accordion">TRANSACTION ENQ</button>
<div class="panel">

<script>
    function logint(form)
	{
		var trnt = document.getElementById("trnt22").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(trnt =='')
		{
			alert("Please enter Transaction Number Number/id");
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
           <form method = "post" onSubmit="return logint(this)" action ="tren.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff ">
                <h3><center>TRANSACTION ENQ</center></h3>
                <hr>
                <table >
                    <tr>
                        <td>TRNO:</td>
                        <td> <input type ="number" name = "trno" id="trnt22" Placeholder="Transaction Number"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ" name = "s1"  onClick ="logint(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					  
                </table>
            </fieldset>
        </form>
		</center>
</div>
  
  
  
  
  
  <button class="accordion">AC TRANSACTION HISTORY</button>
<div class="panel">

<script>
    function logint1(form)
	{
		var aistt = document.getElementById("actrn1").value;
		//var pwd1 = document.getElementById("pass").value;
	    
		if(aistt =='')
		{
			alert("Please enter Account Number/id");
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
           <form method = "post" onSubmit="return logint1(this)" action ="trenac.jsp" >
            <fieldset style="width:50%; background-color:#b3d1ff ">
                <h3><center>AC TRANSACTION STATEMENT</center></h3>
                <hr>
                <table >
                    <tr>
                        <td>ACID:</td>
                        <td> <input type = "number" name = "actr" id="actrn1"  Placeholder="ACID Number"></td>
                    </tr>
                   
                    <tr>
                        <td></td>
                        <td><input type = "submit" value="ENQ" name = "s1"  onClick ="logint1(this.form)">
						<input type="reset" value="Reset" onclick="clearFunc()">
						</td>
                    </tr>
					  
                </table>
            </fieldset>
        </form>
		</center>
</div>
               
			   
			   
			   
<button class="accordion">ALL AC HOLDERS</button>
<div class="panel">
 
<button onclick="document.getElementById('id011').style.display='block'" style="width:auto;">ALL AC</button>

<div id="id011" class="modal">
  
  <form class="modal-content animate" method="post">
    <span onclick="document.getElementById('id011').style.display='none'" class="close" title="Close Modal">&times;</span>
     	 
    <%
   
        ResultSet rs2a = ps2a.executeQuery();
        out.println("<center>");
		out.println("<table border=3 bgcolor=orange>");
		out.println("<tr>");
		out.println("<th>AC NUMBER</th>");
		out.println("<th>USER NAME</th>");
		out.println("<th>GENDER</th>");
		out.println("<th>BALANCE</th>");
		out.println("<th>TRM</th>");
		out.println("<th>ADDRESS</th>");
		out.println("<th>MOBILE NUMBER</th>");

		out.println("</tr>");
         while(rs2a.next())
        {
            out.println("<tr>");
		//out.println("\n ammount in bank");
            out.println("<td>"+rs2a.getInt(1)+"</td>");
            out.println("<td>"+rs2a.getString(2)+"</td>");
			out.println("<td>"+rs2a.getString(3)+"</td>");
			out.println("<td>"+rs2a.getInt(4)+"</td>");
			out.println("<td>"+rs2a.getString(5)+"</td>");
			out.println("<td>"+rs2a.getString(6)+"</td>");
			out.println("<td>"+rs2a.getString(7)+"</td>");
			//out.println("<td>"+rs2a.getString(8)+"</td>");

            out.println("</tr>");
        }
        out.println("</table>");
		out.println("</center>");

        rs2a.close();
    
	%>
	  
  </form>
</div>

</div>  
			   
<script>
// Get the modal
var modal1 = document.getElementById('id011');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}
</script>		   
		 </td>
		
		 </tr>
		 </table>
		  
		  
	  <br>
	
	  <center>
	  <table border="4px" bordercolor="green">
	  <tr>
	  <td>
        <a href="feedbp.jsp"><font color="blue">USERS FEEDBACK PAGE</font></a>	
     </td>
	 </tr>
	 <tr>
	  <td>
        <a href="clfed1.jsp"><font color="blue">FEEDBACK DELETE PAGE</font></a>	
     </td>
	 </tr>
	 
	 </table></center>
  </div>
</div>


 <style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 15px;
 height: 60px;
  border: none;
  text-align: center;
  outline: none;
  font-size: 18px;
  transition: 0.5s;
}

.active, .accordion:hover {
  background-color: #ccc; 
}

.panel {
  padding: 25px;
  display: none;
  background-color: white;
  overflow: hidden;
}
</style>


<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
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
