<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title> 게 시 판 등 록 </title>
	
	<script src="script/jquery-3.6.0.js"></script>   
	<script src="script/jquery-ui.js"></script>
	
	<style>
		body {
			font-size:10pt;
			background-color:pink;
		}
		table {
			width:600px;
			border-collapse:collapse;
		}
		td,th {
			
			padding:3px;
		}
		button {
			font-size:10t;	
		}
		.input1 {
			width:98%;
		}
	
	</style>

</head>


<script>
	function fn_submit() {
		
		if( $.trim($("#title").val()) == "" ) {
			alert("제목을 입력해 주세요.");
			document.getElementById("title").focus();
			return false;
		}
		$("#title").val($.trim($("#title").val()));
		
		if( $.trim($("#pass").val()) == "" ) {
			alert("암호를 입력해 주세요!!!");
			document.getElementById("pass").focus();
			return false;
		} 
		$("#pass").val($.trim($("#pass").val()));
				
		if( $.trim($("#name").val()) == "" ) {
			alert("이름을 입력해 주세요!!!");
			document.getElementById("name").focus();
			return false;
		}
		
		if( $("#content").val() == "" ) {
			alert("내용를 입력해 주세요!!!");
			document.getElementById("content").focus();
			return false;
		}		
		
		// 저장처리
		// JQuery Ajax로 호출하기 전에 serialize를 해주면 
		// form안에 값들을 한 번에 전송 가능한 data로 만들 수 있어 많은 data를 보낼 때 유용하다.
		var formData = $("#frm").serialize();
		// 비동기전송방식
		$.ajax({
			type:"POST" ,
			data:formData,
			url:"boardWriteSave.do", 
			datatype:"text" ,
	        success:function(data){ 
                if(data == "ok"){ 
                    alert("저장하였습니다.");
                    location = "boardList.do";
                } else {
                    alert("저장 실패했습니다. 다시 시도해 주세요.");
                }
            },
             error:function(request,status,error){
            	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }            
		});		
	}

</script>


<body>
	<form id="frm" method="post">
	
		<table>
			<caption> 글 쓰 기 </caption>
			<colgroup>
				<col width="20%"/>
				<col width="80%"/>
			</colgroup>
			
			<tr>
				<th align="right"><label for="title">  제 목 </label></th>
				<td><input type="text" name="title" id="title" class="input1"></td>
			</tr>
			<tr>
				<th align="right">비밀번호</th>
				<td><input type="password" name="pass" id="pass"></td>
			</tr>
			<tr>
				<th align="right">이름</th>
				<td><input type="text" name="name" id="name"></td>
			</tr>
			<tr>
				<th align="right">내용</th>
				<td> <textarea rows="30" cols="70" name="content" id="content"></textarea></td>
			</tr>
			
			<tr>
				<th colspan=2>
					<button type="submit" onclick="fn_submit(); return false;"> 저 장 </button>
					<button type="reset" > 취 소 </button>
				</th>
			</tr>
		</table>
		
	</form>	
</body>

</html>