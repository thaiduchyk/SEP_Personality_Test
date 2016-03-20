angular.module('ui-router.config', ['ui.router'])
.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {
    $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: '/assets/index.html',
      controller: 'MainCtrl'
    })
    .state('signup', {
      url: '/signup',
      templateUrl: '/assets/template.html',
      controller: 'MainCtrl'
    })
    .state('begin', {
      url: '/begin',
      templateUrl: '/assets/begin.html',
      controller: 'TestCtrl'
    })
    .state('test', {
      url: '/test',
      templateUrl: '/assets/test.html',
      controller: 'TestCtrl'
    });
    $urlRouterProvider.otherwise('home');
  }]);
