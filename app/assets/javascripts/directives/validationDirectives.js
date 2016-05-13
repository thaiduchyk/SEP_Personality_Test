'use strict';
(function() {
    angular.module('app')
     .directive('overwriteEmail', function() {
        var EMAIL_REGEXP = /^[_a-zA-Z0-9]+(\.[_a-zA-Z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,10})$/;

        return {
            require: '?ngModel',
            link: function(scope, elm, attrs, ctrl) {
            if (ctrl && ctrl.$validators.email) {
                ctrl.$validators.email = function(modelValue) {
                return ctrl.$isEmpty(modelValue) || EMAIL_REGEXP.test(modelValue);
                };
            }
            }
        };
        })
        
        .directive('overwritePassword', function() {
        var PASSWORD_REGEXP = /[A-Za-z0-9]{6,16}/;
        
        return {
            require: '?ngModel',
            link: function(scope, elm, attrs, ctrl) {
            if (ctrl && ctrl.$validators.password) {
                ctrl.$validators.password = function(modelValue) {
                return ctrl.$isEmpty(modelValue) || PASSWORD_REGEXP.test(modelValue);
                };
            }
            }
        };
        });
        
        
           
        
}());