<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<meta charset="utf-8">

<head>
    <title>Sentiment Analysis</title>  
    <script>var pageName='#schoolRanking';</script>
    <%@include file="navigation.jsp" %>
    <spring:url value="/resources/core/js/barChart.js" var="barChart_js" />
    <spring:url value="/resources/core/js/wordCloud.js" var="wordCloud_js" />
    <spring:url value="/resources/core/js/cloud.js" var="cloud_js" />
    <spring:url value="/resources/core/files/wordCloudData.json" var="cloud_json" />
    <spring:url value="/resources/core/js/d3.tip.v0.6.3.js" var="d3_tip" />
    <script src="${d3_tip}"></script>
    <script type="text/javascript">
    wordCloudData_json = "${cloud_json}";
    </script>
    
    <script src="${cloud_js}"></script>
    <script type="text/javascript" src="${barChart_js}"></script>
    <script type="text/javascript" src="${wordCloud_js}"></script>   
    
    <script src="${jquery_js}"></script>
    <script>
    
    </script>

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
                    <script>   
                    d3.json(wordCloudData_json, function(data) { 
                    	wordCloudData_json = data;
                    	//alert("mauli"+data);
                    	createWordCloud(wordCloudData_json);
                    });
                    </script>
                    


                </div>
				 <div id="showBarChart" ></div>
                 <div id="showWordCloud" style="position:absolute;left:800px;top:250px;"><script type="text/javascript"></script> </div> 
            </section>

        </div>
    </div>
    <div style="position:absolute;width:100%;">
    <%@include file="footer.jsp" %> </div>
    <script>
    //load bar chart on page load
    $.ajax({
		type : "GET",
		contentType : "application/json",
		url : "ajax/getBarPlot",
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			createBarChart(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			alert(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

    </script>
</body>