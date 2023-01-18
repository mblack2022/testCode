<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 목록</title>
﻿
<script src="script/jquery-3.6.0.js"></script>
<script src="script/jquery-ui.js"></script>

<style type="text/css">
	body {
		font-size:10pt;
	}
	
	th, td {	
		border	: 1px solid #cccccc;
		padding : 5px;
	}
	
	table {
		width:600px;
		border-collapse: collapse;
	}
	
	button {
		font-size : 10pt;
		border:1px;
		background-color: transparent;
		cursor: pointer;
	}
	
	.div1 {
		font-size : 10pt;
		text-align=center; 
		margin-top:5px;
	}
	
	.div2 {
		width : 600px;
		text-align:center;
		font-size : 9pt;
		margin-top:10px;
	}
</style>

</head>

<script>
	
	$(function(){
		
		$("#listCnt").click(function(){
			
			var sendData = "viewPage=${i}&listCnt=${listCnt}&seachFilter=${seachFilter}&seachText=${seachText}";
			
			$.ajax({
				type:"POST" ,
				data:sendData,
				url:"boardList.do", 
				datatype:"text" ,
	            error:function(request,status,error){
	            	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	               }            
			});	//ajax
		}); //click
	}); //function()

</script>



<body>
	<form id="boardList"  method="post">
	<!-- 글쓰기 , 출력 건수 -------------------------------------------->
	<table >
		<tr>
		<td>
			<div class= "div1" >
				<button type="button" onclick="location='boardWrite.do'" > 글쓰기  </button> 
			</div>
		</td>
		<td align="right">				
			<select name = "listCnt" >
					<option value="10" > 10 개씩 </option>
					<option value="15"  selected> 15 개씩 </option>
					<option value="20" > 20 개씩 </option>
					<option value="25" > 25 개씩 </option>
					<option value="30" > 30 개씩 </option>
			</select>
		</td>
		</tr>
	</table>
	
	<!--  게 시 글  -------------------------------------------------->
	<table>
		<tr>
			<th width=10% > 번호 </th>
			<th width=50% > 제   목 </th>
			<th width=15% > 작성자 </th>
			<th width=15% > 작성일 </th>
			<th width=10% > 조회수 </th>
		</tr>
		
		<c:set var="cnt" value = "${startRowNo}"/>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td align="center" width=10%><c:out value="${cnt }"/>  </td>
				<td ><a href="boardDetail.do?unq=${result.unq}"> <c:out value="${result.title}" /></a>  </td>
				<td ><c:out value="${result.name}" /> </td>
				<td ><c:out value="${result.rdate}" />  </td>
				<td align="center" ><c:out value="${result.hits}" /> </td>
			</tr>		
				<c:set var="cnt" value="${cnt-1}" />
		</c:forEach>
		
	</table>
	
	<!-- 페이지 수 --------------------------------------------------> 
	<!-- <a href="boardList.do?viewPage=${i}"> ${i  } </a> -->
	<div style="width:600px; margin-top:5px; text-align:center" >
		<c:forEach var="i"  begin="1" end="${totalPage }" >
			<a href="boardList.do?viewPage=${i}&seachFilter=${seachFilter}&seachText=${seachText}&listCnt=${listCnt}"> 
				${i  } </a>
		</c:forEach>
	</div>
	
	<!--  검 색 하 기  ------------------------------------------------>
	
	<div class="div2">
		<form name ="searchFrm" method="post" action="boardList.do" >
			<select name = "seachFilter" id = "seachFilter">
				<option value ="title"> 제목 </option>
				<option value ="name"> 작성자 </option>
				<option value ="content"> 내 용 </option>
			</select>
			<input type="text" name = "seachText" id="seachText" value="${seachText}" >
			<button type="submit"> 검 색 </button>
		</form>			
	</div>

</body>
</html>