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
	<h2>설문지 작성</h2>

	<div class="review-page">
		<div class="form">
			<table width="100%">
				<tr>

					<td width="400px" style="padding: 45px;">
						<form class="login-form" action="reviewWriteProc.jsp"
							method="post" class="login">
							<input hidden="true"> <input type="text" name="title" class="title"
								required placeholder="설문 제목" />
							<textarea rows="5" cols="30" name="content" placeholder="간단한 설명"></textarea>
							<br><br><br>
							<br>
							<div id="question-container">
							<div>
							 <input class="question" type="text" name="question" required placeholder="질문" /> <button onclick="addAnswer(question1)">답변 추가</button> 
							<input type="checkbox"><label>답변 중복 가능</label>
							<ul class="question_ul" id="question1">
								<li><input class="answer" type="text" name="answer" required placeholder="답변" /></li>
							</ul>
							</div>
							</div>
							<button class="button" onclick="addQuestion()">질문추가</button>
							<br><br>
							<input type="submit" class="button" value="작성하기">
						</form>
					</td>

				</tr>

			</table>
		</div>
	</div>

<script>
function addAnswer(qusetionNum){
	var qusetionUL = document.getElementById("question1");
	var answerLI = document.createElement('li');
	answerLI.innerHTML="<input class='answer' type='text' name='answer' required	placeholder='답변'>";
	qusetionUL.appendChild(answerLI);
}
function addQuestion(qusetionNum){
	var qusetionContainer = document.getElementById("question-container");
	var qusetionDiv = document.createElement('div');
	qusetionDiv.innerHTML = "<input class='question' type='text' name='question' required placeholder='질문' />"
	+"<button onclick='addAnswer(question1)'>답변\n추가</button><input type='checkbox'><label>답변 중복 가능</label>"
	+"<ul class='question_ul' id='question1'><li><input class='answer' type='text' name='answer' required placeholder='답변' /></li></ul>";
	qusetionContainer.appendChild(qusetionDiv);
}

</script>
</body>
</html>
