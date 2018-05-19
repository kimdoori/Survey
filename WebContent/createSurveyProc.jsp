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
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String image = request.getParameter("image");
	if(image == null || image.replaceAll(" ","").equals(""))
		image= "http://i62.tinypic.com/34oq4o0.jpg";

	String[] question =request.getParameterValues("question");
	String multi; 
	String[] answer;
	
	
	
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
	SimpleDateFormat simpleTime = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

	String w_date = simpleDate.format(date);
	String w_time = simpleTime.format(date);
	
	
	
	String user = (String)session.getAttribute("id");

	String filename = w_date +user;
	
	
	PrintWriter writer = null;
	String result;
	try{
		String filePath = application.getRealPath("/WEB-INF/survey/"+filename+"/");
		System.out.println(filePath);
		
		File surveyDirectory = new File(filePath);
		 if(!surveyDirectory.exists()){
	            //디렉토리 생성 메서드
	            surveyDirectory.mkdirs();
	      }
		filePath+="question.txt";
		writer = new PrintWriter(filePath);
		
		writer.printf("%s %n",title);
		writer.printf("%s %n",w_time);
		writer.printf("%s %n",user);
		writer.printf("%s%n",image);
		writer.printf("%s %n",content);
		for(int i=0;i<question.length;i++){
			writer.printf("Q%d:%s%n",i+1,question[i]);
			/* out.println("질문"+i+":"+question[i]); */
			multi =request.getParameter("multi"+(i+1));
			
			writer.printf("%s%n",multi==null?"false":"true");
			answer =request.getParameterValues("answer"+(i+1));
			for(int j=0;j<answer.length;j++){
				/* out.println("답변"+j+":"+answer[j]); */
				writer.printf("A%d:%s%n",j+1,answer[j]);

			}
		}
		writer.flush();
		result="ok";
	}catch(Exception e){
		e.printStackTrace();
		out.println("오류발생");
		result="fail";
	}
	response.sendRedirect("mySurvey.jsp?send="+result);

%>

</body>
</html>
