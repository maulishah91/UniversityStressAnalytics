function createWordCloud(){

    var words_size_list = [];

    d3.json(wordCloudData_json, function(data) {

    words_size_list = data;

    var color = d3.scale.linear()
            .domain([0, 2,4,8,d3.max(data, function(d) { return (d.size); })])
            .range(["#c7c7c7", "#aec7e8", "#1f77b4", "#636363", "#393b79"]);

    d3.layout.cloud().size([400, 300])
            .words(words_size_list)
            .rotate(0)
            .fontSize(function(d) { return d.size; })
            .on("end", addWordsToCloud)
            .start();

    function addWordsToCloud(words) {
        d3.select("body").append("svg")
                .attr("width", 500)
                .attr("height", 400)
                .attr("class", "wordcloud")
                .append("g")
                // without the transform, words words would get cutoff to the left and top, they would
                // appear outside of the SVG area
                .attr("transform", "translate(200,200)")
                .selectAll("text")
                .data(words)
                .enter().append("text")
                .style("font-size", function(d) { return d.size + "px"; })
                .style("fill", function(d, i) { return color(i); })
                .attr("transform", function(d) {
                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";})
                .text(function(d) { return d.text; });
    }
 });
}
