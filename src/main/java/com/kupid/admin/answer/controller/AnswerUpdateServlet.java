package com.kupid.admin.answer.controller;

import com.kupid.admin.answer.model.dto.Answer;
import com.kupid.admin.answer.service.AnswerService;
import com.kupid.admin.inquiry.model.dto.Inquiry;
import com.kupid.admin.inquiry.service.InquiryService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AnswerUpdateServlet
 */
@WebServlet("/admin/answerupdate.do")
public class AnswerUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int inqNo=Integer.parseInt(request.getParameter("no"));
		Inquiry inq=new InquiryService().selectInquiryByNo(inqNo);
		request.setAttribute("inquiry", inq);
		Answer ans=new AnswerService().selectAnswerByNo(inqNo);	
		request.setAttribute("answer", ans);
		request.getRequestDispatcher("/WEB-INF/views/admin/inquiry/answerupdate.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
