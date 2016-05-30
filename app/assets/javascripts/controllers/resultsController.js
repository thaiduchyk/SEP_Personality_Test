'use strict';
(function() {
    angular.module('app')
        .controller('ResultsController', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window) {

                $scope.EMAIL_REGEXP = /^[_a-zA-Z0-9]+(\.[_a-zA-Z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,10})$/;
                $scope.images = {
                    down: '/assets/down.png'
                };
                $scope.portraits = [{
                    name: 'Maximizer',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente sit aperiam velit quaerat magnam illum nulla tempore aliquam, id, enim sequi doloribus quo consectetur eius quasi, tenetur modi est, similique.'
                }, {
                    name: 'Ideator',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente sit aperiam velit quaerat magnam illum nulla tempore aliquam, id, enim sequi doloribus quo consectetur eius quasi, tenetur modi est, similique.'
                }, {
                    name: 'Strategic',
                    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente sit aperiam velit quaerat magnam illum nulla tempore aliquam, id, enim sequi doloribus quo consectetur eius quasi, tenetur modi est, similique.'
                }];

                $scope.signOutClick = function() {
                    $auth.signOut()
                        .then(function(resp) {
                            $state.go('home');
                        })
                        .catch(function(resp) {
                            $window.alert("error! You are not signed in!");
                        });
                };
            }
        ]);
}());
