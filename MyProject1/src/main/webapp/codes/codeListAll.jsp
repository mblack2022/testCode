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
<title>코 드 목 록</title>
</head>

<style>
table {
	width			:500px;
	border-collapse	:collapse; /* 셀 간격 없앰 */
}
th, td {	
	border	: 1px solid #cccccc;
	padding : 5px;
}

</style>

<script>
	function fn_delete(codeno) {
		if (confirm(" 정말 삭제하시겠습니까? ")){
			location = "codeDelete.do?codeno="+codeno; 
		}
	}

	function fn_update(codeno) {
		location = "codeModify.do?codeno="+codeno; 
	}
</script>

<body>

<table>
	<caption> 
		<div> 코 드 목 록</div> <br>
		<div style="width:100%; text-align:left;"> Total : ${resultCnt} 개</div>	
	</caption>
	
	<colgroup>
		<col width="10%"/>
		<col width="15%"/>
		<col width="15%"/>
		<col width="35%"/>
		<col width="25%"/>
	</colgroup>
	
	<tr>
		<th></th>
		<th> 분 류 </th>
		<th> 코 드 </th>
		<th> 코 드 명 </th>
		<th></th>
	</tr>
	

	<c:set var="count" value="1" />
    <c:forEach var="result" items="${resultList}" varStatus="status">
       <tr>
       	  <td align="center"><c:out value="${count }" /> &nbsp; </td>
          <td align="center"><c:out value="${result.gname}"/>&nbsp; </td>
          <td align="center"><c:out value="${result.codeno}"/>&nbsp; </td>
          <td><c:out value="${result.codenm}"/>&nbsp; </td>
          <td align="center">
          	<button type="button" onclick="fn_update('${result.codeno}')">수정</button>
          	<button type="button" onclick="fn_delete('${result.codeno}')">삭제</button>
          </td>
		</tr>
		<c:set var="count" value="${count+1 }" />
	</c:forEach>	

	<tr>
		<th colspan = "5">
			<button type="button" onclick="location='codeWrite.do'"> 신규등록 </button>
	</th>
	</tr>
</table>


</body>
</html>