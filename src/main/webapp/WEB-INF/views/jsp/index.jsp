
<!DOCTYPE html>
<html lang="en">
<head>
    <title>UCIPT Stress Analytics</title>
    <meta charset="utf-8">
    <spring:url value="/resources/core/files/time_chart.json" var="time_chart_json" />
    <spring:url value="/resources/core/js/topojson.v1.min.js" var="topojson" />
    <spring:url value="/resources/core/js/d3.geo.projection.v0.min.js" var="geo" />
    <spring:url value="/resources/core/js/vega.js" var="vega" />
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/custom.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="resources/js/main.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
</head>

<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span> 
        </button>
        <a href="#" class="navbar-left"><img src="resources/core/images/UCIPT-logo.png" class="logo-img"></a>
        <a class="navbar-brand" href="#">University Stress Analytics</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#about">ABOUT</a></li>
          <li><a href="#project">PROJECTS</a></li>
          <li><a href="#contact">CONTACT</a></li>
          <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
        </ul>
      </div>
    </div>
  </nav>

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="resources/core/images/brain.jpg" alt="brain" width=100% height="700">
        <div class="carousel-caption">
          <h2>Big Data & Machine Learning</h2>
          <p>At the UCIPT, we're bringing big data and machine learning to student health</p>
        </div>
      </div>

      <div class="item">
        <img src="resources/core/images/bigdata.png" alt="bigdata" width=100% height="700">
        <div class="carousel-caption">
          <h2>University & Student Mental Health</h2>
          <p>Use the power of big data to answer questions like: <em>How stressed is your university?</em></p>
        </div>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <div id="about" class="container text-center">
    <h3>University of California Institute for Prediction Technology</h3>
    <p> At UCIPT, we are doing cutting-edge research bringing together big data, social media, and machine learning across UC campuses and departments to pioneer the new, interdisciplinary field of prediction technology.</p>
	  <p> UCIPT has developed a visualization application that compares social media data from 10 different universities. Each day tweets are collected and the graph is updated, providing trends and insights into the real-time stress and happiness quotients at these institutions.</p>
    <p>See our Q&A on the project - <a href="http://predictiontechnology.ucla.edu/social-media-stress-and-college-life-the-freshman-200-study/">Social Media, Stress, and College Life: The Freshman 200 Study</a></p>

	</div>

  <div id="project" class="container-fluid text-center">
  	<div class="project">
      <h3>Visualization Demos</h3>
      <div class="row">
        <div class="col-sm-4">
          <ul class="nav nav-pills nav-stacked grey">
  		    <li class="active"><a data-toggle="pill" href="#time-series">Time Series Visualization</a></li>
  			<li><a data-toggle="pill" href="#stress-map">Stress Map</a></li>
  			<li><a data-toggle="pill" href="#happiness-quotient">Happiness Quotient</a></li>
  			<li><a data-toggle="pill" href="#word-cloud">Word Cloud</a></li>
		  </ul>
        </div>
        <div class="col-sm-8">
          <div class="tab-content">
            <div id="time-series" class="tab-pane fade in active">
          	  <img src="resources/core/images/time-series.png" class="img-responsive">
          	  <div class="how-it-works">
          	    <h4>How It Works</h4>
          	    <p><b>Time Series Visualization</b> - Select two schools to compare. The visualization will show the stress levels over time for each school.</p>
          	  </div>
          	</div>
            <div id="stress-map" class="tab-pane fade">
              <img src="resources/core/images/stress-map.png" class="img-responsive">
                <div class="how-it-works">
                  <h4>How It Works</h4>
                  <p><b>Stress Map</b> - This map will show the overall stress level by location from a 0 - 1 (light blue to red) scale.<br> 0 (light blue) represents low levels of stress whereas 1 (red) represents high levels of stress.</p>
                </div>
            </div>
            <div id="happiness-quotient" class="tab-pane fade">
              <img src="resources/core/images/happiness-quotient.png" class="img-responsive">
              <div class="how-it-works">
                <h4>How It Works</h4>
                <p><b>Happiness quotient</b> - The overall happiness levels at each university.</p>
              </div>
            </div>
            <div id="word-cloud" class="tab-pane fade">
              <img src="resources/core/images/tag-cloud.png" class="img-responsive">
              <div class="how-it-works">
                <h4>How It Works</h4>
                <p><b>Word Cloud</b> - Displays the most frequently used words by students.</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div id="contact" class="container">
    <h3 class="text-center">Contact</h3>
    <p class="text-center"><em>Want to get involved?</em></p>
    <div class="row test">
      <div class="col-md-4">
        <p><em>Student?</em><br>Leave us your Twitter handle. The more Twitter handles we can collect data from, the better our models perform.</p>
        <p><em>Not a student, but still interested in prediction technology?</em><br>Email us at info@predictiontechnology.ucla.edu.</p>
      </div>
      <div class="col-md-8">
        <div class="row">
          <div class="col-sm-6 form-group">
            <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div> 
    </div> 
  </div>

  <footer class="text-center">
    <a href="http://predictiontechnology.ucla.edu/">2016 UC Institute of Prediction Technology</a>
  </footer>

  </body>
</html>

