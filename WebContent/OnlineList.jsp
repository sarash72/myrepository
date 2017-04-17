<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	ArrayList<String> list = (ArrayList<String>) request.getAttribute("list");


	//request.getRequestDispatcher("Test2.jsp").include(request, response);
//request.getRequestDispatcher("Test.jsp").include(request, response);


	String name = null;
	ArrayList<HttpSession> se=new ArrayList<HttpSession>();
	 se = (ArrayList<HttpSession>) request.getAttribute("session");
	String b=se.size()+"";
	for(int i=0; i<se.size();i++){
	if(se.get(i).getAttribute("username").equals("2"))	{
		response.getWriter().append("numbers of sessions:  " +b);
		request.getRequestDispatcher("Test.jsp").include(request, response);

	}

	}
%> 
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>"Online users"</title>

</head>
<body bgcolor=#f0f0f0>



	<p id="demos"></p>
	<p id="demoss"></p>


	<form>
		<h1>Online users</h1>

		<select name="ChatPartner" id="ChatPartner" multiple>
			<%
				for (int i = 0; i < list.size(); i++) {
					name = list.get(i);
			%>
			<option value="<%=name%>" id="option"><%=name%></option>

			<%
				}
			%>
		</select> <input type="button" value="Start Chat" onclick="choosePartner()" />

		
		<script type="text/javascript">
			window.loaded = choosePartner;
			
			var chatList = [];

			function choosePartner() {

				var x = document.getElementById("ChatPartner");
				
				for (var i = 0; i < x.options.length; i++) {
					if (x.options[i].selected == true) {
						
						var y = x.options[i].value;
						
						
						$
								.get(
										"http://localhost:8080/ChatServlet/Test?nam="
												+ y,
										function(data) {
											//	alert(data);
											if ($.inArray(data, chatList) < 0) {
												chatList.push(data);

												var l = chatList.toString();
												document
														.getElementById("demos").innerHTML = l;
											} else {
												var v = " You've added this user to your chat list before!";
												document
														.getElementById("demos").innerHTML = v;
											}

										});
						
						
					}
				}
				  

				
				
				
			}
		</script>
			
		
</body>
</html>