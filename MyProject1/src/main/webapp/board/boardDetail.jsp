<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"      uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- -->
<% pageContext.setAttribute("newline", "\n"); %>
<!-- 
<c:set var="content" value="${fn:replace(result.content,newline,'<br>') }" />
 -->
 
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 게시글 보기 </title>

<style type="text/css">
	body {
		font-size:10pt;
	}
	
	th {	
		font-size:14pt;
		border	: 0px solid #cccccc;
		padding : 5px;
		background-color:pink;
	}

	td {	
		font-size:10pt;
		padding : 5px;
	}
		
	table {
		width			:600px;
		border-collapse: collapse;
	}
	
	button {
		font-size : 9pt;
		border: 0 none;
		background-color: transparent;
		cursor: pointer;
	}
	
	textarea {
		border: 0 ;
		
	}
</style>

</head>
<body>

	<table>	
		<tr height="80">
			<th colspan = "2"> ${result.title}  </th>
		</tr>
		<tr height="40">
			<td align="left" >
				<button type="button" onclick="location='boardList.do'"> 목 록 </button>
			</td>
			<td align="right" >${result.name} </td>
		</tr>
		<tr height="20">
			<td width="50%"> 조회수 ${result.hits} </td>
			<td width="50%" align="right">${result.rdate} </td>
		</tr>
		<tr height="10">
			<td colspan = "2"  >
			----------------------------------------------------------------------------------------------------------- </td>
		</tr>		
		<tr >
			<td colspan = "2"  height="300"   style="vertical-align:top" > ${result.content} 
				<!-- 게시글의 줄바꿈(\n)을 <br>로 변경해줘야 한다. :jstl의 replace() 사용 -->
<!-- 				<textarea rows="30" cols="80" text-align="left">${result.content} </textarea> -->
			</td>
		</tr>	
		<tr>
			<th colspan = "2">
				<button type="button" onclick="location='boardModify.do?unq=${result.unq}'"> 수 정 </button>
				<button type="button" onclick="location='passWrite.do?unq=${result.unq}'"> 삭 제 </button>
			</th>
		</tr>	
	</table>
</body>
</html>