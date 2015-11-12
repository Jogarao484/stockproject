<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript" src="js/linechart/d3.v3.min.js"></script>
<style type="text/css">
	.axis path,
	.axis line{
	  fill: none;
	  stroke:black;
	  shape-rendering:crispEdge;
	}
	
	.axis text{
	  font-family: sans-serif;
	  font-size: 10px;
	}
	
	h1{
	  font-family: sans-serif;
	  font-weight: bold;
	  font-size: 16px;
	}
	.tick
	{
	  stroke-dasharray: 1, 2;
	}
</style>
<script type="text/javascript">
	var app = angular.module('chartApp', []);
	
	app.controller('StocksController', ['$scope','$interval', function($scope, $interval){
	    $scope.stocksData=[
	        {months: 1,stocks: 54}
	    ];
	
	    $interval(function(){
	        var months=$scope.stocksData.length+1;
	        var stocks= Math.round(Math.random() * 10);
	        $scope.stocksData.push({months: months, stocks:stocks});
	    }, 0, 100);
	}]);
	
	app.directive('linearChart', function($parse, $window){
	   return{
	      restrict:'EA',
	      template:"<svg width='850' height='200'></svg>",
	       link: function(scope, elem, attrs){
	           var exp = $parse(attrs.chartData);
	
	           var stocksDataToPlot=exp(scope);
	           var padding = 20;
	           var pathClass="path";
	           var xScale, yScale, xAxisGen, yAxisGen, lineFun;
	
	           var d3 = $window.d3;
	           var rawSvg=elem.find('svg');
	           var svg = d3.select(rawSvg[0]);
	
	           scope.$watchCollection(exp, function(newVal, oldVal){
	               stocksDataToPlot=newVal;
	               redrawLineChart();
	           });
	
	           function setChartParameters(){
	
	               xScale = d3.scale.linear()
	                   .domain([stocksDataToPlot[0].months, stocksDataToPlot[stocksDataToPlot.length-1].months])
	                   .range([padding + 5, rawSvg.attr("width") - padding]);
	
	               yScale = d3.scale.linear()
	                   .domain([0, d3.max(stocksDataToPlot, function (d) {
	                       return d.stocks;
	                   })])
	                   .range([rawSvg.attr("height") - padding, 0]);
	
	               xAxisGen = d3.svg.axis()
	                   .scale(xScale)
	                   .orient("bottom")
	                   .ticks(stocksDataToPlot.length - 1);
	
	               yAxisGen = d3.svg.axis()
	                   .scale(yScale)
	                   .orient("left")
	                   .ticks(5);
	
	               lineFun = d3.svg.line()
	                   .x(function (d) {
	                       return xScale(d.months);
	                   })
	                   .y(function (d) {
	                       return yScale(d.stocks);
	                   })
	                   .interpolate("basis");
	           }
	         
	         function drawLineChart() {
	
	               setChartParameters();
	
	               svg.append("svg:g")
	                   .attr("class", "x axis")
	                   .attr("transform", "translate(0,180)")
	                   .call(xAxisGen);
	
	               svg.append("svg:g")
	                   .attr("class", "y axis")
	                   .attr("transform", "translate(20,0)")
	                   .call(yAxisGen);
	
	               svg.append("svg:path")
	                   .attr({
	                       d: lineFun(stocksDataToPlot),
	                       "stroke": "blue",
	                       "stroke-width": 2,
	                       "fill": "none",
	                       "class": pathClass
	                   });
	           }
	
	           function redrawLineChart() {
	
	               setChartParameters();
	
	               svg.selectAll("g.y.axis").call(yAxisGen);
	
	               svg.selectAll("g.x.axis").call(xAxisGen);
	
	               svg.selectAll("."+pathClass)
	                   .attr({
	                       d: lineFun(stocksDataToPlot)
	                   });
	           }
	
	           drawLineChart();
	       }
	   };
	});
</script>

<title>New Stock</title>
</head>
<body>
	<div ng-app="chartApp" ng-controller="StocksController">
		<h1>Today's Stock Chart</h1>
		<div linear-chart chart-data="stocksData"></div>
	</div>

</body>
</html>