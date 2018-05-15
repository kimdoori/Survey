<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>

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
		response.setContentType("text/html;charset='UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String input_id = request.getParameter("id");
		String input_pw = request.getParameter("pw");
		String user_pw = "";
		String user_name = "";
		StringBuffer user_info = new StringBuffer();

		BufferedReader reader = null;
		boolean isExist = false;
		try {
			String filepath = application.getRealPath("/WEB-INF/member/");
			File directory = new File(filepath);
			 if(!directory.exists()){
		            //디렉토리 생성 메서드
		            directory.mkdirs();
		      }
			File dirFile = new File(filepath);
			File[] fileList = dirFile.listFiles();
			int reviewCnt = 0;
			for (File tempFile : fileList) {
				if (tempFile.isFile()) {
					String tempFileName = tempFile.getName();
					if (tempFileName.equals(input_id + ".txt")) {
						isExist = true;
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

						user_pw = reader.readLine();
						user_name = reader.readLine();

						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							user_info.append(str);

						}
						break;
					}
				}

			}

		} catch (Exception e) {
			out.println("파일을 읽을 수 없습니다.");
		}

		if (!isExist) {//존재하지 않음
			System.out.println("s");
			out.println("<script>alert('회원이 아닙니다.');location.href='signin.jsp';</script>");
	%>
	<%-- <jsp:forward page="framePage.jsp">
		<jsp:param name="CONTENTPAGE" value="<%=contentpage %>" />
	</jsp:forward> --%>
	<%
		return;
		}
		if (input_pw.equals(user_pw)) {

			session.setAttribute("id", input_id);
			session.setAttribute("name", user_name);
			out.println("<script>location.href='mySurvey.jsp';</script>");

	%>
	<%-- <jsp:forward page="framePage.jsp">
		<jsp:param name="CONTENTPAGE" value="<%=contentpage %>" />
	</jsp:forward>  --%>
	
		
<%
		} else {

			out.println("<script>alert('비밀번호를 확인하세요.');location.href='signin.jsp';</script>");
	%>
	<%-- <jsp:forward page="framePage.jsp">
		<jsp:param name="CONTENTPAGE" value="<%=contentpage %>" />
	</jsp:forward> --%>
	<%
		}
	%>



</body>
</html>
