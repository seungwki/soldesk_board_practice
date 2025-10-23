package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/BoardReplyCon.do")
public class BoardReplyCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		BoardDTO board = new BoardDTO();
		BoardDAO dao = new BoardDAO();

		int reLevel, reStep, ref;
		ref = Integer.parseInt(request.getParameter("ref"));
		reLevel = Integer.parseInt(request.getParameter("re_level"));
		reStep = Integer.parseInt(request.getParameter("re_step"));

		request.setAttribute("ref", ref);
		request.setAttribute("re_level", reLevel);
		request.setAttribute("re_step", reStep);
		RequestDispatcher dis = request.getRequestDispatcher("BoardReplyForm.jsp");//작업 처리 후 HTML이나 JSP등을 보내줌
		dis.forward(request, response);
		//		response.sendRedirect("BoardListCon.do");
	}
}