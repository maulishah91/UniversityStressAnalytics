
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<html>



<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrap_js" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrap_css" />
<!-- jQuery -->
<spring:url value="/resources/core/js/jquery.js" var="jquery_js" />
<!-- css -->
<spring:url value="/resources/core/css/index.css" var="index_css" />
<!-- d3 -->
<spring:url value="/resources/core/js/d3.v3.min.js" var="d3_min" />

<link rel="stylesheet" type="text/css" href="${index_css}"/> 
<link rel="stylesheet" type="text/css" href="${bootstrap_css}"/>
<script src="${jquery_js}"></script>
<script src="${bootstrap_js}"></script>
<script src="${d3_min}"></script>
</html>
