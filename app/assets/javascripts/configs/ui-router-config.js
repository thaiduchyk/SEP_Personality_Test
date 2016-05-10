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
            .state('start', {
                url: '/start',
                controller: 'TestController',
                templateUrl: 'start.html'
            })
            .state('auth.test', {
                url: '/test',
                controller: 'TestController',
                templateUrl: 'test.html'

            })
            .state('auth.results', {
                url: '/results',
                controller: 'ResultsController',
                templateUrl: 'results.html'
            })
            .state('login_form_test', {
                url: '/login_form_test',
                controller: 'homeController',
                templateUrl: 'login_form_test.html'
            });

            $urlRouterProvider.otherwise('/home');

    }]);


}());
