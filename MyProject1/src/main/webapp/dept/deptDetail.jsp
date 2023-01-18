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
<title>데이터 입력</title>
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
	<tr>
		<th> 번 호 </th>
		<td>${DeptDetail.deptno} </td>
	</tr>
	<tr>
		<th> 이 름 </th>
		<td>${DeptDetail.dname} </td>
	</tr>
	<tr>
		<th> 위 치 </th>
		<td>${DeptDetail.dloc} </td>
	</tr>
	<tr>
		<th colspan = "2">
			<button type="button" onclick="location='deptModify.do?deptno=${DeptDetail.deptno}'"> 수 정 </button>
			<button type="button" onclick="location='deptDelete.do?deptno=${DeptDetail.deptno}'"> 삭 제 </button>
		</th>
	</tr>
</table>


</body>
</html>