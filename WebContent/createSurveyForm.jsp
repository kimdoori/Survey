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
String id = (String)session.getAttribute("id");
if(id == null || id.equals("")){%>
<jsp:forward page="framePage.jsp">
	<jsp:param name="CONTENTPAGE" value="signin.jsp"/>
</jsp:forward>
<%}


%>
<script>
var questionNum=1;

function addAnswer(num){
	var qusetionUL = document.getElementById("question"+num);
	var answerLI = document.createElement('li');
	answerLI.innerHTML="<input class='answer' type='text' name='answer"+num+"' required	placeholder='답변'> <button type='button' class='add' onclick='deleteAnswer('1')'>-</button>";
	
	qusetionUL.appendChild(answerLI);
}
function addQuestion(){
	questionNum++;
	var qusetionContainer = document.getElementById("question-container");
	var qusetionDiv = document.createElement('div');
	qusetionDiv.innerHTML = "<input type='checkbox' class='check' name='multi"+questionNum+"' value='checked'><label>답변 중복 가능</label><br><input class='question' type='text' name='question' required placeholder='질문' />"
	+"  <button type='button' class='add' onclick=\"addAnswer('"+questionNum+"')\">+</button>"
	+"<ul class='question_ul' id='question"+questionNum+"'><li><input class='answer' type='text' name='answer"+questionNum+"' required placeholder='답변' /></li></ul>";
	qusetionContainer.appendChild(qusetionDiv);
}

</script>

	<div class="create-page">
		<div class="form">
			<table width="100%">
			<tr>
			<td>
			<div style="text-align:center;"><h2>설문지 작성</h2></div>
			
			</td>
			</tr>
		
				<tr>

					<td width="400px" style="padding: 45px;">
						<form class="survey-form" action="createSurveyProc.jsp" method="post" class="survey">
							<input hidden="true"> <input type="text" name="title" class="title"
								required placeholder="설문 제목" />
							<textarea rows="5" cols="30" name="content" placeholder="간단한 설명"></textarea><br>
							<input type="text" name="image" class="title"
								placeholder="설문 대표 이미지 (없을 경우 기본 이미지가 표시됩니다.)" />
							<br><br>
							<br>
							<div id="question-container">
							<div>
							<input type="checkbox" class="check"  name='multi1' value='checked'><label>답변 중복 가능</label><br>
							 <input class="question" type="text" name="question" required placeholder="질문" /> <button type="button" class="add" onclick="addAnswer('1')">+</button> 
						
							<ul class="question_ul" id="question1">
								<li><input class="answer" type="text" name="answer1" required placeholder="답변" /></li>
							</ul>
							</div>
							</div>
							<button type="button" class="button" onclick="addQuestion()">질문추가</button>
							<br><br>
							<input type="submit" class="button" value="작성하기">
						</form>
					</td>

				</tr>

			</table>
		</div>
	</div>


</body>
</html>
