(function() {
    'use strict';
    angular.module('app')
        .config(['$authProvider', "$httpProvider", function($authProvider, $httpProvider) {

          $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');

        }]);

}());
