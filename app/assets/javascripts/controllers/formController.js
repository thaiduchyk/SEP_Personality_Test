'use strict';
(function() {
    angular.module('app')
        .controller('FormController', ['$scope', function($scope) {
            $scope.NAME_REGEXP = /^[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+(-[A-ZА-ЯЄІЇҐ][a-zа-яєіїґ]*'?[a-zа-яєіїґ]+)?$/;
}])

}());
