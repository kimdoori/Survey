<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String result = request.getParameter("send");
if(result.equals("ok")){
	 out.println("<script>alert('회원가입에 성공했습니다.');location.href='signin.jsp';</script>");

}else{
	 out.println("<script>alert('회원가입에 실패했습니다.');location.href='signin.jsp';</script>");

}
%>

<!-- <meta http-equiv='refresh' content='1;url=index.jsp'> -->

</body>
</html>
