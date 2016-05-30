'use strict';
(function() {
    angular.module('app')
        .controller('ResultsController', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window) {

              $scope.images = {
                  down: '/assets/down.png'
              };
                $scope.retakeTest = function(){
                    $state.go('auth.test');
                };

                $scope.signOutClick = function() {
                    $auth.signOut()
                        .then(function(resp) {
                            $state.go('home');
                        })
                        .catch(function(resp) {
                            $window.alert("error! You are not signed in!");
                        });
                };
        }]);
}());
