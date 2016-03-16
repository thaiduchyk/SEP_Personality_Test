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
    controller: 'TestCtrl',
    templateUrl: '/assets/begin.html'
  })
  .when('/test', {
    controller: 'TestCtrl',
    templateUrl: '/assets/test.html'
  })
  .otherwise('/');
});

// using ui-router:
// .config([
//   '$stateProvider',
//   '$urlRouterProvider',
//   function($stateProvider, $urlRouterProvider) {
//     $stateProvider
//     .state('home', {
//       url: '/home',
//       templateUrl: '/home.html',
//       controller: 'MainCtrl'
//     });
//     $urlRouterProvider.otherwise('home');
//   }])
