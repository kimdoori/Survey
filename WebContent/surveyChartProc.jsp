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
<table style="margin:auto;width:50%;">
<tr>
<td style="text-align:center;">
<h3>개별 답변</h3>

</td>
</tr>
<tr>
<td style="text-align:center;">
<button type="button" onclick="showAnswer(currentAnswer - 1)">Previous</button>
<div id="cardNum" style="color:black;display:inline-block;">1</div>
<button type="button" onclick="showAnswer(currentAnswer + 1)">Next</button>
</td>
</tr>
<tr>
<td>
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
				String[] questionArray = questions.toString().trim().split("\n");
				String[][] totalAnswerArray=new String[questionArray.length][];//질문번호/답변번호 안에 답변 들어있음.
			 	int[][] totalAnswerNum = new int[questionArray.length][];//질문번호/답변번호 안에 답변 총 수 들어있음.

				//TODO : 전체 정보를 저장해서 차트로 출력하
				 
				//answer 배열 생성
				reader = new BufferedReader(new FileReader(questionfilepath));
				StringBuffer answers = new StringBuffer();
				while(true){
					String temp = reader.readLine();
					if(temp.substring(0,1).equals("Q"))
						break;
				}
				
				int qnum=-1;
				while (true) {
					String str = reader.readLine();
					if (str == null){
						qnum++;
						totalAnswerArray[qnum] = answers.toString().trim().split("\n");
						totalAnswerNum[qnum] = new int[totalAnswerArray[qnum].length];
						break;
					}
					if(str.substring(0,1).equals("Q")){
						qnum++;
						totalAnswerArray[qnum] = answers.toString().trim().split("\n");
						totalAnswerNum[qnum] = new int[totalAnswerArray[qnum].length];
						answers.setLength(0);
						
					}
					if(str.substring(0,1).equals("A")){
					answers.append(str.substring(str.indexOf(":")+1)+"\n");
					}
				}
				
				/* 
				System.out.println("totalArray[i]"+totalAnswerArray.length);
				 for(int i=0;i<totalAnswerArray.length;i++){
					for(int j =0; j <totalAnswerArray[i].length;j++){
						System.out.println("totalArray ["+i+"]["+j+"]: "+totalAnswerArray[i][j]);

					}
				}  
				 for(int i=0;i<totalAnswerNum.length;i++){
						for(int j =0; j <totalAnswerNum[i].length;j++){
							totalAnswerNum[i][j]=0;
							 System.out.println("totalAnswerNum ["+i+"]["+j+"]: "+totalAnswerNum[i][j]);
 
						}
					}  
					
				 */
				
				
				
				
				
				
				
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
						
						out.println("<center><div id='answer"+cnt+"' class='answerCard' style='display:"+((cnt==1)?"inline-block":"none")+";'>");
						int qcnt=0;
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							if(str.substring(0,1).equals("Q")){
								out.println("<p style='font-weight:bold;'>질문 "+(qcnt+1)+" :"+questionArray[qcnt++]+" </p>");
								continue;
							}
							out.println(str);
							for(int j=0;j<totalAnswerArray[qcnt-1].length;j++){
								if(totalAnswerArray[qcnt-1][j].equals(str)){
									totalAnswerNum[qcnt-1][j]++;
									break;
								}

							}
							
						}
					
					  out.println("</div></center>");
					}
					
					

				} 
				
				 for(int i=0;i<totalAnswerNum.length;i++){
					for(int j =0; j <totalAnswerNum[i].length;j++){
						 System.out.println(totalAnswerArray[i][j]+" : "+totalAnswerNum[i][j]);
						 
					}
				}  
				 out.println("</td></tr>");
				 out.println("<tr><td style='text-align:center;'><h3>");
				 out.println("통계</h3>");
				 
				 out.println("</td></tr>");
				//결과 통계내기
				for(int i=0;i<totalAnswerNum.length;i++){
					 out.println("<tr><td>");

					out.println("<center><p style='font-weight:bold;'>질문 "+(i+1)+" : "+questionArray[i]+"</p></center>");
					out.println("<table width='100%'>");
					for(int j =0; j <totalAnswerNum[i].length;j++){
						 System.out.println(totalAnswerArray[i][j]+" : "+totalAnswerNum[i][j]);
						 
						 out.println("<tr><td style='width:20%;'><span style='font-weight:bold;'>"+totalAnswerArray[i][j]+"</span></td>");
						 out.println("<td><div style='background-color:#5cc461;display:inline-block;width:"+100/cnt*totalAnswerNum[i][j]+"%;'>"+(float)100/cnt*totalAnswerNum[i][j]+"%</div></td></tr>");

					}
					out.println("</table>");

					 out.println("</td></tr>");

				} 
				

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
</table>		
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
   document.getElementById("cardNum").innerHTML = currentAnswer;

} 
</script>
</body>
</html>
