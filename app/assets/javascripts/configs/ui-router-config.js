'use strict';
(function() {
    angular.module('app')
        .config(['$stateProvider', '$locationProvider', '$urlRouterProvider',
            function($stateProvider, $locationProvider, $urlRouterProvider) {
        // debugger;
            $stateProvider
            .state('home', {

                url: '/home',
                controller: 'HomeController',
                templateUrl: 'index.html'
                //content: {
                //    template: '<h1>hello</h1>',
                //    controller: 'homeController as homeCtrl'
                //}
            })
            .state('question', {

                url: '/question',
                controller: 'QuestionController',
                templateUrl: 'questionActions.html'
            })
            .state('auth', {
                url: '/auth',
                abstract: true,
                template: '<ui-view/>',
                resolve: {
                    auth: function($auth) {
                        return $auth.validateUser();
                    }
                }
            })
            .state('auth.start', {
                url: '/start',
                controller: 'HomeController',
                templateUrl: 'auth/start.html'
            })
            .state('auth.test', {
                url: '/test',
                controller: 'TestController',
                templateUrl: 'auth/test.html',
                resolve: {
                  question: function($q, $http) {
                    var deferred = $q.defer();
                    $http({
                      method: 'GET',
                      url: '/api/v1/questions'
                    }).then(function successCallback(response) {
                        deferred.resolve(response.data.data);
                      }, function errorCallback(response) {
                        console.log('error');
                      });
                      return deferred.promise;

                  }
                }

            })
            .state('auth.results', {
                url: '/results',
                controller: 'ResultsController',
                templateUrl: 'auth/results.html'
            });

            $urlRouterProvider.otherwise('/home');

    }]);


}());
