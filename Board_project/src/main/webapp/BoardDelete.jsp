<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Delete</title>

<link rel="stylesheet"
	href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

#container {
	max-width: 800px;
	margin: 50px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 30px;
}

.table {
	width: 100%;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 14px;
	border: 1px solid #ccc;
}

.table th {
	background-color: #f0f8ff;
	text-align: right;
	width: 120px;
	color: #333;
}

input[type="text"], input[type="email"], input[type="password"],
	textarea {
	width: 100%;
	padding: 12px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 6px;
	box-sizing: border-box;
}

textarea {
	resize: vertical;
	min-height: 120px;
}

input[type="submit"], input[type="reset"], button {
	padding: 12px 24px;
	font-size: 15px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	margin: 0 6px;
	transition: background-color 0.3s;
}

input[type="submit"] {
	background-color: #007bff;
	color: #fff;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

input[type="reset"] {
	background-color: #6c757d;
	color: #fff;
}

input[type="reset"]:hover {
	background-color: #5a6268;
}

button {
	background-color: #28a745;
	color: #fff;
}

button:hover {
	background-color: #218838;
}

.btns {
	text-align: center;
	margin-top: 20px;
}
</style>

</head>
<body>
	<div id="container">
		<h2>게시글 삭제하기</h2>
		<form action="BoardDeleteProcCon.do" method="post">
			<table class="table table-striped table-bordered table-hover">
				<tr>
					<th>패스워드</th>
					<td colspan="3"><input type="password" name="password"
						size="60" style="border: none; background: transparent"></td>
				</tr>
				<tr>
					<td colspan="4" class="text-center"><input type="hidden"
						name="num" value="${board.num }"> <input type="hidden"
						name="pass" value="${board.password }"> <input
						type="submit" value="글삭제" />
						<button type="reset">취소</button>
						<button type="button" onclick="location.href='BoardListCon.do'">전체글보기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
