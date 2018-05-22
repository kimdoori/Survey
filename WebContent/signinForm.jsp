<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/login.css">

<script src="js/login.js"></script>

</head>
<body>
<%
String contentpage = request.getParameter("CONTENTPAGE");

%>
<!-- 
	<div class="signin-page">
  <div class="form">
   
    
    <form class="login-form"  action="signinProc.jsp" method="post" class="login">
    <input hidden="true">
      <input type="text" name="id" placeholder="ID"/>
      <input type="password" name="pw" placeholder="password"/>
      <input type="submit" class="button" value="sign In">
      <div style="text-align:center"><p class="message">Not registered? <a href="signup.jsp">Create an account</a></p></div>
    </form>
   
    
   
  </div>
</div>
 -->
<div class="signin-page">
  <div class="form">
    <table>
    <tr>
    
    <td style="padding:45px;">
    <form class="login-form"  action="signinProc.jsp" method="post" class="login">
    <input hidden="true">
  <input type="text" name="id" placeholder="ID"/>
      <input type="password" name="pw" placeholder="password"/>
      <input type="submit" class="button" value="sign In">
      <div style="text-align:center"><p class="message">Not registered? <a href="signup.jsp">Create an account</a></p></div>
    </form>
    </td>
   
    </tr>
  
    </table>
  </div>
</div>
</body>
</html>
