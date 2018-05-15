<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기 - 입력 화면</title>
<link rel="stylesheet" href="css/survey.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String folderName = request.getParameter("folderName");
	%>

	<h2>설문지 작성</h2>

	<div class="join-page">
		<div class="form">
			<table width="100%">
				<tr>
					<td width="400px" style="padding: 45px;">
						<form class="survey-form" action="joinSurveyProc.jsp?folderName=<%=folderName%>"
							method="post" class="survey">

							<%
							
							
							 System.out.println(folderName);
								BufferedReader reader = null;

								try {
									String filepath = application.getRealPath("/WEB-INF/survey/"+folderName+"/question.txt");

							
										reader = new BufferedReader(new FileReader(filepath));

										String title = reader.readLine();
										out.println("<h2>"+title+"</h2>");
										String w_time = reader.readLine();
										String writer = reader.readLine();
										
										StringBuffer contents = new StringBuffer();
										String str;
										while (true) {
											str = reader.readLine();
											if (str == null || str.substring(0, 1).equals("Q"))
												break;
											contents.append(str);
										}
										out.println("<p>"+contents+"</p>");
						
										String question;
										/* out.println("<p>"+question+"</p>");
										 */
										 int cnt=0;
										while (true) {
											cnt++;
											question = str;
											question = question.substring(question.indexOf(":")+1);
											out.println("<p>질문 "+cnt+" : "+question+"</p>");
											out.print("<input type='text' hidden='true' name='question'>");

											str = reader.readLine();
											if (str == null)
												break;
											if(Boolean.valueOf(str)){//multi true이면
												while (true) {
													str = reader.readLine();
													if (str == null || str.substring(0, 1).equals("Q"))
														break;
													str = str.substring(str.indexOf(":")+1);
													out.println("<input type='checkbox' class='check' name='answer"+cnt+"' value='"+str+"'>"+str);
												}
												
											}else{
												while (true) {
													str = reader.readLine();
													if (str == null || str.substring(0, 1).equals("Q"))
														break;
													str = str.substring(str.indexOf(":")+1);
													out.println("<input type='radio' class='check' name='answer"+cnt+"' value='"+str+"' required>"+str);
												}
											}
											if (str == null)
												break;
										}
										
										
									
								} catch (Exception e) {
									out.println("파일을 읽을 수 없습니다.");
								}
							%>
							<!-- <input hidden="true"> <input type="text" name="title"
								class="title" required placeholder="설문 제목" />
							<textarea rows="5" cols="30" name="content" placeholder="간단한 설명"></textarea>
							<br>
							<br>
							<br> <br>
							<div id="question-container">
								<div>
									<input type="checkbox" class="check" name='multi1'
										value='checked'><label>답변 중복 가능</label><br> <input
										class="question" type="text" name="question" required
										placeholder="질문" />
									<button type="button" class="add" onclick="addAnswer('1')">+</button>

									<ul class="question_ul" id="question1">
										<li><input class="answer" type="text" name="answer1"
											required placeholder="답변" /></li>
									</ul>
								</div>
							</div>
							<button type="button" class="button" onclick="addQuestion()">질문추가</button>
							<br>
							<br>  --><input type="submit" class="button" value="제출하기">
						</form>
					</td>

				</tr>

			</table>
		</div>
	</div>


</body>
</html>
