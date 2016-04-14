<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<head>
    <title>Sentiment Analysis</title>  
	
    <!--  Add resource URLS-->
    <%@include file="navigation.jsp" %>
    <spring:url value="/resources/core/files/us.json" var="us_json" />
    <script>var json_us_heatmap="${us_json}"</script>
    <spring:url value="/resources/core/js/USheatMap.js" var="USheatMap" />
    
    <script src="${USheatMap}"></script>
    <style type="text/css">
        .states {
            stroke: #dcdcdc;
            stroke-width: -1.5px;
        }
 
        .states text {
            fill: #fff;
            stroke: none;
            text-anchor:middle;
            font-size: 8px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <section class="content">
                <div class="col-md-8 col-md-offset-3">
                <div style="width: 700px; height: 500px" id="map" />

                </div>
                </section>

        </div>
        <%@include file="footer.jsp" %> </div> 
    </div>

</body>
