(function() {
    'use strict';
    angular.module('app')
        .config(['$authProvider', function($authProvider) {

            //$authProvider.configure({
            //    apiUrl: 'http://localhost:3000',
            //    forceValidateToken: true
            //});

            $authProvider.configure({
                    apiUrl: '/api/v1',
                    emailSignInPath: '/auth/sign_in',
                    emailRegistrationPath: '/auth',
                    tokenValidationPath: '/auth/validate_token',
                    signOutUrl: '/auth/sign_out',
                    authProviderPaths: {
                        facebook: '/auth/facebook',
                        linkedin: '/auth/linkedin'
                    }
                });

        }]);

}());