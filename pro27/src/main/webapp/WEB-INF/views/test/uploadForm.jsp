<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>파일업로드</title>
<script>
let cnt = 0;

function fn_addFile() {
    const input = document.createElement("input");
    input.type = "file";
    input.name = "file" + cnt;  // 파일 필드 이름을 'file0', 'file1', 'file2'... 등으로 설정
    input.addEventListener('change', function() {
        if (input.files.length > 0) {
            fn_addFile();  // 파일이 선택되면 새로운 파일 첨부 필드를 추가
        }
    });

    const br = document.createElement("br");  // 줄 바꿈을 위한 <br> 요소 생성
    const dFile = document.getElementById("d_file");  // ID가 'd_file'인 요소에 추가
    dFile.appendChild(br);
    dFile.appendChild(input);
    cnt++;  // 카운터 증가
}

</script>
</head>
<body>
    <h1>파일 업로드</h1>
    <form method="post" action="${contextPath}/upload.do" enctype="multipart/form-data">
        <label>이름:</label>
        <input type="text" name="name"> <br>
        <input type="button" value="파일 추가" onClick="fn_addFile()"> <br>
        <div id="d_file">
        </div>
        <input type="submit" value="업로드" />
    </form>
</body>
</html>
