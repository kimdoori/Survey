<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #fefefe;
    margin: auto;
    padding: 0;
    border: 1px solid #888;
    width: 80%;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

/* Add Animation */
@-webkit-keyframes animatetop {
    from {top:-300px; opacity:0} 
    to {top:0; opacity:1}
}

@keyframes animatetop {
    from {top:-300px; opacity:0}
    to {top:0; opacity:1}
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}
</style>
</head>

<body>

	<%
	response.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	request.setCharacterEncoding("UTF-8");

		String contentpage = request.getParameter("CONTENTPAGE");

		String inputID = request.getParameter("id");
		String inputPw = request.getParameter("pw");
		String inputName = request.getParameter("name");
		String inputPhone = request.getParameter("phone");

		
		StringBuffer userInfo = new StringBuffer();

		BufferedReader reader = null;
		boolean isExist = false;
		try {
			String filepath = application.getRealPath("/WEB-INF/member/");
			File directory = new File(filepath);
			 if(!directory.exists()){
		            //디렉토리 생성 메서드
		            directory.mkdirs();
		      }
			System.out.println(filepath);

			File dirFile = new File(filepath);
			File[] fileList = dirFile.listFiles();
			int reviewCnt = 0;
			for (File tempFile : fileList) {
				if (tempFile.isFile()) {
					String tempFileName = tempFile.getName();
					if (tempFileName.equals(inputID + ".txt")) {
						isExist = true;
						reader = new BufferedReader(new FileReader(filepath + tempFileName));

						while (true) {
							String str = reader.readLine();
							if (str == null)
								break;
							userInfo.append(str);

						}
						break;
					}
				}

			}

		} catch (Exception e) {
			out.println("파일을 읽을 수 없습니다.");
		}

		if (!isExist) {//존재하지 않음

			String filePath = application.getRealPath("/WEB-INF/member/"+inputID+".txt");

			FileOutputStream output = new FileOutputStream(filePath,true);
			PrintWriter writer = null;
	
			String result;
			try{
				/* String filePath = application.getRealPath("/WEB-INF/review/"+filename); */
				//out.println(filePath);
				writer = new PrintWriter(filePath);
				/* String  title = reader.readLine();
				String  w_time= reader.readLine();
				String  writer= reader.readLine(); */
				writer.printf("%s%n",inputPw);
				writer.printf("%s%n",inputName);
				writer.printf("%s%n",inputPhone);
				
				
				writer.flush();
				writer.close();

				/* 
				//out.println(filePath);
				fileOut.write(inputPw);
				fileOut.newLine();
				fileOut.write(inputName);
				fileOut.newLine();
				fileOut.write(inputPhone);

				fileOut.flush();
				fileOut.close(); */
				result="ok";
			}catch(Exception e){
				out.println("오류발생");
				result="fail";
			}
			
			response.sendRedirect("signupResult.jsp?send="+result);
			
		

		}else{//이미 존재하는 회원
			out.println("<script>alert('이미 존재하는 회원입니다.'); history.back();</script>");
		}
		%>
		



</body>
</html>
