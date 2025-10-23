<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Update</title>

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

h2, b {
	color: #333;
}
</style>

</head>
<body>
<c:if test="${msg==0}" >
<script>
alert("password is correct(update fail)");
</script>
</c:if>
<c:if test="${msg==1}" >
<script>
alert("password is correct(delete fail)");
</script>
</c:if>
	<div id="container">
		<b>게시글 수정하기</b>
		<p />
		<form action="BoardUpdateProcCon.do" method="post">
			<center>
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr height="50">
							<th width="150" align="center">작성자</th>
							<td width="400" align="left">${board.writer}</td>
						</tr>
						<tr height="50">
							<th width="150" align="center">작성일</th>
							<td width="400" align="left">${board.reg_date}</td>
						</tr>
						<tr height="50">
							<th width="150" align="center">제목</th>
							<td width="400" align="left"><input type="text"
								name="subject" value="${board.subject}" size="60"
								style="background: transparent;" /></td>
						</tr>
						<tr height="50">
							<th width="150" align="center">패스워드</th>
							<td width="400" align="left"><input type="password"
								name="pass" size="60" style="background: transparent;" /></td>
						</tr>
						<tr height="50">
							<th width="150" align="center">글내용</th>
							<td width="400" align="left"><textarea name="content"
									rows="10" cols="50">${board.content}</textarea></td>
						</tr>
						<tr height="50">
							<th align="center" colspan="2"><input type="hidden"
								name="num" value="${board.num}" /> <input type="hidden"
								name="password" value="${bean.password}" /> <input
								type="submit" value="수정하기" />&nbsp;&nbsp; <input type="reset"
								value="취소" />&nbsp;&nbsp;
								<button type="button" onclick="location.href='BoardListCon.do'">전체글보기</button>
							</th>
						</tr>
					</tbody>
				</table>
			</center>
		</form>
	</div>
</body>
</html>
