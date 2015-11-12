<!doctype html>
<html lang="en" ng-app="app">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="SVSS">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Stock Mobile App</title>
<script src="js/angular.min.js" type="text/javascript"></script>

<!-- search css and angular js -->
<script src="js/search/angular-touch.min.js" type="text/javascript"></script>
<script src="js/search/search.js" type="text/javascript"></script>
<script>
var app = angular.module('app', ["ngTouch", "angucomplete-alt"]);

app.controller('MainController', ['$scope', '$http',
  function MainController($scope, $http) {
    $scope.data = [
   { "name" : "Acetaminophen" },
   { "name" : "Apple" },
   { "name" : "AppSumo" },
   { "name" : "Appache" },
   { "name" : "Igate" },
   { "name" : "bosch" },
   { "name" : "csr" },
   { "name" : "Cognizant" },
   { "name" : "Tech Mahindra" },
   { "name" : "Reliance" },
   { "name" : "Tcs" },
   { "name" : "Wipro" },
   { "name" : "Flipkart" },
   { "name" : "Infosys" },
   { "name" : "Capgemini" },
   { "name" : "Accenture" },
   { "name" : "Oracle" },
   { "name" : "Cisco" },
   { "name" : "Svss" },
   { "name" : "Hcl technologies" },
   { "name" : "Ntt Data" },
   { "name" : "Arris Global" },
   { "name" : "Marlabs" }
   ]
  }
]); 
</script>
<!--// search css and angular js -->

<!-- line chart css and angular js code -->
	<!-- <script type="text/javascript" src="js/linechart/d3.v3.min.js"></script>
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
</script> -->
<!--// line chart css and angular js code -->

<!-- bar chart css and angular js code -->
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/highcharts.js"></script>
<!-- <script type="text/javascript" src="js/exporting.js"></script> -->
<style type="text/css">
#container {
	min-width: 110px;
	height: 240px;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#container")
				.highcharts(
						{
							chart : {
								zoomType : 'xy'
							},
							title : {
								text : "Stock Chart"
							},
							xAxis : [ {
								categories : [ 'Jan 5', 'Feb 15', 'Mar 1', 'Apr 7',
										'May 9', 'Jun 28', 'Jul 17', 'Aug 23', 'Sep 25',
										'Oct 10', 'Nov 11', 'Dec 3' ]
							} ],
							yAxis : [ { //Primary yAxis
								labels : {
									format : '{value}',
									style : {
										color : 'white'
									}
								},
								title : {
									text : ' ',
									style : {
										color : 'white'
									}
								}
							}, {//Secondary yAxis
								title : {
									text : 'Currency',
									style : {
										color : 'white'
									}
								},
								labels : {
									format : '{value}.00',
									style : {
										color : 'white'
									}
								},
								opposite : true
							} ],
							tooltip : {
								shared : true
							},
							legend : {
								layout : 'vertical',
								align : 'left',
								x : 50,
								verticalAlign : 'top',
								y : 50,
								floating : true,
								backgroundColor : ''
							},
							series : [
									{
										name : 'Currency',
										color : '#9999CC',
										type : 'column',
										yAxis : 1,
										data : [ 49.9, 71.5, 106.4, 129.2,
												144.0, 176.0, 135.6, 148.5,
												216.4, 194.1, 95.6, 54.4 ],
										tooltip : {
											valueSuffix : ' .00'
										}
									},
									{
										name : 'Duration',
										color : '#9999CC',
										type : 'spline',
										yAxis : 1,
										data : [159.9, 191.5, 206.4, 229.2,
												244.0, 276.0, 235.6, 248.5,
												316.4, 294.1, 195.6, 154.4 ],
										tooltip : {
											valueSuffix : ''
										}
									} ]
						});
	});
</script>
<!--// bar chart css and angular js code -->
<script type="text/javascript">
	  	function load(){
			$(document).ready(function(){
				$("#container").hide();
				$("#hide_details").hide();				
			});
		}
  </script>
  <script type="text/javascript">
	$(document).ready(function(){
		$("#show_details").click(function(){
			$("#container").show();
			$("#show_details").hide();
			$("#hide_details").show();
		});
		
		$("#hide_details").click(function(){			
			$("#container").hide();
			$("#hide_details").hide();
			$("#show_details").show();			
		}); 
	});
  </script>
</head>
<body ng-controller="MainController"  onload="load()">
	<table class="table" cellpadding="15px" cellspacing="15px">
		<tr>
			<td>
				<img src="images/image.png" alt="Smiley face" height="35" width="45" id="img1">
			</td>
			<td>
				<p>SEARCH STOCKS</p>
			</td>
			<td><p style="font-size: 25px">X</p></td>
		</tr>

		<tr>
			<td align="center" colspan="3"><label><a class="current" href="#">SEARCH</a></label>&nbsp;&nbsp;&nbsp;<label><a href="#">EXPLORE</a></label></td>
		</tr>

		<tr>
			<td><img src="images/search.png" alt="Smiley face" height="35"
				width="45" id="img1"></td>
			<td align="center"><div>
					<!-- search box code -->
					<div class="large-padded-row">

						<div angucomplete-alt id="ex5" placeholder="Search" pause="500"
							selected-object="selectedObject" local-data="data"
							search-fields="name" title-field="name" minlength="3"
							input-class="form-control form-control-small"
							match-class="highlight" force-list-selection="true" style="width: 70%"></div>
					</div>
				</div></td>
			<td><p id="tab">X</p></td>
			<td></td>			
		</tr>		
		<tr>
			<td><p style="color: white">APPLE</p></td>
			<td style="color: white">117.50&nbsp;&nbsp;&nbsp;<span style="color: green">(3.4%)</span></td>
			<td><img src="images/image4.png" alt="Smiley face" height="35" width="45" id="show_details"><img src="images/minus.png" alt="Smiley face" height="35" width="45" id="hide_details"></td>
		</tr>

		<tr> <!-- line chart code -->
			<td align="center" colspan="3">
				<div id="container" align="center"></div>
			</td> <!-- end line chart code -->
		</tr>

		<tr>
			<td><p style="color: white">APPEND</p></td>
			<td style="color: white">11.50&nbsp;&nbsp;&nbsp;<span style="color: green">(2.91%)</span></td>
			<td><img src="images/image4.png" alt="Smiley face" height="35" width="45" id="img1"></td>

		</tr>

		<tr>
			<td><p style="color: white">APPLITECH</p></td>
			<td style="color: white">59.82&nbsp;&nbsp;&nbsp;<span style="color: green">(0.81%)</span></td>
			<td><img src="images/image4.png" alt="Smiley face" height="35" width="45" id="img1"></td>
		</tr>

		<tr>
			<td><p style="color: white">APEX</p></td>
			<td style="color: white">11.50&nbsp;&nbsp;&nbsp;<span style="color: green">(2%)</span></td>
			<td><img src="images/image4.png" alt="Smiley face" height="35" width="45" id="img1"></td>

		</tr>
	</table>
				<!-- <div ng-app="chartApp" ng-controller="StocksController">
					<h1>Today's Stock Chart</h1>
					<div linear-chart chart-data="stocksData"></div>
				</div> -->				
</body>
</html>