angular.module('ui-router.config', ['ui.router'])
.config([
  '$stateProvider',
  '$locationProvider',
  '$urlRouterProvider',
  function($stateProvider, $locationProvider, $urlRouterProvider) {
    $stateProvider
    .state('home', {
      url: '/',
      templateUrl: '/assets/index.html',
      controller: 'MainCtrl'
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
      templateUrl: '/assets/start.html',
      controller: 'TestCtrl'
    })
    .state('auth.test', {
      url: '/test',
      templateUrl: '/assets/test.html',
      controller: 'TestCtrl'
    })
    .state('auth.results', {
      url: '/results',
      templateUrl: '/assets/results.html',
      controller: 'ResultsCtrl'
    });
    $urlRouterProvider.otherwise('/');
    // $urlRouterProvider.deferIntercept();
    $locationProvider.html5Mode(false);
  }]);
  // .run(function($rootScope, $urlRouter){
  //   $urlRouter.sync();
  //   $urlRouter.listen();
  // });
