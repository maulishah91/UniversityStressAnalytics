<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<head>
<title>Sentiment Analysis</title>  
<!-- D3 related scripts -->
<spring:url value="/resources/core/files/time_chart.json" var="time_chart_json" />
<spring:url value="/resources/core/js/topojson.v1.min.js" var="topojson" />
<spring:url value="/resources/core/js/d3.geo.projection.v0.min.js" var="geo" />
<spring:url value="/resources/core/js/vega.js" var="vega" />
<script>var pageName='#timeSeries';</script>
<%@include file="navigation.jsp" %>
   
<script src="${topojson}"></script>
<script src="${geo}" charset="utf-8"></script>
<script src="${vega}"></script>  


<script type="text/javascript">

var dat;
// parse a spec and create a visualization view
function parse(spec,newdata) {
	spec["data"][0]["values"]=newdata;
  vg.parse.spec(spec, function(chart) { chart({el:"#showTimeSeries"}).height(400).width(650).update(); });
}

</script>
</head>
<body>
<div class="container">
    <div class="row">
<section class="content">
            <div class="col-md-8 col-md-offset-4">
                

               <div class="form-group">
                          
                          <select onclick="getTimeChart();" class="form-control" id="college1" style="width:100px;float:left;margin:10px;">
                            
                          </select>
                         <span style="float:left;margin:10px;">Versus </span>
                          <select onclick="getTimeChart();" class="form-control" id="college2" style="width:100px;float:left;margin:10px;">
                            
                          </select>
                          </div>
                    <br/><br/> 
            </div>
                <br/><br/><br/><br/>
                <div class="col-md-6 col-md-offset-2">
                      <div id="showTimeSeries"></div>     </div>       
</section>

</div></div>

<%@include file="footer.jsp"%>
  <script>
    //load time vis data
    function loadUniversities(){
    	var universities= ["UCLA","USC","Stanford","NCSU"];
    	var options="";
    	for (i=0;i<universities.length;i++){
    		options+="<option>"+universities[i]+"</option>";
    	}
    	document.getElementById("college1").innerHTML=options;
    	document.getElementById("college2").innerHTML=options;
    }
    function getTimeChart(){
    var data = {}
	data["univ1"] = document.getElementById("college1").value;
    data["univ2"] = document.getElementById("college2").value;
    if(data["univ1"]==null || data["univ1"]=="undefined"){
    	data["univ1"]="UCLA";
    	data["univ2"]="UCLA";
    }
    $.ajax({
		type : "GET",
		contentType : "application/json",
		url : "ajax/getTimeVisData",
		data : data,
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);		
			jsonResp=data;
			$.getJSON("${time_chart_json}", function(data) {
		        parse(data,jsonResp);
		        
		    });
		},
		error : function(e) {
			console.log("ERROR: ", e);
			alert("error"+e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});
    }
    loadUniversities();
    getTimeChart();
    </script>
</body>
