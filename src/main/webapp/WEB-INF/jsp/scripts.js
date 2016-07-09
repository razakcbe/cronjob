var app = angular.module('cronpage', ['ngRoute']);
//var basicurl = "https://asianstock.herokuapp.com/product";
var basicurl = "http://localhost:8080/product";


app.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/minutes', {
            templateUrl: 'minutespage',
            controller: 'minuteController'
        }).
         when('/hourly', {
            templateUrl: 'hourlypage',
            controller: 'hourlyController'
        }).
          when('/daily', {
            templateUrl: 'dailypage',
            controller: 'dailyController'
        }).
         when('/weekly', {
            templateUrl: 'weeklypage',
            controller: 'weeklyController'
        }).
          when('/monthly', {
            templateUrl: 'monthlypage',
            controller: 'monthlyController'
        }).
           when('/', {
            templateUrl: 'minutespage',
            controller: 'minuteController'
        }).
        otherwise({
            redirectTo: '/'
        });;
    }
]);

app.controller("minuteController", function($scope, $http, $location) {
    $scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.jobname = "abdul";
        $scope.mycronvo.minutes = "1";
        $scope.mycronvo.tabindex = "1";
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
                alert("success");
            })
            .error(function(data, status, header, config) {
            	alert(data);
            	alert("error");
            });
    };
});

app.controller("hourlyController", function($scope, $http, $log, $location) {

});
app.controller("dailyController", function($scope, $http, $log, $location) {

});
app.controller("weeklyController", function($scope, $http, $log, $location) {
  
});
app.controller("monthlyController", function($scope, $http, $log, $location) {
   
});
