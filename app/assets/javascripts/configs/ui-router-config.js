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
                templateUrl: 'auth/test.html'

            })
            .state('auth.results', {
                url: '/results',
                controller: 'ResultsController',
                templateUrl: 'results.html'
            });

            $urlRouterProvider.otherwise('/home');

    }]);


}());
