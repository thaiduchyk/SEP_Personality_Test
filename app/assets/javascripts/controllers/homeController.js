(function() {
    'use strict';
    angular.module('app')
    .controller('HomeController', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog',
        function($rootScope, $scope, $auth, $http, $state, ngDialog) {
            // debugger;
            $scope.images = {fb: '/assets/fb.png',
                             in: '/assets/in.png',
                             mail: '/assets/mail.png',};

            $scope.formData = {};
            $scope.formValidation = {};
            $scope.formValidation.valid = false;
            $scope.signInData = {};
            $scope.errorMessage = "";
            $rootScope.userInfo = {};

            // $scope.clearErrorMessage = function() {
            //     $scope.errorMessage = "";
            // };
            //
            // $scope.clickToOpen = function(template) {
            //     ngDialog.open({ template: '/assets/'+template+'.html', className: 'ngdialog-theme-default', scope: $scope });
            //     $scope.tab=1;
            // };
            //
            // $scope.selectTab = function(setTab) {
            //     $scope.tab = setTab;
            // };
            // $scope.isSelected = function(checkTab) {
            //     return $scope.tab === checkTab;
            // };
            // // $rootScope.$on('auth:login-success', function(ev, user) {
            // //   console.log(user.name+' '+user.surname);
            // //   alert('Welcome ' + user.name);
            // // });
            // $scope.authSignin = function() {
            //     $auth.submitLogin($scope.signInData)
            //         .then(function(resp){
            //             $rootScope.userInfo.name = resp.name;
            //             $rootScope.userInfo.surname = resp.surname;
            //             ngDialog.close();
            //             $state.go('auth.start');
            //         })
            //         .catch(function(resp){
            //             $scope.errorMessage = "Incorrect login";
            //         });
            // };
            //
            // $scope.comparePasswords = function() {
            //     return $scope.formData.password == $scope.formData.password_confirmation;
            // };
            //
            // $scope.isFormValid = function(){
            //     return ($scope.formValidation.valid && $scope.comparePasswords());
            // };

            // $scope.processForm = function() {
            //     $auth.submitRegistration($scope.formData)
            //         .then(function(resp){
            //             $rootScope.userInfo.name = resp.name;
            //             $rootScope.userInfo.surname = resp.surname;
            //             console.log("success");
            //             ngDialog.close();
            //             $state.go('auth.start');
            //         })
            //         .catch(function(resp){
            //             console.log("registration error");
            //         });
            // };
        }]);





}());
