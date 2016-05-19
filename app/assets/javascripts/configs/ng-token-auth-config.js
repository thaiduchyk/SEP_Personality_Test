(function() {
    'use strict';
    angular.module('app')
        .config(['$authProvider', "$httpProvider", function($authProvider, $httpProvider) {

            $authProvider.configure({
               apiUrl: 'http://localhost:3000/api/v1',
               forceValidateToken: true
            });

            // $authProvider.configure({
            //         apiUrl: '/api/v1',
            //         emailSignInPath: '/auth/sign_in',
            //         emailRegistrationPath: '/auth/sign_up',
            //         tokenValidationPath: '/auth/validate_token',
            //         signOutUrl: '/auth/sign_out',
            //         authProviderPaths: {
            //             facebook: '/auth/facebook',
            //             linkedin: '/auth/linkedin'
            //         }
            //     });

        }]);

}());
