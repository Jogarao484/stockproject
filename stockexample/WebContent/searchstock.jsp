
<html class="no-js" id="ng-app" ng-app="app">
<!--<![endif]-->
<head>
<title>StockSearchingFeatureDemo using AngularJS</title>
<meta name='viewport' content='width=device-width,initial-scale=1'>
<style>
.angucomplete-dropdown {
	width: 37.5%;
	margin: 0 0 0 142px;
	text-align: left;
}

.large-padded-row {
	text-align: center;
	margin: 0px 0px;
	padding: 90px 10px 250px 10px;
	background-color: rgba(0, 205, 0, 0.7);
}

.body {
	margin: 0px;
	width: 35%;
}

#angucomplete-alt id {
	border: 5px solid blue;
}
</style>
</head>
<body ng-controller="MainController" class="body">
	<div>
		<div class="large-padded-row">

			<div angucomplete-alt id="ex5" placeholder="Search" pause="500"
				selected-object="selectedObject" local-data="data"
				search-fields="name" title-field="name" minlength="3"
				input-class="form-control form-control-small"
				match-class="highlight" force-list-selection="false"></div>
		</div>

	</div>
	<div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/angularjs/1.2.22/angular.min.js"></script>
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/angular.js/1.2.20/angular-touch.min.js"></script>
	<script src="js/all.min.js"></script>
	<script src="js/angular.min.js"></script>
	<script src="js/jquery.min.js"></script>
	<script>
 /*! Copyright (c) 2014 Hidenari Nozaki and contributors | Licensed under the MIT license */
