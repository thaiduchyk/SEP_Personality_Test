angular.module('controllers', ['ngDialog', 'rzModule'])
.controller('MainCtrl', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog',
function($rootScope, $scope, $auth, $http, $state, ngDialog) {

  $scope.images = {fb: '/assets/fb.png',
                   in: '/assets/in.png',
                 mail: '/assets/mail.png',};

  $scope.formData = {};
  $scope.formValidation = {};
  $scope.formValidation.valid = false;
  $scope.signInData = {};
  $scope.errorMessage = "";
  $rootScope.userInfo = {};

  $scope.clearErrorMessage = function() {
    $scope.errorMessage = "";
  };

  $scope.clickToOpen = function(template) {
    ngDialog.open({ template: '/assets/'+template+'.html', className: 'ngdialog-theme-default', scope: $scope });
    $scope.tab=1;
  };

  $rootScope.$on('auth:login-success', function(ev, user) {
    $state.go('auth.start');
    // alert('Welcome ', user.email);
});

  $scope.authSocial = function(networkName) {
    $auth.authenticate(networkName)
    .then(function(resp) {
      console.log("success");
      // $state.go('auth.start');
    })
    .catch(function(resp) {
      console.log("error");
    });
  };

  $scope.selectTab = function(setTab) {
    $scope.tab = setTab;
  };
  $scope.isSelected = function(checkTab) {
    return $scope.tab === checkTab;
  };
  // $rootScope.$on('auth:login-success', function(ev, user) {
  //   console.log(user.name+' '+user.surname);
  //   alert('Welcome ' + user.name);
  // });
  $scope.authSignin = function() {
    $auth.submitLogin($scope.signInData)
    .then(function(resp){
      $rootScope.userInfo.name = resp.name;
      $rootScope.userInfo.surname = resp.surname;
      ngDialog.close();
      // $state.go('auth.start');
    })
    .catch(function(resp){
      $scope.errorMessage = "Incorrect login";
    });
  };
  // $scope.authSignin = function() {
  //   $http({
  //     method  : 'POST',
  //     url     : '/api/docs/auth/sign_in',
  //     data    : $.param($scope.signInData),  // pass in data as strings
  //     headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
  //   })
  //   .then(function(response) {
  //     console.log(response.headers());
  //     // ngDialog.close();
  //     // $location.path('/test');
  //
  //   }, function(response) {
  //     $scope.errorMessage = "Incorrect login";
  //   });
  // };
  $scope.comparePasswords = function() {
     return $scope.formData.password == $scope.formData.password_confirmation;
  };

  $scope.isFormValid = function(){
    return ($scope.formValidation.valid && $scope.comparePasswords());
  };

  $scope.processForm = function() {
    // var signupData = {
    //   name: $scope.formData.name,
    //   surname: $scope.formData.surname,
    //   email: $scope.formData.email,
    //   password: $scope.formData.password,
    //   password_confirmation: $scope.formData.password_confirmation
    //   };
    $auth.submitRegistration($scope.formData)
    .then(function(resp){
      $rootScope.userInfo.name = resp.name;
      $rootScope.userInfo.surname = resp.surname;
      console.log("success");
      ngDialog.close();
      $state.go('auth.start');
    })
    .catch(function(resp){
      console.log("registration error");
    });
    // $http({
    //   method  : 'POST',
    //   url     : '/api/docs/auth',
    //   data    : $.param(signupData),  // pass in data as strings
    //   headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
    // })
    // .success(function(data) {
    //   console.log(data.data);
    // })
    // .error(function(error){
    //   console.log("error");
    // });
  };
}])
.controller('TestCtrl', [
  '$scope', '$rootScope', '$auth', '$http', '$state', '$timeout', '$uibModal',
  function($scope, $rootScope, $auth, $http, $state, $timeout, $uibModal){

    $rootScope.resultsArray = [];
    $scope.name = $rootScope.userInfo.name;
    // $scope.surname = $rootScope.userInfo.surname;
    $scope.count = 1;
    $scope.buttonText = "Next";
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
    $scope.testInProgress = true;

    $scope.nextQuestion = function(){
      var item = {
        question: $scope.question,
        value: $scope.minSlider.value
      };
      $rootScope.resultsArray.push(item);
      if ($scope.testInProgress) {
        $scope.minSlider.value = 0;
        $scope.question = $scope.array[$scope.count];
        $scope.count += 1;
        if ($scope.count == $scope.array.length) {
          $scope.buttonText = "Finish";
          $scope.testInProgress = false;
        };
      } else {
        $state.go('auth.results');
      };

    };

    $scope.getQuestions = function() {
      $http({
        method  : 'GET',
        url     : 'api/v1/questions'
        // headers : { 'Content-Type': 'application/x-www-form-urlencoded' }  // set the headers so angular passing info as form data (not request payload)
      })
      .success(function(data) {
        console.log(data);
      })
      .error(function(error){
        console.log("error");
      });
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

    // Minimal slider config
    $scope.minSlider = {
      value: 0,
      options: {
        floor: -50,
        ceil: 50
      }
    };
  }])
  .controller('ResultsCtrl', [
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
