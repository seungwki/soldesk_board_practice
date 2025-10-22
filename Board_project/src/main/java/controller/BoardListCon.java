package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;
import model.BoardDTO;

@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		response.getWriter().append("Served at: ").append(request.getContextPath());
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//		doGet(request, response);
		rePro(request, response);
	}

	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int count = 0;
		BoardDAO dao = new BoardDAO();
		count = dao.getAllCount();
		request.setAttribute("count", count);
		//수정, 삭제 받아오는 메세지
		String msg = (String) request.getAttribute("msg");

		//게시글 목록 1 페이지에 나타나는 게시글 제목 수
		int pageSize = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}

		int number = 0;
		int currentPage = Integer.parseInt(pageNum);
		//게시판 페이지의 시작 게시글 번호 ~ 끝 게시글 번호
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		//pageSize*pageNumber+@일 때 1페이지 더 필요함
		number = count - (currentPage - 1) * pageSize;

		ArrayList<BoardDTO> boardList = dao.getAllBoard(startRow, endRow);
		request.setAttribute("boardList", boardList);
		request.setAttribute("msg", msg);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("number", number);

		RequestDispatcher dis = request.getRequestDispatcher("BoardList.jsp");//작업 처리 후 HTML이나 JSP등을 보내줌
		dis.forward(request, response);
	}
}
