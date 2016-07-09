var app = angular.module('cronpage', ['ngRoute','checklist-model']);
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
        when('/', {
            templateUrl: 'jobpage',
            controller: 'jobController'
        }).
        otherwise({
            redirectTo: '/'
        });;
    }
]);

app.controller("minuteController", function($scope, $http, $location) {
    $scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.tabindex = 1;
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        //alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
            })
            .error(function(data, status, header, config) {
            	$location.url('/minutes');
            });
    };
});

app.controller("hourlyController", function($scope, $http, $log, $location) {
	$scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.tabindex = 2;
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        //alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
            })
            .error(function(data, status, header, config) {
            	$location.url('/minutes');
            });
    };
});
app.controller("dailyController", function($scope, $http, $log, $location) {
	$scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.tabindex = 3;
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        //alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
            })
            .error(function(data, status, header, config) {
            });
    };
});
app.controller("weeklyController", function($scope, $http, $log, $location) {
	$scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.tabindex = 6;
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        //alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
            })
            .error(function(data, status, header, config) {
            });
    };
});
app.controller("monthlyController", function($scope, $http, $log, $location) {
	$scope.schedule = function() {
        var url = "http://localhost:8080/cron/start";
        $scope.mycronvo.tabindex = 5;
        var data = angular.toJson($scope.mycronvo);
        var config = {
            headers: {
                'Content-Type': 'application/json'
            }
        }
        //alert(data);
        $http.post(url, data, config)
            .success(function(data, status, headers, config) {
            })
            .error(function(data, status, header, config) {
            });
    };
});

app.controller("jobController", function($scope, $http, $log, $location) {
    $http.get("http://localhost:8080/cron/all").then(function(response) {
        $scope.jobdetails = response.data;
    });
});
