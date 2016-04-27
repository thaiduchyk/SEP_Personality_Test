'use strict';
(function() {
    angular.module('app')
        .controller('ResultsController', [
            '$scope', '$rootScope', '$auth', '$state',
            function($scope, $rootScope, $auth, $state){

                console.log($auth.validateUser());

                $scope.retakeTest = function(){
                    $state.go('auth.test');
                };

                $scope.authSignOut = function() {
                    // console.log("Signing out...");
                    // console.log($auth.validateUser());
                    $auth.signOut()
                        .then(function(resp) {
                            console.log("Signed out succesfully");
                            $state.go('home');
                        })
                        .catch(function(resp) {
                            console.log("Sign out error");
                        });
                };

        }]);
}());

