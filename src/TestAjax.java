import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Test
 */
@WebServlet("/Test")
public class TestAjax extends HttpServlet {
  private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

  /**
   * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
   */
	private ArrayList<String> chatLis = new ArrayList<String>();
	

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
//	  ArrayList<HttpSession> ses=new ArrayList<HttpSession>();
//	 ses = (ArrayList<HttpSession>) request.getAttribute("session");
//	String b=ses.size()+"";
	  
    String nam= request.getParameter("nam");
    response.getWriter().append(nam);
  
    chatLis.add(nam);
    String k =chatLis.toString();
	System.out.println("Done");
	
	
	
	request.getRequestDispatcher("Test2.jsp").include(request, response);

  }

  /**
   * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
   */
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // TODO Auto-generated method stub
    doGet(request, response);
  }

}