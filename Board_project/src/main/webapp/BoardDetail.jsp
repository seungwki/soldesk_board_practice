<%@page import="model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Board Info</title>

<link rel="stylesheet"
	href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
}

#container {
	width: 70%;
	margin: 40px auto;
	background-color: #ffffff;
	padding: 20px;
	border: 1px solid #cccccc;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table {
	width: 100%;
	margin-top: 20px;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 12px;
	vertical-align: middle;
	border: 1px solid #cccccc;
}

.table th {
	background-color: #e9f5ff;
	color: #333;
	text-align: right;
	width: 100px;
}

input[type="text"], input[type="email"], input[type="password"],
	textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
}

input[type="submit"], input[type="reset"], button {
	padding: 10px 20px;
	margin-right: 10px;
	border: none;
	border-radius: 4px;
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

input[type="submit"]:hover, input[type="reset"]:hover {
	background-color: #0056b3;
}

button {
	background-color: #28a745;
}

button:hover {
	background-color: #217530;
}

h2 {
	text-align: center;
	color: #333;
}
</style>


</head>
<body>
	<center>
		<h2>게시글 보기</h2>
		<table class="table table-striped table-bordered table-hover"
			width="600">
			<tr height="40">
				<th width="120" align="center">글번호</th>
				<td width="180" align="left">${board.num}</td>
				<th width="120" align="center">조회수</th>
				<td width="180" align="left">${board.readcount}</td>
			</tr>
			<tr height="40">
				<th width="120" align="center">작성자</th>
				<td width="180" align="left">${board.writer}</td>
				<th width="120" align="center">작성일</th>
				<td width="180" align="left">${board.reg_date}</td>
			</tr>
			<tr height="40">
				<th width="120" align="center">제목</th>
				<td width="180" align="left" colspan="3">${board.subject}</td>
			</tr>
			<tr height="40">
				<th width="120" align="center">글내용</th>
				<td width="180" align="left" colspan="3">${board.content}</td>
			</tr>
			<tr height="40">
				<th align="center" colspan="4">
					<input type="button" value="답글달기" onclick="location.href='BoardRewriteCon.do?num=${board.num}&ref=${board.ref}&re_step=${board.re_step}&re_level=${board.re_level}'" />&nbsp;
					<input type="button" value="글수정"onclick="location.href='BoardUpdateCon.do?num=${board.num}'" />&nbsp;
					<input type="button" value="글삭제" onclick="location.href='BoardDeleteCon.do?num=${board.num}'" />&nbsp;
					<input type="button" value="목록보기" onclick="location.href='BoardListCon.do?num'" />&nbsp;
					</th>
			</tr>
		</table>
	</center>
</body>
</html>