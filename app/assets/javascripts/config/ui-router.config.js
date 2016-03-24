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
    // .state('signup', {
    //   url: '/signup',
    //   templateUrl: '/assets/template.html',
    //   controller: 'MainCtrl'
    // })
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
      templateUrl: '/assets/start.html',
      controller: 'TestCtrl',
      resolve: {
        auth: function($auth) {
          return $auth.validateUser();
        }
      }
    })
    .state('test', {
      url: '/test',
      templateUrl: '/assets/test.html',
      controller: 'TestCtrl',
      resolve: {
        auth: function($auth) {
          return $auth.validateUser();
        }
      }
    })
    .state('results', {
      url: '/results',
      templateUrl: '/assets/results.html',
      controller: 'ResultsCtrl',
      resolve: {
        auth: function($auth) {
          return $auth.validateUser();
        }
      }
    });
    // .state('begin', {
    //   url: '/begin',
    //   templateUrl: '/assets/begin.html',
    //   controller: 'TestCtrl'
    // })
    // .state('test', {
    //   url: '/test',
    //   templateUrl: '/assets/test.html',
    //   controller: 'TestCtrl'
    // });
    $urlRouterProvider.otherwise('home');
  }]);
