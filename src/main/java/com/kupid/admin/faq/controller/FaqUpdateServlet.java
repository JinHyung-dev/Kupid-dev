package com.kupid.admin.faq.controller;

import com.kupid.admin.faq.model.dto.Faq;
import com.kupid.admin.faq.service.FaqService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FaqUpdateServlet
 */
@WebServlet("/admin/faqupdate.do")
public class FaqUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int no=1;
		try {
			no=Integer.parseInt(request.getParameter("no"));
		}catch(NumberFormatException e) {
			
		}
		Faq f=new FaqService().selectFaqByNo(no);
		request.setAttribute("faq", f);
		request.getRequestDispatcher("/WEB-INF/views/admin/faq/faqupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
