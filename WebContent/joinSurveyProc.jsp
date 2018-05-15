<%@page import="java.io.File"%>
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

	String folderName = request.getParameter("folderName");
	String[] question = request.getParameterValues("question");
	String[] answer;
	
	PrintWriter writer = null;
	String result;
	
	try{
		String filePath = application.getRealPath("/WEB-INF/survey/"+folderName+"/answer/");
		System.out.println(filePath);
		
		File surveyDirectory = new File(filePath);
		 if(!surveyDirectory.exists()){
	            //디렉토리 생성 메서드
	            surveyDirectory.mkdirs();
	      }
		
		Date date = new Date();
		SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");

		String w_date = simpleDate.format(date);
			

		String filename = w_date +String.format("%04d", (int)(Math.random()*1000)+1);
		filePath+=filename+".txt";
		
		writer = new PrintWriter(filePath);
		
		for(int i=0;i<question.length;i++){
			answer =request.getParameterValues("answer"+(i+1));
			writer.printf("%s %n","Q"+(i+1));
			for(int j=0;j<answer.length;j++){
				writer.printf("%s%n",answer[j]);
			}
		}
		
	
		writer.flush();
		result="ok";
		

	}catch(Exception e){
		e.printStackTrace();
		out.println("오류발생");
		result="fail";
	}
	response.sendRedirect("result.jsp?send="+result);

%>

</body>
</html>
