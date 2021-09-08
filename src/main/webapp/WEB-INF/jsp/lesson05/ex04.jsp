<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fn 라이브러리</title>
</head>
<body>
	<c:set var="str1" value="No pain. No gain." />
	
	<h3>1. 길이 구하기</h3>
	${fn:length(str1)}<br>
	
	<h3>2. 특정 문자열이 있는지 확인</h3>
	No가 존재하는가? ${fn:contains(str1, "No")}<br>
	no가 존재하는가? ${fn:contains(str1, "no")}<br>
	
	<c:if test="${fn:containsIgnoreCase(str1, 'no')}">
		문장에 no라는 문자열이 존재합니다.(대소문자 구별 안함)<br>
	</c:if>
	
	<h3>3. 특정 문자열로 시작하는지 확인</h3>
	No로 시작하는가? ${fn:startsWith(str1, 'No')}<br>
	
	<h3>4. 특정 문자열로 끝나는지 확인</h3>
	n으로 끝나는가? ${fn:endsWith(str1, 'n')}<br>
	.으로 끝나는가?(점은 제대로 검사가 안됨) ${fn:endsWith(str1, '\\.')}<br>
	단어째로 검사 -> ${fn:endsWith(str1, 'gain.')}
	
	<h3>5. 문자열 치환</h3>
	<c:set var="str2"  value="I love chiken"/>
	
	${str2}<br>
	${fn:replace(str2, 'chiken', 'bread')}
	
	<h3>6. 구분자로 잘라서 배열 만들기</h3>
	${fn:split(str1, '.')[0]}<br>
	${fn:split(str1, '.')[1]}<br>
	
	<h3>7. 시작 인덱스부터 종료 인덱스까지 자르기(substring)</h3>
	${fn:substring(str2, 2, 6)}
	
	<h3>8. 모두 소문자로 변경(toLowerCase)</h3>
	${fn:toLowerCase(str2)}
	
	<h3>9. 모두 대문자로 변경(toUpperCase)</h3>
	${fn:toUpperCase(str2)}
	
	<h3>10. 앞 뒤 공백 제거(trim)</h3>
	<c:set var="str3" value="              hello           " />
	<pre>${str3}</pre>
	${fn:trim(str3)}
</body>
</html>