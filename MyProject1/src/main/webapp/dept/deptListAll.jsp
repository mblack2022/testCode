<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전체 목록 출력</title>
</head>

<style>
table {
	width			:400px;
	border-collapse	:collapse; /* 셀 간격 없앰 */
}
th, td {	
	border	: 1px solid #cccccc;
	padding : 5px;
}

</style>

<body>

<table>
	<caption> 목 록 </caption>
	<tr>
		<th> 번 호 </th>
		<th> 이 름 </th>
		<th> 위 치 </th>
	</tr>

    <c:forEach var="result" items="${resultList}" varStatus="status">
       <tr>
          <td><a href="deptDetail.do?deptno=${result.deptno}"><c:out value="${result.deptno}"/>&nbsp; </a></td>
          <td><a href="deptDetail.do?deptno=${result.deptno}"><c:out value="${result.dname}"/>&nbsp;  </a></td>
          <td><a href="deptDetail.do?deptno=${result.deptno}"><c:out value="${result.dloc}"/>&nbsp;   </a></td>
		</tr>
	</c:forEach>	

	<tr>
		<th colspan = "3">
			<button type="button" onclick="location='deptWrite.do'"> 입 력 </button>
	</th>
	</tr>
</table>


</body>
</html>