(function() {
    'use strict';
    angular.module('app')
        .controller('HomeController', ['$rootScope', '$scope', '$auth', '$http', '$state', 'ngDialog', '$location', '$window',
            function($rootScope, $scope, $auth, $http, $state, ngDialog, $location, $window) {
                $scope.images = {
                    fb: '/assets/fb.png',
                    in : '/assets/in.png',
                    mail: '/assets/mail.png',
                    fb_hov: '/assets/fb2.png',
                    in_hov: '/assets/in2.png',
                    mail_hov: '/assets/mail2.png',
                };

                $scope.formData = {};
                $scope.formValidation = {};
                $scope.formValidation.valid = false;
                $scope.signInData = {};
                $scope.errorMessage = "";
                $rootScope.userInfo = {};
                $scope.NAME_REGEXP = /^[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+(-[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+)?$/;
                $scope.EMAIL_REGEXP = /^[_a-zA-Z0-9]+(\.[_a-zA-Z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,10})$/;
                $scope.PASSWORD_REGEXP = /^[A-Za-z0-9]{6,16}$/;

                $scope.getErrorFName = function(error) {
                    if (angular.isDefined(error)) {
                        if (error.required) {
                            return "First name is required.";
                        } else if (error.pattern) {
                            return "First name is invalid.";
                        }
                    }
                };

                $scope.getErrorLName = function(error) {
                    if (angular.isDefined(error)) {
                        if (error.required) {
                            return "Last name is required.";
                        } else if (error.pattern) {
                            return "Last name is invalid.";
                        }
                    }
                };

                $scope.getErrorEmail = function(error) {
                    if (angular.isDefined(error)) {
                        if (error.required) {
                            return "Email is required.";
                        } else if (error.pattern) {
                            return "Email is invalid.";
                        }
                    }
                };

                $scope.getErrorPassword = function(error) {
                    if (angular.isDefined(error)) {
                        if (error.required) {
                            return "Password is required.";
                        } else if (error.pattern) {
                            return "Password is invalid.";
                        }
                    }
                };

                $scope.closeModal = function() {
                    $(".modal-backdrop").hide();
                };

                $scope.signin = function(params) {
                    $auth.submitLogin({
                            email: params.email,
                            password: params.password
                        })
                        .then(function(resp) {
                            $scope.closeModal();
                            $state.go('auth.start');
                        })
                        .catch(function(resp) {
                            $window.alert('Wrong email or password!');
                        });
                };

                $scope.signup = function(params) {
                    $auth.submitRegistration({
                            email: params.email,
                            password: params.password,
                            name: params.fName,
                            surname: params.lName,
                            password_confirmation: params.password_confirmation
                        })
                        .then(function(resp) {
                            $window.alert('Registration completed!');
                            $scope.closeModal();
                            $state.go('auth.start');
                        })
                        .catch(function(resp) {
                            $window.alert('error response');
                        });
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

                $scope.beginTest = function(){
                  $state.go('auth.test')
                };
                

                // $scope.selectTab = function(setTab) {
                //     $scope.tab = setTab;
                // };
                // $scope.isSelected = function(checkTab) {
                //     return $scope.tab === checkTab;
                // };

                // $rootScope.$on('auth:login-success', function(ev, user) {
                //   console.log(user.name+' '+user.surname);
                //   alert('Welcome ' + user.name);
                // });
                // $scope.authSignin = function() {
                //     $auth.submitLogin($scope.signInData)
                //         .then(function(resp) {
                //             $rootScope.userInfo.name = resp.name;
                //             $rootScope.userInfo.surname = resp.surname;
                //             ngDialog.close();
                //             $state.go('auth.start');
                //         })
                //         .catch(function(resp) {
                //             $scope.errorMessage = "Incorrect login";
                //         });
                // };
                //
                // $scope.comparePasswords = function() {
                //     return $scope.formData.password == $scope.formData.password_confirmation;
                // };
                //
                // $scope.isFormValid = function() {
                //     return ($scope.formValidation.valid && $scope.comparePasswords());
                // };
                //
                // $scope.processForm = function() {
                //     $auth.submitRegistration($scope.formData)
                //         .then(function(resp) {
                //             $rootScope.userInfo.name = resp.name;
                //             $rootScope.userInfo.surname = resp.surname;
                //             console.log("success");
                //             ngDialog.close();
                //             $state.go('auth.start');
                //         })
                //         .catch(function(resp) {
                //             console.log("registration error");
                //         });
                // };
            }
        ]);


}());
