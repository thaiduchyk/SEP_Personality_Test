(function() {
    'use strict';
    angular.module('app')
        .controller('TestController', [
            '$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window', '$timeout', '$uibModal', 'question',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window, $timeout, $uibModal, question) {

                $scope.array = [];
                // console.log(question);
                for(var i = 0; i < question.length; i++){
                  $scope.array.push(question[i]);
                }
                console.log($scope.array);

                $rootScope.resultsArray = [];
                $scope.count = 1;
                $scope.buttonText = "Next";

                $scope.question = $scope.array[0]['qst_txt'];
                $scope.a = $scope.array[0]['a'];
                $scope.b = $scope.array[0]['b'];
                $scope.testInProgress = true;

                $scope.nextQuestion = function() {
                    var item = {
                        question: $scope.question,
                        a: $scope.a,
                        b: $scope.b,
                        value: $scope.minSlider.value
                    };
                    $rootScope.resultsArray.push(item);
                    if ($scope.testInProgress) {
                        $scope.minSlider.value = 0;
                        $scope.question = $scope.array[$scope.count]['qst_txt'];
                        $scope.a = $scope.array[$scope.count]['a'];
                        $scope.b = $scope.array[$scope.count]['b'];
                        $scope.count += 1;
                        if ($scope.count == $scope.array.length) {
                            $scope.buttonText = "Finish";
                            $scope.testInProgress = false;
                        };
                    } else {
                        $state.go('auth.results');
                    };

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
                // Minimal slider config
                $scope.minSlider = {
                    value: 0,
                    options: {
                        floor: -50,
                        ceil: 50
                    }
                };
            }
        ]);
}());
