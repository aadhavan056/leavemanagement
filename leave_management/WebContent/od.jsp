<%@ page import="java.sql.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 2px solid #ccc;}

#mySidenav a {
    position: absolute;
    left: -80px;
    transition: 0.3s;
    padding: 15px;
    width: 100px;
    text-decoration: none;
    font-size: 20px;
    color: white;
    border-radius: 0 5px 5px 0;
}

input[type=text], input[type=password] ,input[type=date] {
  width: 25%;
  padding: 8px 20px;
  margin: 10px 0;
  display: inline-block;
  border: 2px solid #ccc;
  box-sizing: border-box;
}
#period,#reason,#day
{
	width: 25%;
	padding: 8px 20px;
	margin: 10px 0;
	display: inline-block;
	border: 2px solid #ccc;
	box-sizing: border-box;
}
#mySidenav a:hover {
    left: 0;
}
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 20%;
}
button:hover {
  opacity: 0.2;
}


#home {
    top: 80px;
    background-color: #4CAF50;
}

#leave {
    top: 140px;
    background-color: #2196F3;
}

#OD {
    top: 200px;
    background-color: #f44336;
}

#logout{
	top: 320px;
	background-color:#666;
}
body {
    margin: 0;
  font-family: Arial, Helvetica, sans-serif;
    background-image: url("image/image.png");
    background-repeat: no-repeat;
    background-size: 1920px 768px ;
}
.container {
  padding: 16px;
  

}

</style>
<title>Leave Management</title>
</head>
<body>
<center> <h2><u>OD/MC Form</u> </h2></center>
<div id="mySidenav" class="sidenav">
  
  <a href="student.jsp" id="home">Home</a>
  <a href="leave.jsp" id="leave">leave</a>
  <a href="OD.jsp" id="OD">OD/MC</a>
  <a href="#" id="logout">logout</a>
  
</div>
<div class="container" align="center">
<div style="margin-left:150px;">
    <form action="odform.jsp" method="POST">
        
        
		<label for="subject"><b>Reason:</b></label>
		<select id="reason" name="reason">
		<option value="leave">leave</option>
		<option value="OD">OD</option>
		<option value="MC">MC</option>
		
		</select>
		<br/>
		<br/>
		<label for="period"><b>Period:</b></label>
		<select id="period" name="period">
		
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		
		</select>
		<br/>
		
		
		<label for="day"><b>Day:</b></label>
		<select id="day" name="day">
		
		<option value="mon">mon</option>
		<option value="tues">tues</option>
		<option value="wed">wed</option>
		<option value="thur">thur</option>
		<option value="fri">fri</option>
	
		
		</select>
		<br/>
        <label for="note"><b>Note:</b></label>
		<input type="text" name="note"><br> <br>
        
		<label for="date"><b>Date:</b></label>
		<input type="date" name="fdate"><br> <br>
        
		<label for="choosefile"><b>Choose File:</b></label>
		<input type="text" name="f1" size=200><br> <br>
        
        <button type="submit">Submit</button>
	</div>
        </form> 
 </div>
 </body>
 </html>
