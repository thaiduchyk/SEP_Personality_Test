angular.module('ngRoute.config', ['ngRoute'])
.config(function($routeProvider) {
  $routeProvider
  .when('/', {
    controller: 'MainCtrl',
    templateUrl: '/assets/index.html'
  })
  .when('/signup', {
    controller: 'MainCtrl',
    templateUrl: '/assets/template.html'
  })
  .when('/begin', {
    templateUrl: '/assets/begin.html'
  })
  .when('/test', {
    controller: 'TestCtrl',
    templateUrl: '/assets/test.html'
  })
  .otherwise('/');
});
