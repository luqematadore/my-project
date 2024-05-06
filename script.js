// Example custom JavaScript code for wpDataTable
jQuery(document).ready(function($) {
    // Get references to the charts
    var chart1 = $('#chart1').highcharts(); // Replace 'chart1' with the ID or selector of your first chart
    var chart2 = $('#chart2').highcharts(); // Replace 'chart2' with the ID or selector of your second chart

    // Add event listener to chart 1
    chart1.series[0].points.forEach(function(point) {
        $(point.graphic.element).on('click', function() {
            // Handle click event: Update chart 2 based on selected data point in chart 1
            // Example: Highlight corresponding data point in chart 2
            var index = point.index;
            chart2.series[0].points[index].select();
        });
    });

    // Add event listener to chart 2
    chart2.series[0].points.forEach(function(point) {
        $(point.graphic.element).on('click', function() {
            // Handle click event: Update chart 1 based on selected data point in chart 2
            // Example: Highlight corresponding data point in chart 1
            var index = point.index;
            chart1.series[0].points[index].select();
        });
    });
});

