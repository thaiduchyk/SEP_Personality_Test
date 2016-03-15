(function() {
  'use strict';
  angular.module('personality_test', [
    'ngRoute.config',
    'ngDialog',
    'controllers',
    'rzModule',
    'ui.bootstrap'])
  }());


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
