<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/answer.css">
<script>
var currentAnswer = 1;
</script>

</head>
<body>

<button type="button" onclick="showAnswer(currentAnswer - 1)">Previous</button>
<button type="button" onclick="showAnswer(currentAnswer + 1)">Next</button>
<%
		request.setCharacterEncoding("UTF-8");
		String folderName = request.getParameter("folderName");
			BufferedReader reader = null;
			int cnt=0;

			try {
				//question file 에서 질문 뽑아내기
				String questionfilepath = application.getRealPath("/WEB-INF/survey/"+folderName+"/question.txt");
				System.out.println("questionfilepath : "+questionfilepath);
				reader = new BufferedReader(new FileReader(questionfilepath));
				StringBuffer questions = new StringBuffer();
				
				while (true) {
					String str = reader.readLine();
					if (str == null)
						break;
					if(str.substring(0,1).equals("Q")){
						questions.append(str.substring(str.indexOf(":")+1)+"\n");
					}

				}
				
				//question 배열 생성
				String[] questionArray = questions.toString().split("\n");
				/* String[][] totalAnswerArray=new String[questionArray.length][];

				//answer 배열 생성
				reader = new BufferedReader(new FileReader(questionfilepath));
				StringBuffer answers = new StringBuffer();
				int qnum=0;
				while (true) {
					String str = reader.readLine();
					if (str == null)
						break;
					if(str.substring(0,1).equals("Q")){
						totalAnswerArray[qnum] = answers.toString().split("\n");
						answers=null;
						qnum++;
						
					}
					answers.append(str.substring(str.indexOf(":")+1)+"\n");
				} */
				
				
				
				
				String[][] answerArray = new String[questionArray.length][1];
				
				 String filepath = application.getRealPath("/WEB-INF/survey/"+folderName+"/answer/");
				 File answerDirectory = new File(filepath);
				 if(!answerDirectory.exists()){
			            //디렉토리 생성 메서드
			            answerDirectory.mkdirs();
			      }
				 
				 System.out.println("filepath"+filepath);
				File dirFile = new File(filepath);
				File[] fileList = dirFile.listFiles();
				for (File tempFile : fileList) {
					if (tempFile.isFile()) {
						cnt++;
						
						String tempFileName = tempFile.getName();
						System.out.println("사용자 응답 : "+ tempFileName);
						
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

						
						StringBuffer contents = new StringBuffer();
						
						out.println("<div id='answer"+cnt+"' class='answerCard' style='display:"+((cnt==1)?"inline-block":"none")+";'>");
						int qcnt=0;
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							if(str.substring(0,1).equals("Q")){
								out.println("<p>질문 "+(qcnt+1)+" :"+questionArray[qcnt++]+" </p>");
								answerArray[qcnt-1][0]="";
								continue;
							}
							out.println(str);
							answerArray[qcnt-1][0]+=str+",";
							
						}
					//결고 ㅏ통계냐ㅐ기
					  out.println("</div>");
					}
					

				} 

			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}
		%>
		
<script>
		function showAnswer(num) {
   for(i = 1; i <= <%=cnt%>; i++) {
      document.getElementById("answer"+i).style.display="none";
   }
   //in the next 2 lines, you make sure which isn't lower than 1, and isn't greater than the number of images
   if(num < 1) num = 1;
   if(num > <%=cnt%>) num = <%=cnt%>;
   document.getElementById("answer"+num).style.display = "inline-block";
   currentAnswer=num;
} 
</script>
</body>
</html>
