'use strict';
(function() {
    angular.module('app')
    
        .controller('FormController', ['$scope', function($scope) {
            $scope.NAME_REGEXP = /^[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+(-[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+)?$/;
            
    // $scope.email = { name:'logEmail'};
    // $scope.password = { name: 'logPassword'};
}]);
        // .directive('formSpan', function() {
        // return {
        //     restrict: 'E',
        //     scope: {
        //     spanInfo: '=info'
        //     },
        //     templateUrl: 'form-span.html'
        // };
        // });


}());