"use strict";angular.module("angucomplete-alt",[]).directive("angucompleteAlt",["$q","$parse","$http","$sce","$timeout",function(a,b,c,d,e){var f=40,g=39,h=38,i=37,j=27,k=13,l=9,m=3,n=500,o=200,p="autocomplete-required",q="Searching...",r="No results found";return{restrict:"EA",require:"^?form",scope:{selectedObject:"=",disableInput:"=",initialValue:"@",localData:"=",remoteUrlRequestFormatter:"=",remoteUrlResponseFormatter:"=",remoteUrlErrorCallback:"=",id:"@",placeholder:"@",remoteUrl:"@",remoteUrlDataField:"@",titleField:"@",descriptionField:"@",imageField:"@",inputClass:"@",pause:"@",searchFields:"@",minlength:"@",matchClass:"@",clearSelected:"@",overrideSuggestions:"@",fieldRequired:"@",fieldRequiredClass:"@",inputChanged:"=",autoMatch:"@",focusOut:"&",focusIn:"&",forceListSelection:"="},template:'<div class="angucomplete-holder" ng-class="{\'angucomplete-dropdown-visible\': showDropdown}">  <input id="{{id}}_value" ng-model="searchStr" ng-disabled="disableInput" type="text" placeholder="{{placeholder}}" ng-focus="onFocusHandler()" class="{{inputClass}}" ng-focus="resetHideResults()" ng-blur="hideResults($event)" autocapitalize="off" autocorrect="off" autocomplete="off" ng-change="inputChangeHandler(searchStr)"/>  <div id="{{id}}_dropdown" class="angucomplete-dropdown" ng-show="showDropdown">    <div class="angucomplete-searching" ng-show="searching" ng-bind="textSearching"></div>    <div class="angucomplete-searching" ng-show="!searching && (!results || results.length == 0)" ng-bind="textNoResults"></div>    <div class="angucomplete-row" ng-repeat="result in results" ng-click="selectResult(result)" ng-mouseenter="hoverRow($index)" ng-class="{\'angucomplete-selected-row\': $index == currentIndex}">      <div ng-if="imageField" class="angucomplete-image-holder">        <img ng-if="result.image && result.image != \'\'" ng-src="{{result.image}}" class="angucomplete-image"/>        <div ng-if="!result.image && result.image != \'\'" class="angucomplete-image-default"></div>      </div>      <div class="angucomplete-title" ng-if="matchClass" ng-bind-html="result.title"></div>      <div class="angucomplete-title" ng-if="!matchClass">{{ result.title }}</div>      <div ng-if="matchClass && result.description && result.description != \'\'" class="angucomplete-description" ng-bind-html="result.description"></div>      <div ng-if="!matchClass && result.description && result.description != \'\'" class="angucomplete-description">{{result.description}}</div>    </div>  </div></div>',link:function(b,s,t,u){function v(a){return a.which?a.which:a.keyCode}function w(a){"function"==typeof b.selectedObject?b.selectedObject(a):b.selectedObject=a,C(a?!0:!1)}function x(a){return function(c){return b[a]?b[a](c):c}}function y(a){w({originalObject:a}),b.clearSelected&&(b.searchStr=null),Q()}function z(a){return b.titleField.split(",").map(function(b){return A(a,b)}).join(" ")}function A(a,b){var c,d;return b?(c=b.split("."),d=a,c.forEach(function(a){d=d[a]})):d=a,d}function B(a,c){var e,f,g=new RegExp(c,"i");if(a)return f=a.match(g),e=f?a.replace(g,'<span class="'+b.matchClass+'">'+f[0]+"</span>"):a,d.trustAsHtml(e)}function C(a){bb=b.searchStr,b.fieldRequired&&u&&u.$setValidity(ab,a)}function D(a){var c=v(a);c!==i&&c!==g&&(c===h||c===k?a.preventDefault():c===f?(a.preventDefault(),!b.showDropdown&&b.searchStr&&b.searchStr.length>=$&&(R(),b.searching=!0,U(b.searchStr))):c===j?(Q(),b.$apply(function(){Z.val(b.searchStr)})):(b.searchStr&&""!==b.searchStr?b.searchStr.length>=$&&(R(),_&&e.cancel(_),b.searching=!0,_=e(function(){U(b.searchStr)},b.pause)):b.showDropdown=!1,bb&&bb!==b.searchStr&&w(void 0)))}function E(a){b.overrideSuggestions&&(b.selectedObject&&b.selectedObject.originalObject===b.searchStr||(a.preventDefault(),y(b.searchStr)))}function F(a){var b=getComputedStyle(a);return a.offsetHeight+parseInt(b.marginTop,10)+parseInt(b.marginBottom,10)}function G(){return db.getBoundingClientRect().top+parseInt(getComputedStyle(db).maxHeight,10)}function H(){return s[0].querySelectorAll(".angucomplete-row")[b.currentIndex]}function I(){return H().getBoundingClientRect().top-(db.getBoundingClientRect().top+parseInt(getComputedStyle(db).paddingTop,10))}function J(a){db.scrollTop=db.scrollTop+a}function K(){var a=b.results[b.currentIndex];Z.val(b.matchClass?z(a.originalObject):a.title)}function L(a){var c=v(a),d=null,e=null;c===k&&b.results?(b.currentIndex>=0&&b.currentIndex<b.results.length?(a.preventDefault(),b.selectResult(b.results[b.currentIndex])):(E(a),Q()),b.$apply()):c===f&&b.results?(a.preventDefault(),b.currentIndex+1<b.results.length&&b.showDropdown&&(b.$apply(function(){b.currentIndex++,K()}),eb&&(d=H(),G()<d.getBoundingClientRect().bottom&&J(F(d))))):c===h&&b.results?(a.preventDefault(),b.currentIndex>=1?(b.$apply(function(){b.currentIndex--,K()}),eb&&(e=I(),0>e&&J(e-1))):0===b.currentIndex&&b.$apply(function(){b.currentIndex=-1,Z.val(b.searchStr)})):c===l&&b.results&&b.results.length>0&&b.showDropdown&&(b.selectResult(-1===b.currentIndex?b.results[0]:b.results[b.currentIndex]),b.$apply())}function M(a){return function(c){b.searching=!1,V(A(X(c),b.remoteUrlDataField),a)}}function N(a,c,d,e){0!==c&&(b.remoteUrlErrorCallback?b.remoteUrlErrorCallback(a,c,d,e):console&&console.error&&console.error("http error"))}function O(){cb&&cb.resolve()}function P(d){var e={},f=b.remoteUrl+d;b.remoteUrlRequestFormatter&&(e={params:b.remoteUrlRequestFormatter(d)},f=b.remoteUrl),O(),cb=a.defer(),e.timeout=cb.promise,c.get(f,e).success(M(d)).error(N)}function Q(){b.showDropdown=!1,b.results=[],db&&(db.scrollTop=0)}function R(){b.showDropdown=!0,b.currentIndex=-1,b.results=[]}function S(a){var c,d,e,f,g=b.searchFields.split(","),h=[];for(c=0;c<b.localData.length;c++){for(d=!1,e=0;e<g.length;e++)f=A(b.localData[c],g[e])||"",d=d||f.toLowerCase().indexOf(a.toLowerCase())>=0;d&&(h[h.length]=b.localData[c])}b.searching=!1,V(h,a)}function T(a,c,d){for(var e in c)if(c[e].toLowerCase()===d.toLowerCase())return void b.selectResult(a)}function U(a){a.length<$||(b.localData?b.$apply(function(){S(a)}):P(a))}function V(a,c){var d,e,f,g,h,i;if(a&&a.length>0)for(b.results=[],d=0;d<a.length;d++)b.titleField&&""!==b.titleField&&(g=h=z(a[d])),e="",b.descriptionField&&(e=i=A(a[d],b.descriptionField)),f="",b.imageField&&(f=A(a[d],b.imageField)),b.matchClass&&(h=B(g,c),i=B(e,c)),b.results[b.results.length]={title:h,description:i,image:f,originalObject:a[d]},b.autoMatch&&T(b.results[b.results.length-1],{title:g,desc:e||""},b.searchStr);else b.results=[]}var W,X,Y,Z=s.find("input"),$=m,_=null,ab=p,bb=null,cb=null,db=s[0].querySelector(".angucomplete-dropdown"),eb=!1,fb=null;s.on("mousedown",function(a){fb=a.target.id}),b.currentIndex=null,b.searching=!1,b.searchStr=b.initialValue,Y=b.$watch("initialValue",function(a){a&&a.length>0&&(b.searchStr=b.initialValue,C(!0),Y())}),b.$on("angucomplete-alt:clearInput",function(a,c){c?b.id===c&&(b.searchStr=null,Q()):(b.searchStr=null,Q())}),b.onFocusHandler=function(){b.focusIn&&b.focusIn()},b.hideResults=function(){b.forceListSelection?b.searchStr="":(!b.selectedObject||b.selectedObject&&/^\s*$/.test(b.selectedObject.title))&&(b.selectedObject={title:b.searchStr,description:"",image:"",originalObject:{name:b.searchStr}},w(b.selectedObject)),fb===b.id+"_dropdown"?fb=null:(W=e(function(){Q(),b.$apply(function(){Z.val(b.searchStr)})},o),O(),b.focusOut&&b.focusOut())},b.resetHideResults=function(){W&&e.cancel(W)},b.hoverRow=function(a){b.currentIndex=a},b.selectResult=function(a){b.matchClass&&(a.title=z(a.originalObject),a.description=A(a.originalObject,b.descriptionField)),b.searchStr=b.clearSelected?null:a.title,w(a),Q()},b.inputChangeHandler=function(a){return a.length<$&&Q(),b.inputChanged&&(a=b.inputChanged(a)),a},b.fieldRequiredClass&&""!==b.fieldRequiredClass&&(ab=b.fieldRequiredClass),b.minlength&&""!==b.minlength&&($=b.minlength),b.pause||(b.pause=n),b.clearSelected||(b.clearSelected=!1),b.overrideSuggestions||(b.overrideSuggestions=!1),b.fieldRequired&&u&&C(b.initialValue?!0:!1),b.textSearching=t.textSearching?t.textSearching:q,b.textNoResults=t.textNoResults?t.textNoResults:r,Z.on("keydown",L),Z.on("keyup",D),X=x("remoteUrlResponseFormatter"),b.$on("$destroy",function(){C(!0)}),e(function(){var a=getComputedStyle(db);eb=a.maxHeight&&"auto"===a.overflowY})}}}]);       
      </script>
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
	</div>
</body>
</html>