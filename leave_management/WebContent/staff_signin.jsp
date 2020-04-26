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

<center> <h2>Staff Login</h2> </center>

<form action="staff_login.jsp" method="post">
  <div class="imgcontainer">
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
  </div>

  <div class="container" align="center">

    <label for="uname"><b>Username:</b></label> 
    <input type="text" placeholder="Enter Username" name="username" required>
	<br/>
    <label for="psw"><b>Password:</b></label>
    <input type="password" placeholder="Enter Password" name="pass" required>
    <br/>    
	<label> new user? </label> <a href="staff_signup.jsp">Sign up</a>
	<br/>
	<button type="submit">Login</button>
    </div>
	
  
</form>

</body>
</html>
