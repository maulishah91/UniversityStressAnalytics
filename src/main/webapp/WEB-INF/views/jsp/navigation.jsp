<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<body>

<div class="container">
    <div class="row">
        <section class="content">
            <h1>Stress Quotient</h1><br/>
            <div class="col-md-8 col-md-offset-4">
                <div id="navigation">
                    <div class="btn-group">
                        <a href="index" class="btn btn-success btn-filter">Home</a>
                        <a href="stressMap" class="btn btn-warning btn-filter">Stress Map</a>
                        <a href="schoolRanking" class="btn btn-danger btn-filter">School Ranking</a>
                        <a href="contact" class="btn btn-info btn-filter">Contact us</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<br/>

<!-- bootstrap -->
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

</body>
</html>

