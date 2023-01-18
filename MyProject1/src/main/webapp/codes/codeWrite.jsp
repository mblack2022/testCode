<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>코드 입력</title>
</head>

<style>
table {
	width: 400px;
	border-collapse: collapse; /* 셀 간격 없앰 */
}

th, td {
	border: 1px solid #cccccc;
	padding: 5px;
}
</style>

<script>
	function fn_submit() {
		if(document.frm.codenm.value == ""){
			alert("코드명을 입력해주세요.");
			document.frm.codenm.focus();
			return false
		}
		document.frm.submit();
	}
</script>



<body>

	<form name="frm" method="post" action="codeWriteSave.do">
		<table>
			<tr>
				<th>분류</th>
				<td><select name="gid">
						<option value="100">업 무</option>
						<option value="200">취 미</option>
				</select>
			</tr>

			<tr>
				<th>코드명</th>
				<td><input type="text" name="codenm"></td>
			</tr>

			<tr>
				<th colspan="2">
					<button type="submit" onclick="fn_submit(); return false;">저 장</button>
					<button type="reset">취 소</button>
				</th>
			</tr>
		</table>
	</form>

</body>
</html>