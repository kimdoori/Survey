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
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String folderName = request.getParameter("folderName");
			BufferedReader reader = null;

			try {
				String filepath = application.getRealPath("/WEB-INF/survey/"+folderName+"/answer/");

				File dirFile = new File(filepath);
				File[] fileList = dirFile.listFiles();
				int cnt=0;
				for (File tempFile : fileList) {
					if (tempFile.isFile()) {
						cnt++;
						
						String tempFileName = tempFile.getName();
						System.out.println("사용자 응답 : "+ tempFileName);
						
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

						
						StringBuffer contents = new StringBuffer();
						
						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							contents.append(str);

						}
					//결고 ㅏ통계냐ㅐ기
					  
					}
					

				}

			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}
		%>
</body>
</html>
