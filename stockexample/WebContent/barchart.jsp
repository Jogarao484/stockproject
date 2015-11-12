<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bar Chart</title>
<script type="text/javascript" src="js/angular.min.js"></script>
<!-- <script type="text/javascript" src="js/d3.v3.min.js"></script> -->
<style type="text/css">
body {
  text-align: center;
}
.chart {
  border-left: 1px solid black;
  border-bottom: 1px solid black;
  margin: 60px auto;
  position: relative;
  list-style: none;
  padding: 0;
}
.y {
  position: absolute;
  -webkit-transform: rotate(-90deg);
      -ms-transform: rotate(-90deg);
          transform: rotate(-90deg);
  -webkit-transform-origin: bottom left;
      -ms-transform-origin: bottom left;
          transform-origin: bottom left;
  bottom: 0;
  padding: 5px;
}
.x {
  position: absolute;
  top: 100%;
  width: 100%;
  padding: 5px;
  text-align: left;
}
.bar {
  background: gray;
  position: absolute;
  bottom: 0;
}
.bar:nth-of-type(even) {
  background: gray;
}
.bar span {
  position: absolute;
  bottom: -10px;
  left: 50%;
  -webkit-transform: rotate(-90deg) translateY(-50%);
      -ms-transform: rotate(-90deg) translateY(-50%);
          transform: rotate(-90deg) translateY(-50%);
  -webkit-transform-origin: left top;
      -ms-transform-origin: left top;
          transform-origin: left top;
  font-weight: bold;
  opacity: 0;
  -webkit-transition: 0.3s;
          transition: 0.3s;
  white-space: nowrap;
}
.bar:hover span {
  opacity: 1;
}

</style>

<script type="text/javascript">
(function() {

	  var app = angular.module('graphApp', []);

	  app.controller('graphController', function($scope) {

	    // Options

	    $scope.width = 600;
	    $scope.height = 350;
	    $scope.yAxis = 'Stock Price';
	    $scope.xAxis = 'Jan    Feb    Mar Apr May   2014';

	    // Data 

	    $scope.data = [{
	      label: 'January 10',
	      value: 36
	    }, {
	      label: 'January 15',
	      value: 54
	    }, {
	      label: 'January 20',
	      value: 62
	    }, {
	      label: 'February 5',
	      value: 30
	    }, {
	      label: 'February 13',
	      value: 96
	    }, {
	      label: 'February 21',
	      value: 40
	    }, {
	      label: 'March 7',
	      value: 122
	    }, {
	      label: 'March 19',
	      value: 100
	    }, {
	      label: 'April 1',
	      value: 176
	    }, {
	      label: 'April 8',
	      value: 45
	    }, {
	      label: 'May 6',
	      value: 250
	    }, {
	      label: 'May 15',
	      value: 300
	    }];

	    // Find Maximum X & Y Axis Values - this is used to position the data as a percentage of the maximum
	    $scope.max = 0;

	    var arrLength = $scope.data.length;
	    for (var i = 0; i < arrLength; i++) {
	      // Find Maximum X Axis Value
	      if ($scope.data[i].value > $scope.max)
	        $scope.max = $scope.data[i].value;
	    }

	    // End Controller  
	  });

	})();
</script>

</head>
<body>
<h1>Stock Bar Chart</h1>
<hr>
<div ng-app="graphApp">
  <div ng-controller="graphController as graph">
    <!--bar chart-->
    <h2>Bar Chart</h2>
    <ul class="chart" style="width:{{width}}px; height:{{height}}px;">
      <!-- Labels -->
      <div class="y" style="width:{{height}}px;">{{yAxis}}</div>
      <div class="x">{{xAxis}}</div>
      <!-- Data -->
       <li ng-repeat="bar in data" class="bar" style="height:{{bar.value / max * height}}px; width:{{10}}px; left:{{$index / data.length * 140}}px;"><span>{{bar.label}}:{{bar.value}}</span></li>
       <!-- <li ng-repeat="bar in data" class="bar" style="height:{{bar.value / max * height}}px; width:{{width / data.length - 5}}px; left:{{$index / data.length * width}}px;"><span>{{bar.label}}:{{bar.value}}</span></li> -->
    </ul>
    
  </div>
</div>
</body>
</html>