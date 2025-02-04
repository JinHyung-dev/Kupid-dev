package com.kupid.admin;

import com.kupid.admin.member.service.MemberService;
import java.io.IOException;
import java.io.Serial;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ManagerhomeServlet
 */
@WebServlet(urlPatterns="/admin/home.do")
public class AdminhomeServlet extends HttpServlet {
	@Serial
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminhomeServlet() {
        super();
		System.out.println("ManagerhomeServlet initialized");
		// TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Servlet doGet() called");

		request.setAttribute("pagenum", 1);
		
		Map m=new MemberService().managerHomeCountAll();
		
		request.setAttribute("count", m);

		request.getRequestDispatcher("/WEB-INF/views/admin/adminhome.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
