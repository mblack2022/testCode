<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제 암호 입력</title>

<script src="script/jquery-3.6.0.js"></script>   
<script src="script/jquery-ui.js"></script>

</head>

<script>
$(function(){
	
	$("#deleteBtn").click(function(){
		
		var pass = $("#pass").val();
		pass = $.trim(pass);
		
		if (pass == "" ) {
			alert("비밀 번호를 입력하세요.");
			$("#pass").val("");
			$("#pass").focus();
			return false;
		}

		var sendData = "unq=${unq}&pass=" + pass;
		
		$.ajax({
			type:"POST" ,
			data:sendData,
			url:"boardDelete.do", //json
			datatype:"text" ,
	        success:function(result){ 
	            if(result == "1"){ 
	                alert("삭제 완료");
	                location = "boardList.do";
	            } 	else if (result == "-1") {
	            	alert("암호가 일치하지 않습니다.");
	            }
	            	else {
	                alert("삭제 실패");
	            }
	        },
	         error:function(request,status,error){
	        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }            
		}); //ajax
	
	}); //click
		
});//function

</script>

<body>
<table>
	<tr>
		<th> 비 밀 번 호 입 력 </th>
		<td><input type="password" id="pass"></td>
		<td><button type="button" id="deleteBtn"> 삭 제 하 기 </button></td>
	</tr>
</table>
</body>
</html>