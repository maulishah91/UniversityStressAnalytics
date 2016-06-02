// usheatmap.js
function buildMap(data,jsonResp){
 
    var width = 800,
        height = 500,
    projection, path,
    svg, g, mapColor,
    values = {};
    
    jsonResp.forEach(function(state){
    	values[state.label] = state.value;
    });
    
   /* data.heatmap.forEach(function(state){
        values[state.label] = state.value;
        if(state.label=='NY'){
        	alert("here");
        	values[state.label] = 0;
        }
        
    });*/
 
    projection = d3.geo.albersUsa()
            .scale(width)
            .translate([-100, -40]);
 
    path = d3.geo.path()
            .projection(projection);
 
    svg = d3.select(document.getElementById('map')).append('svg')
            .attr('width', width)
            .attr('height', height); // lets leave a space for 'legend'
 
    g = svg.append('g')
            .attr('transform', 'translate(' + width/2  + ',' + height / 1.5 + ')')
            .attr('height', height)
            .append('g')
            .attr('class','states');
 
    mapColor = d3.scale.linear()
            .domain([0,d3.max(data.states, function(d) {
                return Math.log(values[d.properties.abbr] || 1);
            })])
            .interpolate(d3.interpolateRgb)
            .range(['#17becf','#FF0000']);
    
    mapCol = d3.scale.linear().range(['#17becf','#FF0000']);

    g.selectAll('path')
            .data(data.states)
            .enter()
            .append('path')
            .attr('d', path)
            .attr('id', function(d) { return d.properties.abbr; })
            .style('fill', function(d) { return mapColor(Math.log(values[d.properties.abbr] || 1)); });
 
    g.selectAll('text')
            .data(data.states)
            .enter()
            .append('text')
            .attr('transform', function(d) { return 'translate(' + path.centroid(d) + ')'; })
            .attr('id', function(d) { return 'label-'+d.properties.abbr; })
            .attr('dy', '.35em')
            .text(function(d) { return d.properties.abbr; });
    

  // Add a legend for the color values.

  //border around the legend
  var rectangle_border = svg.append("rect")
                         .attr("x",20)
                         .attr("y",0)
                         .attr("width",500)
                         .attr("height",80)
                         .attr("fill","none")
                         .attr("stroke","black")
                         .attr("padding",10);
                         

var legend = svg.selectAll(".legend")
    .data(mapCol.ticks())
    .enter()
    .append("g")
        .attr({
            'class': 'legend',
            'transform': function(d, i) {
                return "translate(" + (i * 40) + "," + (40) + ")";
            }
        });

legend.append("rect")
.attr({
    'x':50,
    'width': 40,
    'height': 20,
    'fill': function(d) { 
        return mapCol(d); 
    }
});

//the numbers below the colour giving intensity
legend.append("text")
.attr({
    'font-size': 10,
    'x': 50,
    'y': 30
})
.text(String);

svg.append("text")
.attr({
    'class': 'label',
    'font-size': 10,
    'x': 50,
    'y': 30
})
.text('Happy to Stressful');

  svg.append("text")
      .attr("class", "label")
      .attr("x", width + 20)
      .attr("y", 10)
      .attr("dy", ".35em")
      .text("Count");        
}
 
