<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/signup.css">
<style>
.tooltip {
    position: relative;
    display: inline-block;
    border-bottom: 1px dotted black;
    margin-left:12px;
}

.tooltip .tooltiptext {
    visibility: hidden;
    width: 150px;
    background-color: white;
    color: black;
    text-align: center;
    border-radius: 6px;
    padding: 5px 0;
    
    /* Position the tooltip */
    position: absolute;
    z-index: 1;
    top: -5px;
    left: 105%;
}

.tooltip:hover .tooltiptext {
    visibility: visible;
}
</style>
</head>
<body>
<div class="signup-page">
  <div class="form">
    <table width="100%">
    <tr>
    
    <td width="400px" style="padding:45px;">
    <form class="login-form"  action="signupProc.jsp" method="post" class="login">
    <input hidden="true">
      <input type="text" name="id" required pattern="[a-z]{4,}" placeholder="ID"/>
      <div class="tooltip"><img src="webImage/noticeIcon.png"><span class="tooltiptext">영어 소문자 4자 이상</span></div>
      <input type="password" name="pw" placeholder="password" required pattern="^(?=.*[a-z])(?=.*[~!@#$%^&*_-])(?=.*[0-9])[a-z~!@#$%^&*_-0-9]{4,}$"/>
       <div class="tooltip"><img src="webImage/noticeIcon.png"><span class="tooltiptext">영어 소문자, 특수문자, 숫자 포함 4자 이상</span></div>
       <input type="text" name="name" required placeholder="username"/>
       <input type="tel" name="phone" required placeholder="phone number"/>
       
     <input type="submit" class="button" value="sign In">
       <div style="text-align:center"><p class="message">Already registered? <a href="signin.jsp">Sign In</a></p></div>
    </form>
    </td>
   
    </tr>
  
    </table>
  </div>
</div>

</body>
</html>
