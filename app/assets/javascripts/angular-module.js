(function() {
  'use strict';
  angular.module('personality_test', ['ngRoute', 'ngDialog', 'rzModule','ui.bootstrap'])
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
  })
  .controller('MainCtrl', [
    '$scope', '$location', 'ngDialog',
    function($scope, $location, ngDialog){
      $scope.images = {fb: '/assets/fb.png',
                       in: '/assets/in.png',
                     mail: '/assets/mail.png',};

      $scope.clickToOpen = function() {
        ngDialog.open({ template: '/assets/template.html', className: 'ngdialog-theme-default', scope: $scope });
        $scope.tab=1;
        $scope.testLogin={};
      };
      $scope.selectTab = function(setTab) {
        $scope.tab = setTab;
      };
      $scope.isSelected = function(checkTab) {
        return $scope.tab === checkTab;
      };
      $scope.gotoBegin = function() {
        if (($scope.testLogin.username === 'test') && ($scope.testLogin.password='test')) {
          ngDialog.close();
          $location.path('/begin');
        }
      };
    }])
    .controller('TestCtrl', [
      '$scope', '$rootScope', '$timeout', '$uibModal',
      function($scope, $rootScope, $timeout, $uibModal){
        $scope.count = 0;
        $scope.array = ["You believe most people have a short attention span",
        "You are interested in people histories",
        "You always root for the underdog",
        "You like to figure out the best way to get things done",
        "You like to talk about things everyone can agree on",
        "No one can tell you what to think, you decide",
        "You rack up points for your daily score",
        "You find a wide variety of things very interesting",
        "Your faith sustains you",
        "You intuitively see the perspectives of others",
        "You feel being a focused expert is better than a broad generalist"];
        $scope.nextQuestion = function(){
          $scope.count += 1;
          if ($scope.count > 10) {
            $scope.count = 0;
          }
          $scope.question = $scope.array[$scope.count];
        };
        $scope.question = $scope.array[0];
        // Minimal slider config
        $scope.minSlider = {
          value: 8
        };
      }]);
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
