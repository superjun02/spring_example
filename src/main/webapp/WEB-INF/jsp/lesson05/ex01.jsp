<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h1>1. 변수 정의하기 (c:set)</h1>
	
	<c:set var="number1" value="100" />
	number1: ${number1}<br>
	<c:set var="number2">250</c:set>
	number2: ${number2}<br>
	number1 + number2: ${number1 + number2}
	
	<h1>2. 변수 출력하기 (c:out)</h1>
	number1: <c:out value="${number1}"></c:out><br>
	<c:out value="Hello world!!!"></c:out><br>
	<c:out value="<script>alert('얼럿창띄우기')</script>" /><br> <%-- 문구 그대로 출력 --%>
	
	<%-- 스크립트가 수행됨 --%>
	<c:out value="<script>alert('얼럿창띄우기')</script>" escapeXml="false" /><br>
	
	<%-- 문구 그대로 출력 --%>
	<c:out value="<script>alert('얼럿창띄우기')</script>" escapeXml="true" /> 
</body>
</html>