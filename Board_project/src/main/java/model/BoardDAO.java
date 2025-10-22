package model;

import java.awt.dnd.DropTargetContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void getCon() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource) envContext.lookup("jdbc/xe");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시글 저장
	public void insertBoard(BoardDTO board) {
		getCon();
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		try {
			String reSql = "select max(ref) from board";
			String sql = "Insert into board values(board_seq.nextval, ?, ?, ?, ?, sysdate,?,?,?,0 ,?)";
			pstmt = con.prepareStatement(reSql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1) + 1;
			}

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, board.getContent());
			pstmt.executeUpdate();

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//전체 게시글 수
	public int getAllCount() {
		getCon();
		int count = 0;
		try {
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			//			count = Integer.parseInt(rs.getInt(1));
			count = rs.getInt(1);
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	//게시글 목록 불러오기
	public ArrayList<BoardDTO> getAllBoard(int startRow, int endRow) {
		ArrayList<BoardDTO> result = new ArrayList<>();
		getCon();
		try {
			String sql = "select * from (select A.*, Rownum Rnum from (select * from board order by ref desc, re_step asc) A) where Rnum>=? and Rnum<=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setReg_date(rs.getString(6).toString());
				board.setRef(rs.getInt(7));
				board.setRe_step(rs.getInt(8));
				board.setRe_level(rs.getInt(9));
				board.setReadcount(rs.getInt(10));
				board.setContent(rs.getString(11));
				result.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 조회수 증가
	public void increaseReadCount(int num) {
		getCon();
		try {
			//조회수 증가
			String sqlReadCount = "update board SET readcount = readcount+1 where num = ?";
			pstmt = con.prepareStatement(sqlReadCount);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시글 가져오기
	public BoardDTO getBoard(int num) {
		getCon();
		BoardDTO board = null;
		try {
			//조회수 증가
			//			String sqlReadCount = "update board SET readcount = readcount+1 where num = ?";
			//			pstmt = con.prepareStatement(sqlReadCount);
			//			pstmt.setInt(1, num);
			//			pstmt.executeUpdate();

			//게시글 가져옴
			String sql = "select * from board where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setReg_date(rs.getString(6).toString());
				board.setRef(rs.getInt(7));
				board.setRe_step(rs.getInt(8));
				board.setRe_level(rs.getInt(9));
				board.setReadcount(rs.getInt(10));
				board.setContent(rs.getString(11));
			} else {
				con.close();
				throw new Exception();
			}
			con.close();
			System.out.println(board.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	public void updateBoard(BoardDTO board) {
		getCon();
		try {
			//게시글 가져옴
			System.out.println("update Board >>> "+board.toString());
			String sql = "update board set subject = ?, content = ? where num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			pstmt.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}