(function() {
    'use strict';
    angular.module('app')
        .controller('FriendsTestController', [
            '$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window', '$timeout', '$uibModal', 'question',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window, $timeout, $uibModal, question) {

                $scope.array = [];
                // console.log(question);
                for(var i = 0; i < question.length; i++){
                  $scope.array.push(question[i]);
                }

                $rootScope.resultsArray = [];
                $scope.count = 1;
                $scope.buttonText = "Next";

                $scope.question = $scope.array[0]['qst_txt'];
                $scope.a = $scope.array[0]['a'];
                $scope.b = $scope.array[0]['b'];
                $scope.testInProgress = true;

                $scope.toResultsArr = function(value, arr){
                      var a, b;
                      if(value < 0){
                        a = -value;
                        b = 0;
                        }
                      else if(value > 0){
                        a = 0;
                        b = value;
                        }
                      else if(value == 0){
                        a = 0;
                        b = 0;
                        }
                      var object = {
                        'a': a,
                        'b': b
                        };
                      arr.push(object);
                }

                $scope.toObject = function(arr){
                  var obj = {};
                  for(var i = 0; i < arr.length; i++){
                    obj[i+1] = arr[i];
                  }
                  return obj;
                }

                $scope.SendData = function (object) {
                    $http({
                            method: "post",
                            url: "/api/v1/own_results",
                            data: object
                        }).success(function(resp){
                      // debugger;
                          console.log('good request');
                        }).error(function(data){
                      // debugger;
                        });
                };

                $scope.nextQuestion = function() {
                    var item = {
                        question: $scope.question,
                        a: $scope.a,
                        b: $scope.b,
                        value: $scope.minSlider.value
                    };
                    // $rootScope.resultsArray.push(item);
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

                        $scope.toResultsArr(item.value, $rootScope.resultsArray);

                      }
                    else {
                        $scope.toResultsArr(item.value, $rootScope.resultsArray);
                        $rootScope.resultsObject = $scope.toObject($rootScope.resultsArray);
                        console.log(JSON.stringify($rootScope.resultsObject));
                        $scope.SendData($rootScope.resultsObject);

                        // $state.go('auth.results');
                    };

                };
                $scope.signOutClick = function() {
                    $auth.signOut()
                        .then(function(resp) {
                            $state.go('home');
                        })
                        .catch(function(resp) {
                        });
                };
                // Minimal slider config
                $scope.minSlider = {
                    value: 0,
                    options: {
                        floor: -10,
                        ceil: 10
                    }
                };
            }
        ]);
}());
