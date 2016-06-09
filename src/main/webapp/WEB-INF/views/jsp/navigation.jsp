<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<body>
 <%@include file="links.jsp" %>
  <script type="text/javascript">

            $(document).ready(function() {
    $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    // $(".tab").addClass("active"); // instead of this do the below 
    $(pageName).removeClass("btn-default").addClass("btn-primary");   
});

        </script> 
        <div class="navigation">
<div class="background-image"></div>
<div class="title" style="font-size: 40px;text-align: center;font-family: 'Lucida Console, Monaco, monospace'">
University Stress Analytics</div>

<div class="container">
    <div class="row">
        <section class="content">

<div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
        <div class="btn-group" role="group">
            <a type="button" id="timeSeries" class="btn btn-default" href="index" >
                <div class="hidden-xs" >Time Series Visualization</div>
            </a>
        </div>
        <div class="btn-group" role="group" >
            <a type="button"  class="btn btn-default" href="stressMap" id="stressMap">
                <div class="hidden-xs">Stress Map</div>
            </a>
        </div>
        <div class="btn-group" role="group">
            <a type="button" id="schoolRanking" class="btn btn-default"  href="schoolRanking" >
                <div class="hidden-xs">Happiness Quotient</div>
            </a>
        </div>
        <div class="btn-group" role="group">
            <a type="button" id="contact" class="btn btn-default" href="contact">
                <div  class="hidden-xs">Contact us</div>
            </a>
        </div>
        </div>
        </div>
    
        </section>
    </div>
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
<style type="text/css">
    

.background-image {
  background-color: #ADC4CC;
  background-size: cover;
  display: block;
  filter: blur(5px);
  -webkit-filter: blur(5px);
  height: 120px;
  left: 0;
  position:absolute;
  right: 0;
  }

.title {
  background: rgba(255, 255, 255, 0.35);
  border-radius: 3px;
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
  font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
  top: 10px;
  left: 0;
  position: relative;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 20px;  
  right: 0;
  z-index: 2;
  padding: 0 10px;
}

.hidden-xs{
    text-align: center;
    font-family: 'Courier New, Monaco, monospace';
    font-weight: bold;
    font-size: 16px;
}

.btn-primary,  .btn-primary:active {
    background-color: #373737 !important;
}

.btn-primary:hover
{
            background-color: #DCD0C0;
            color: white;
            
        }

</style>
</body>
</html>

