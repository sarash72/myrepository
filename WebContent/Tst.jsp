<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*"%>
<%@page import="java.awt.image.*"%>
<%@page import="javax.imageio.*"%>

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
	<%
		int flag = 0;
	%>

	<form action="Tst.jsp">
		<input type="text" id="massage" name="massage"
			style="border-style: none; height: 100px; width: 700px; margin-left: 250px; background-color: #3CF;">
		<button type="submit" onclick="" value="sticker_1" name="button1"
			style="background-color: #FFF; border-style: none;">
			<img
				src="http://telegram-channels.ir/wp-content/uploads/2016/08/cafee_khande.jpg"
				style="width: 35px; height: 30px;">
		</button>
		<button type="submit" onclick=""
			style="background-color: #009; height: 100px; width: 80px; float: right">Send</button>

		<%
			String input_value = request.getParameter("massage");
			//writer_function("stick_1");
			String buttons_value = request.getParameter("button1");
			if ("sticker_1".equals(buttons_value)) {
				writer_function("sticker_1");

			}
			writer_function(input_value);
		%>
	</form>
	</div>

	<%!public void writer_function(String input_massage) {
		String str = input_massage;
		//always give the path from root. This way it almost always works.
		String nameOfTextFile = "C:/Users/MEHR/Desktop/chat.txt";
		try {
			PrintWriter pw = new PrintWriter(new FileOutputStream(nameOfTextFile, true));
			if (str != null)

				pw.println(str);
			//clean up
			pw.close();
		} catch (IOException e) {
		}
	}%>

	<div class="border">
		<a href="#" style="float: right;"></a>
		<p>

			<%
				BufferedReader reader = new BufferedReader(new FileReader("C:/Users/MEHR/Desktop/chat.txt"));
				//BufferedReader br = new InputStreamReader(new FileInputStream(txtFilePath));
				StringBuilder sb = new StringBuilder();
				String line;

				while ((line = reader.readLine()) != null) {
			%>
			<br>
			<%
				if (line.equals("sticker_1")) {
			%>
			<img alt=""
				src="http://telegram-channels.ir/wp-content/uploads/2016/08/cafee_khande.jpg"
				style="width: 35px; height: 30px; border-style: none;">
			<%
				} else {
						out.println(line + "\n");
					}
				}

				reader.close();
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