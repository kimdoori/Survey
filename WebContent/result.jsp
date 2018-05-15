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
	out.println("<script>alert('제출되었습니다.');</script>");

}else{
	out.println("<script>alert('제출에 실패했습니다.');</script>");

}
%>
<meta http-equiv='refresh' content='0;url=index.jsp'>

</body>
</html>
