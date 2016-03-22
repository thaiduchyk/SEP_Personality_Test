angular.module('controllers', ['ngDialog', 'rzModule'])
.controller('MainCtrl', ['$rootScope', '$scope', '$auth', '$http', '$location', 'ngDialog',
function($rootScope, $scope, $auth, $http, $location, ngDialog) {

  $scope.images = {fb: '/assets/fb.png',
                   in: '/assets/in.png',
                 mail: '/assets/mail.png',};

  $scope.formData = {};
  $scope.formData.valid = false;
  $scope.signInData = {};
  $scope.errorMessage = "";


  $scope.clearErrorMessage = function() {
    $scope.errorMessage = "";
  };

  $scope.clickToOpen = function(template) {
    ngDialog.open({ template: '/assets/'+template+'.html', className: 'ngdialog-theme-default', scope: $scope });
    $scope.tab=1;
  };

  // $scope.$watch('signupForm.$valid', function(newVal) {
  //   console.log("changed");
  // });


  $scope.selectTab = function(setTab) {
    $scope.tab = setTab;
  };
  $scope.isSelected = function(checkTab) {
    return $scope.tab === checkTab;
  };
  $scope.authSignin = function() {
    $auth.submitLogin($scope.signInData)
    .then(function(resp){
      ngDialog.close();
      $location.path('/test');
    })
    .catch(function(resp){
      console.log("auth login failed");
    });
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
      $location.path('/test');

    }, function(response) {
      $scope.errorMessage = "Incorrect login";
    });
  };
  $scope.comparePasswords = function() {
    // console.log($scope.formData.signupForm);
     return $scope.formData.password == $scope.formData.password_confirmation;
  };

  $scope.isFormValid = function(){
    return ($scope.formData.valid && $scope.comparePasswords());
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
  '$scope', '$rootScope', '$auth', '$timeout', '$uibModal',
  function($scope, $rootScope, $auth, $timeout, $uibModal){

    $scope.startButtonText = "Start";
    $scope.resultsVisible = false;
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
    $scope.question = $scope.array[0];

    $scope.authSignOut = function() {
      console.log("Signing out...");
      $auth.signOut()
      .then(function(resp) {
        console.log("Signed out succesfully");
      })
      .catch(function(resp) {
        console.log("Sign out error");
      });
    };

    $scope.startTest = function() {
      $scope.count = 1;
      $scope.question = $scope.array[0];
      $scope.resultsArray = [];
      $scope.testVisible = true;
      $scope.minSlider.value = 4;
      $scope.count = 1;
      $scope.testInProgress = true;
      $scope.resultsVisible = false;
      $scope.buttonText = "Next";
    };

    $scope.nextQuestion = function(){
      var item = {
        question: $scope.question,
        value: $scope.minSlider.value
      };
      $scope.resultsArray.push(item);
      if ($scope.testInProgress) {
        $scope.minSlider.value = 4;
        $scope.question = $scope.array[$scope.count];
        $scope.count += 1;
        if ($scope.count == $scope.array.length) {
          $scope.buttonText = "Finish";
          $scope.testInProgress = false;
        };
      } else {
        $scope.testVisible = false;
        $scope.resultsVisible = true;
        $scope.startButtonText = "Restart";
      };

    };
    // Minimal slider config
    $scope.minSlider = {
      value: 8
    };
  }]);
