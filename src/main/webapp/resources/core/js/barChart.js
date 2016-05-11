function createBarChart(){

var margin = {top: 50, right: 50, bottom: 50, left: 50},
    width = 700 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var x = d3.scale.ordinal()
    .rangeRoundBands([0, width], .1);

var y = d3.scale.linear()
    .range([height, 0]);

var xAxis = d3.svg.axis()
    .scale(x)
    .orient("bottom");

var yAxis = d3.svg.axis()
    .scale(y)
    .orient("left")
    .ticks(10);


var svg = d3.select("#showBarChart").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");   

d3.tsv(bar_chart_tsv, type, function(error, data) {
  if (error) throw error;

  x.domain(data.map(function(d) { return d.letter; }));
  y.domain([0, d3.max(data, function(d) { return (d.frequency+100); })]); //additional 100 will increase y axis range, this will not affect the values


  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

//Rotate the label on Y axis
  svg.append("g")
      .attr("class", "y axis")
      .call(yAxis)
    .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .text("Happiness Quotient");

//map the tsv file value to bar chart
  svg.selectAll(".bar")
      .data(data)
    .enter().append("rect")
      .attr("class", "bar")
      .attr("x", function(d) { return x(d.letter); })
      .attr("width", x.rangeBand())
      .attr("y", function(d) { return y(d.frequency); })
      .attr("height", function(d) { return height - y(d.frequency); }) // its height - y value.. which is y value from bottom as the axis starts from 0,0 in the top left
      .on("mouseover", Hover); 
// add legend  
colors = [["Happiness Values","#9467bd"]];
   
var legend = svg.append("g")
    .attr("class", "legend")
    .attr("height", 100)
    .attr("width", 100)
    .attr('transform', 'translate('+(-margin.right-20)+','+margin.top+')');

//Small rectangle which shows the color
var legendRect = legend.selectAll('rect').data(colors);

legendRect.enter()
    .append("rect")
    .attr("x", width + margin.right+15)
    .attr("width", 10)
    .attr("height", 10);

legendRect
    .attr("y", function(d, i) {
        return i * 20;
    })
    .style("fill", function(d) {
        return d[1];
    });

var legendText = legend.selectAll('text').data(colors);

legendText.enter()
    .append("text")
    .attr("x", width - margin.right-2);

legendText
    .attr("y", function(d, i) {
        return i * 20 + 9;
    })
    .text(function(d) {
        return d[0];
    }); 
     

});

function type(d) {
  d.frequency = +d.frequency;
  return d;
}


function Hover(d){
	//alert(d.letter);
	//place the ajax request here for creating wordcloud
	
	
	var data = {}
	data["letter"] = d.letter;
	
	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "ajax/getWordCloud",
		data : d.letter,
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			//alert(data);
			createWordCloud(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			alert(e);
		},
		done : function(e) {
			console.log("DONE");
		}
	});

	

	
}



}