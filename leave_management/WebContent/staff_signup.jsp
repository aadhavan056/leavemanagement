<%@page import="java.security.SecureRandom"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {border: 2px solid #ccc;}

input[type=text], input[type=password] {
  width: 25%;
  padding: 8px 20px;
  margin: 10px 0;
  display: inline-block;
  border: 2px solid #ccc;
  box-sizing: border-box;
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


.imgcontainer {
  text-align: center;
  margin: 8px 0 3px 0;
}

img.avatar {
  width: 20%;
  border-radius: 50%;
}

.container {
  padding: 16px;
  

}


}
</style>
</head>
<body>

<center> <h2>Staff Portal</h2> </center>

<form action="staff_signup_insert.jsp" method="post">
  <div class="imgcontainer">
    <img src="staff.png" alt="Avatar" class="avatar">
  </div>

  <div class="container" align="center">
	
	<label for="name"><b>Name:</b></label> 
    <input type="text" placeholder="Enter your Name" name="name" required>
	<br/>
	<br/>
	<label for="staffid"><b>staff id:</b></label> 
    <input type="text" placeholder="Enter your id" name="staffid" required>
	<br/>
	<br/>
	<label for="subject"><b>Choose Subject:</b></label>
	<select id="subj" name="subj">
	<option value="IS">IS</option>
	<option value="IP">IP</option>
	<option value="MC">MC</option>
	<option value="PDS">PDS</option>
	<option value="OE">OE</option>
	<option value="PE">PE</option>
	<option value="CIP">CIP</option>
	<option value="ISlAB">IS Lab</option>
	<option value="IPLAB">IP Lab</option>
	</select>
	<br/>
	<br/>
	
    <label for="uname"><b>Username:</b></label> 
    <input type="text" placeholder="Enter Username" name="username" required>
	<br/>
    <label for="psw"><b>Password:</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
    <br/>    
	<label for="cpsw"><b>Confirm Password:</b></label>
    <input type="password" placeholder="Enter Password" name="cpass" required>
    <br/>    
	
    <label for="captcha"> <b> Captcha : </b></label>
					<%
                        SecureRandom random = new SecureRandom();
                        int num = random.nextInt(100000);
                        String formatted = String.format("%05d", num);            
                   %>
    <input type="text" name="cap"  class="field left" readonly value = <% out.println(formatted); %>/>
	<br/>
	<label for="entercaptcha"> <b>Enter the captcha : </b> </label>
	<input type ="text" name="captcha" placeholder="Enter the captcha" required><br /><br />
	<br/>
	<button type="submit">SignUp</button>
    
  </div>

  
</form>

</body>
</html>
