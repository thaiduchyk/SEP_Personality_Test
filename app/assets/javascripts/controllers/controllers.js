angular.module('controllers', ['ngDialog', 'rzModule', 'ng-token-auth'])
.controller('MainCtrl', ['$rootScope', '$scope', '$http', '$location', 'ngDialog',
function($rootScope, $scope, $http, $location, ngDialog) {

  $scope.images = {fb: '/assets/fb.png',
                   in: '/assets/in.png',
                 mail: '/assets/mail.png',};

  $scope.formData = {};
  $scope.signInData = {};
  $scope.errorMessage = "";

  $scope.clearErrorMessage = function() {
    $scope.errorMessage = "";
  };

  $scope.clickToOpen = function(template) {
    ngDialog.open({ template: '/assets/'+template+'.html', className: 'ngdialog-theme-default', scope: $scope });
    $scope.tab=1;
  };
  $scope.selectTab = function(setTab) {
    $scope.tab = setTab;
  };
  $scope.isSelected = function(checkTab) {
    return $scope.tab === checkTab;
  };
  $scope.userSignin = function() {
    // localStorage.setItem("email", $scope.signInData.email);
    // localStorage.setItem("pass", $scope.signInData.password);
    $http({
      method  : 'POST',
      url     : '/api/v1/auth/sign_in',
      data    : $.param($scope.signInData),  // pass in data as strings
      headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
    })
    .then(function(response) {
      // console.log("success");
      localStorage.setItem("name", response.data.data.name);
      localStorage.setItem("surname", response.data.data.surname);
      // if not successful, bind errors to error variables
      console.log(response.headers('x-request-id'));
      ngDialog.close();
      $location.path('/begin');

    }, function(response) {
      $scope.errorMessage = "Incorrect login";
    });
  };
  // $scope.gotoBegin = function() {
  //   if (($scope.testLogin.username === 'test') && ($scope.testLogin.password='test')) {
  //     ngDialog.close();
  //     $location.path('/begin');
  //   }
  // };
  $scope.processForm = function() {
    $http({
      method  : 'POST',
      url     : '/api/v1/auth',
      data    : $.param($scope.formData),  // pass in data as strings
      headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
    })
    .success(function(data) {
      console.log(data.data);
    })
    .error(function(error){
      console.log("error");
    });
  };
}])
.controller('TestCtrl', [
  '$scope', '$rootScope', '$timeout', '$uibModal',
  function($scope, $rootScope, $timeout, $uibModal){
    $scope.count = 0;
    $scope.name = localStorage.getItem('name');
    $scope.surname = localStorage.getItem('surname');
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
