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
          console.log($auth.validateUser());
          return $auth.validateUser();
        }
      }
    })
    .state('auth.test', {
      url: '/test',
      templateUrl: '/assets/test.html',
      controller: 'TestCtrl'
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
