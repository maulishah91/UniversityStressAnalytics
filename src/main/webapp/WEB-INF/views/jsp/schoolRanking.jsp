<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<meta charset="utf-8">

<head>
    <title>Sentiment Analysis</title>  
    <%@include file="navigation.jsp" %>
    <spring:url value="/resources/core/js/barChart.js" var="barChart_js" />
    <spring:url value="/resources/core/js/wordCloud.js" var="wordCloud_js" />
    <spring:url value="/resources/core/js/cloud.js" var="cloud_js" />
    <spring:url value="/resources/core/files/wordCloudData.json" var="cloud_json" />
    <spring:url value="/resources/core/files/barChart.tsv" var="bar_chart_tsv" />
    
    <script type="text/javascript">
    wordCloudData_json = "${cloud_json}";
    bar_chart_tsv="${bar_chart_tsv}";
    </script>
    
    <script src="${cloud_js}"></script>
    <script type="text/javascript" src="${barChart_js}"></script>
    <script type="text/javascript" src="${wordCloud_js}"></script>   
    
    <script src="${jquery_js}"></script>

    <style>

        .bar {
          fill: #9467bd;
        }

        .bar:hover {
          fill: #bcbd22;
        }

        .axis path,
        .axis line {
          fill: none;
          stroke: #000;
        }


  </style>

</head>

<body>
    <div class="container">
        <div class="row">
            <section class="content">
                <div class="col-md-8 col-md-offset-4">
                    <div><script>createBarChart();</script></div>
                    <div><script type="text/javascript">createWordCloud();</script> </div> 

                </div>

            </section>

        </div>
    </div>
    <div style="position:absolute;width:100%;">
    <%@include file="footer.jsp" %> </div>
</body>