<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 결과화면</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String title =request.getParameter("title");

	String contents =request.getParameter("content");
	
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd hh-mm");
	SimpleDateFormat simpleTime = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

	String w_date = simpleDate.format(date);
	String w_time = simpleTime.format(date);
	
	
	
	String user = (String)session.getAttribute("id");

	String filename = w_date +user +".txt";
	
	
	PrintWriter writer = null;
	String result;
	try{
		String filePath = application.getRealPath("/WEB-INF/review/"+filename);
		//out.println(filePath);
		writer = new PrintWriter(filePath);
		/* String  title = reader.readLine();
		String  w_time= reader.readLine();
		String  writer= reader.readLine(); */
		writer.printf("%s %n",title);
		writer.printf("%s %n",w_time);
		writer.printf("%s %n",user);
		writer.println(contents);
		
		writer.flush();
		result="ok";
	}catch(Exception e){
		out.println("오류발생");
		result="fail";
	}
	response.sendRedirect("review.jsp?send="+result);

%>

</body>
</html>
