<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<title>Untitled Document</title>
<style>
div.border {
	border-style: none;
	height: 700px;
	width: 800px;
	padding-right: 20px;
	margin-left: 250px;
	background-color: #DDD;
}
</style>
</head>

<body>

	<div>
		<form action="Tst1.jsp">
			<input type="text" id="massage" name="massage"
				style="border-style: none; height: 100px; width: 700px; margin-left: 250px; background-color: #3CF;">
			<%
			String username=request.getParameter("user");

				String s = request.getParameter("massage");
				writer_function(username,s);
			%>

			<button type="submit" onclick=""
				style="background-color: #009; height: 100px; width: 80px; float: right">Send</button>
		</form>
	</div>

	<%!public void writer_function(String username,String input_massage) {
		String str = input_massage;
		//always give the path from root. This way it almost always works.
		String nameOfTextFile = "C:\\Users\\Karimi\\Desktop\\viratech\\workspaceNew\\ChatSara\\chat.txt";
		try {
			FileOutputStream kl =new FileOutputStream(nameOfTextFile,true);
			PrintWriter pw = new PrintWriter(kl);
			pw.println(username+" : "+str);
			//clean up
			pw.close();
			
		} catch (IOException e) {
		}
	}%>

	<div class="border">
		<a href="#" style="float: right;"></a>
		<p>

			<%
				BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\Karimi\\Desktop\\viratech\\workspaceNew\\ChatServletFinal\\chat.txt"));
				//BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
				StringBuilder sb = new StringBuilder();
				String line;

				while ((line = reader.readLine()) != null) {
					sb.append(line + "\n");
				}
				out.println(sb.toString());
			%>
		</p>

	</div>


	<script>
		function myFunction() {
			var x = document.getElementById("massage").value;
			document.getElementById("demo").innerHTML = x;
			document.getElementById("massage").value = "";
		}
	</script>


</body>
</html>