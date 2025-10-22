<%@page import="model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>

<link rel="stylesheet"
	href="./bootstrap-3.3.7-dist/css/bootstrap.min.css" />
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f7f7f7;
}

#container {
	width: 90%;
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
	border: 1px solid #cccccc;
	text-align: center;
}

.table th {
	background-color: #e9f5ff;
	color: #333;
}

.table tbody tr:hover {
	background-color: #f1f9ff;
}

#paging {
	text-align: center;
	margin-top: 20px;
}

#write {
	text-align: right;
	margin-top: 20px;
}

button {
	padding: 10px 20px;
	margin-left: 10px;
	border: none;
	border-radius: 4px;
	background-color: #007bff;
	color: #fff;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #0056b3;
}
</style>

</head>
<body>
	<c:if test="${msg==0}">
		<script type="text/javascript">
			alert("Password is incorrect")
		</script>
	</c:if>
	<div id="list">
		<b>게시판(전체글 : ${count }) </b>
	</div>
	<div id="write">
		<a href="BoardWriteForm.jsp" style="text-decoration: none">글쓰기</a>
	</div>
	<div>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr height="40">
					<th width="150">번호</th>
					<th width="500">제목</th>
					<th width="150">작성자</th>
					<th width="150">작성일</th>
					<th width="150">조회</th>
				</tr>
			</thead>
			<c:set var="number" value="${number-1}" />
			<%-- 			<c:set var="number" value="${number}" /> --%>
			<tbody>
				<c:forEach var="bean" items="${boardList}">
					<tr height="40">
						<td width="50" align="center">${bean.num}</td>
						<td width="300" align="left"><c:if test="${bean.re_step>1 }">
								<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5 }">&nbsp;</c:forEach>
							</c:if> <a href="BoardDetailControl.do?num=${bean.num }">
								${bean.subject } </a></td>
						<td width="100" align="center">${bean.writer }</td>
						<td width="150" align="center">${bean.reg_date }</td>
						<td width="150" align="center">${bean.readcount }</td>
					</tr>
					<c:set var="number" value="${number}" />
				</c:forEach>
			</tbody>
		</table>
		<p>
			<!-- 페이징처리 구현 -->
		<center>
			<c:if test="${count>0 }">
				<c:set var="pageCount"
					value="${count/pageSize + (count%pageSize==0? 0:1) }" />
				<c:set var="startPage" value="1" />
				<c:if test="${currentPage%10 != 0 }">
					<fmt:parseNumber var="result" value="${currentPage/10 }"
						integerOnly="true" />
					<c:set var="startPage" value="${result*10+1 }" />
				</c:if>
				<c:set var="pageBlock" value="10" />
				<c:set var="endPage" value="${startPage+pageBlock-1 }" />
				<c:if test="${endPage>pageCount }">
					<c:set var="endPage" value="${pageCount}" />
				</c:if>
				<!-- 				이전 페이지로 이동 -->
				<c:if test="${startPage>10 }">
					<a href="BoardListCon.do?pageNum=${startPage-10 }"
						style="text-decoration: none"> [이전] </a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="BoardListCon.do?pageNum=${i }"
						style="text-decoration: none"> [${i }] </a>
				</c:forEach>
				<!-- 				다음 페이지로 이동 -->
				<c:if test="${endPage<pageCount }">
					<a href="BoardListCon.do?pageNum=${startPage+10 }"
						style="text-decoration: none"> [다음] </a>
				</c:if>
			</c:if>
		</center>
		</p>


	</div>
</body>
</html>