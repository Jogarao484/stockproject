<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chart111</title>
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript" src="js/d3.v3.min.js"></script>
<style type="text/css">
body {
  text-align:center;
}

// Chart set up

@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,700);

body {
  font-family: "Open Sans", Arial;
  background: #EDEDED;
}
main {
  width: 500px;
  margin: 10px auto;
  padding: 10px 20px 30px;
  background: #FFF;
  box-shadow: 0 3px 5px rgba(0,0,0,0.2);
}
p {
  margin-top: 2rem;
  font-size: 13px;
}
#bar-chart {
  width: 500px;
  height: 300px;
  position: relative;
}
#line-chart {
  width: 500px;
  height: 300px;
  position: relative;
}
#bar-chart::before, #line-chart::before {
  content: "";
  position: absolute;
  display: block;
  width: 220px;
  height: 30px;
  left: 165px;
  top: 254px;
  background: #FAFAFA;
  box-shadow: 1px 1px 0 0 #DDD;
}
#pie-chart {
  width: 500px;
  height: 250px;
  position: relative;
}
#pie-chart::before {
  content: "";
  position: absolute;
  display: block;
  width: 120px;
  height: 115px;
  left: 315px;
  top: 0;
  background: #FAFAFA;
  box-shadow: 1px 1px 0 0 #DDD;
}
#pie-chart::after {
  content: "";
  position: absolute;
  display: block;
  top: 260px;
  left: 70px;
  width: 170px;
  height: 2px;
  background: rgba(0,0,0,0.1);
  border-radius: 50%;
  box-shadow: 0 0 3px 4px rgba(0,0,0,0.1);
}
</style>

<script type="text/javascript">
(function(){

	  var app = angular.module('graphApp',[]);
	  
	  app.controller('graphController', function($scope){
	    
	    // Options
	    
	    $scope.width = 600;
	    $scope.height = 350;
	    $scope.yAxis = 'Sales';
	    $scope.xAxis = '2014';
	    
	    // Data 

	    $scope.data = [
	      {
	      label: 'January',
	      value: 36
	      },
	      {
	      label: 'February',
	      value: 54
	      },
	      {
	      label: 'March',
	      value: 62
	      },
	      {
	      label: 'April',
	      value: 82
	      },
	      {
	      label: 'May',
	      value: 96
	      },
	      {
	      label: 'June',
	      value: 104
	      },
	      {
	      label: 'July',
	      value: 122
	      },
	      {
	      label: 'August',
	      value: 152
	      },
	      {
	      label: 'September',
	      value: 176
	      },
	      {
	      label: 'October',
	      value: 180
	      },
	      {
	      label: 'November',
	      value: 252
	      },
	      {
	      label: 'December',
	      value: 342
	      }
	    ];
	    
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
	<h1>AngularJS Data Visualisation Tutorial Examples - Bar Chart</h1>
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
       <li ng-repeat="bar in data" class="bar" style="height:{{bar.value / max * height}}px; width:{{width / data.length - 5}}px; left:{{$index / data.length * width}}px;"><span>{{bar.label}}:{{bar.value}}</span></li>
    </ul>    
  </div>
</div>
</body>
</html>