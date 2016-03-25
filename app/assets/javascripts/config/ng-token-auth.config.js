angular.module('ng-token-auth.config', ['ng-token-auth'])
.config(function($authProvider) {
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
});
