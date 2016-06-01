'use strict';
(function() {
    angular.module('app')
        .controller('QuestionController', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window) {

              $scope.SendData = function () {



                  $http({
                          method: "post",
                          url: "api/v1/questions",
                          data: {
                              question: {
                                          qst_txt: $scope.question,
                                          a: $scope.a,
                                          b: $scope.b
                                        }
                          }
                      }).success(function(){
                        console.log('s');
                      });



              };
            }
        ]);
}());
